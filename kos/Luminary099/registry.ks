global agcAotRoutes is lexicon().
global agcAotRomBanks is lexicon().

// Fill in the rope words that are written next to their source lines.
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
    if slot <= 21430 {
        if slot <= 10425 {
            if slot <= 5653 {
                if slot <= 4388 {
                    if slot <= 3456 {
                        if slot <= 3006 {
                            if slot <= 2599 {
                                if slot <= 2259 {
                                    if slot <= 2136 {
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
                                                if slot <= 2134 {
                                                    if slot < 2071 or slot > 2134 { return -1. }
                                                    return 3.
                                                } else {
                                                    if slot < 2135 or slot > 2136 { return -1. }
                                                    return 4.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 2202 {
                                            if slot <= 2179 {
                                                if slot < 2137 or slot > 2179 { return -1. }
                                                return 5.
                                            } else {
                                                if slot < 2180 or slot > 2202 { return -1. }
                                                return 6.
                                            }
                                        } else {
                                            if slot <= 2232 {
                                                if slot < 2203 or slot > 2232 { return -1. }
                                                return 7.
                                            } else {
                                                if slot <= 2252 {
                                                    if slot < 2233 or slot > 2252 { return -1. }
                                                    return 8.
                                                } else {
                                                    if slot < 2253 or slot > 2259 { return -1. }
                                                    return 9.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 2422 {
                                        if slot <= 2340 {
                                            if slot <= 2311 {
                                                if slot < 2260 or slot > 2311 { return -1. }
                                                return 10.
                                            } else {
                                                if slot < 2312 or slot > 2340 { return -1. }
                                                return 11.
                                            }
                                        } else {
                                            if slot <= 2360 {
                                                if slot < 2341 or slot > 2360 { return -1. }
                                                return 12.
                                            } else {
                                                if slot <= 2379 {
                                                    if slot < 2361 or slot > 2379 { return -1. }
                                                    return 13.
                                                } else {
                                                    if slot < 2380 or slot > 2422 { return -1. }
                                                    return 14.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 2567 {
                                            if slot <= 2443 {
                                                if slot < 2423 or slot > 2443 { return -1. }
                                                return 15.
                                            } else {
                                                if slot < 2444 or slot > 2567 { return -1. }
                                                return 16.
                                            }
                                        } else {
                                            if slot <= 2573 {
                                                if slot < 2568 or slot > 2573 { return -1. }
                                                return 17.
                                            } else {
                                                if slot <= 2593 {
                                                    if slot < 2574 or slot > 2593 { return -1. }
                                                    return 18.
                                                } else {
                                                    if slot < 2594 or slot > 2599 { return -1. }
                                                    return 19.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 2722 {
                                    if slot <= 2683 {
                                        if slot <= 2635 {
                                            if slot <= 2624 {
                                                if slot < 2600 or slot > 2624 { return -1. }
                                                return 20.
                                            } else {
                                                if slot < 2625 or slot > 2635 { return -1. }
                                                return 21.
                                            }
                                        } else {
                                            if slot <= 2661 {
                                                if slot < 2636 or slot > 2661 { return -1. }
                                                return 22.
                                            } else {
                                                if slot <= 2679 {
                                                    if slot < 2662 or slot > 2679 { return -1. }
                                                    return 23.
                                                } else {
                                                    if slot < 2680 or slot > 2683 { return -1. }
                                                    return 24.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 2706 {
                                            if slot <= 2694 {
                                                if slot < 2684 or slot > 2694 { return -1. }
                                                return 25.
                                            } else {
                                                if slot < 2695 or slot > 2706 { return -1. }
                                                return 26.
                                            }
                                        } else {
                                            if slot <= 2710 {
                                                if slot < 2707 or slot > 2710 { return -1. }
                                                return 27.
                                            } else {
                                                if slot <= 2718 {
                                                    if slot < 2711 or slot > 2718 { return -1. }
                                                    return 28.
                                                } else {
                                                    if slot < 2719 or slot > 2722 { return -1. }
                                                    return 29.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 2749 {
                                        if slot <= 2732 {
                                            if slot <= 2730 {
                                                if slot < 2723 or slot > 2730 { return -1. }
                                                return 30.
                                            } else {
                                                if slot < 2731 or slot > 2732 { return -1. }
                                                return 31.
                                            }
                                        } else {
                                            if slot <= 2740 {
                                                if slot < 2733 or slot > 2740 { return -1. }
                                                return 32.
                                            } else {
                                                if slot <= 2744 {
                                                    if slot < 2741 or slot > 2744 { return -1. }
                                                    return 33.
                                                } else {
                                                    if slot < 2745 or slot > 2749 { return -1. }
                                                    return 34.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 2916 {
                                            if slot <= 2820 {
                                                if slot < 2750 or slot > 2820 { return -1. }
                                                return 35.
                                            } else {
                                                if slot <= 2846 {
                                                    if slot < 2821 or slot > 2846 { return -1. }
                                                    return 36.
                                                } else {
                                                    if slot < 2847 or slot > 2916 { return -1. }
                                                    return 37.
                                                }
                                            }
                                        } else {
                                            if slot <= 2938 {
                                                if slot < 2917 or slot > 2938 { return -1. }
                                                return 38.
                                            } else {
                                                if slot <= 2986 {
                                                    if slot < 2939 or slot > 2986 { return -1. }
                                                    return 39.
                                                } else {
                                                    if slot < 2987 or slot > 3006 { return -1. }
                                                    return 40.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 3314 {
                                if slot <= 3085 {
                                    if slot <= 3042 {
                                        if slot <= 3030 {
                                            if slot <= 3021 {
                                                if slot < 3007 or slot > 3021 { return -1. }
                                                return 41.
                                            } else {
                                                if slot < 3022 or slot > 3030 { return -1. }
                                                return 42.
                                            }
                                        } else {
                                            if slot <= 3035 {
                                                if slot < 3031 or slot > 3035 { return -1. }
                                                return 43.
                                            } else {
                                                if slot <= 3036 {
                                                    if slot < 3036 or slot > 3036 { return -1. }
                                                    return 44.
                                                } else {
                                                    if slot < 3037 or slot > 3042 { return -1. }
                                                    return 45.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3059 {
                                            if slot <= 3049 {
                                                if slot < 3043 or slot > 3049 { return -1. }
                                                return 46.
                                            } else {
                                                if slot < 3050 or slot > 3059 { return -1. }
                                                return 47.
                                            }
                                        } else {
                                            if slot <= 3063 {
                                                if slot < 3060 or slot > 3063 { return -1. }
                                                return 48.
                                            } else {
                                                if slot <= 3065 {
                                                    if slot < 3064 or slot > 3065 { return -1. }
                                                    return 49.
                                                } else {
                                                    if slot < 3074 or slot > 3085 { return -1. }
                                                    return 50.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3281 {
                                        if slot <= 3238 {
                                            if slot <= 3229 {
                                                if slot < 3206 or slot > 3229 { return -1. }
                                                return 51.
                                            } else {
                                                if slot < 3230 or slot > 3238 { return -1. }
                                                return 52.
                                            }
                                        } else {
                                            if slot <= 3262 {
                                                if slot < 3239 or slot > 3262 { return -1. }
                                                return 53.
                                            } else {
                                                if slot <= 3270 {
                                                    if slot < 3263 or slot > 3270 { return -1. }
                                                    return 54.
                                                } else {
                                                    if slot < 3271 or slot > 3281 { return -1. }
                                                    return 55.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3291 {
                                            if slot <= 3285 {
                                                if slot < 3282 or slot > 3285 { return -1. }
                                                return 56.
                                            } else {
                                                if slot < 3286 or slot > 3291 { return -1. }
                                                return 57.
                                            }
                                        } else {
                                            if slot <= 3303 {
                                                if slot < 3300 or slot > 3303 { return -1. }
                                                return 58.
                                            } else {
                                                if slot <= 3310 {
                                                    if slot < 3304 or slot > 3310 { return -1. }
                                                    return 59.
                                                } else {
                                                    if slot < 3311 or slot > 3314 { return -1. }
                                                    return 60.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 3349 {
                                    if slot <= 3330 {
                                        if slot <= 3320 {
                                            if slot <= 3318 {
                                                if slot < 3315 or slot > 3318 { return -1. }
                                                return 61.
                                            } else {
                                                if slot < 3319 or slot > 3320 { return -1. }
                                                return 62.
                                            }
                                        } else {
                                            if slot <= 3324 {
                                                if slot < 3321 or slot > 3324 { return -1. }
                                                return 63.
                                            } else {
                                                if slot <= 3326 {
                                                    if slot < 3325 or slot > 3326 { return -1. }
                                                    return 64.
                                                } else {
                                                    if slot < 3327 or slot > 3330 { return -1. }
                                                    return 65.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3339 {
                                            if slot <= 3332 {
                                                if slot < 3331 or slot > 3332 { return -1. }
                                                return 66.
                                            } else {
                                                if slot < 3333 or slot > 3339 { return -1. }
                                                return 67.
                                            }
                                        } else {
                                            if slot <= 3343 {
                                                if slot < 3340 or slot > 3343 { return -1. }
                                                return 68.
                                            } else {
                                                if slot <= 3345 {
                                                    if slot < 3344 or slot > 3345 { return -1. }
                                                    return 69.
                                                } else {
                                                    if slot < 3346 or slot > 3349 { return -1. }
                                                    return 70.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3417 {
                                        if slot <= 3390 {
                                            if slot <= 3381 {
                                                if slot < 3350 or slot > 3381 { return -1. }
                                                return 71.
                                            } else {
                                                if slot < 3382 or slot > 3390 { return -1. }
                                                return 72.
                                            }
                                        } else {
                                            if slot <= 3404 {
                                                if slot < 3391 or slot > 3404 { return -1. }
                                                return 73.
                                            } else {
                                                if slot <= 3409 {
                                                    if slot < 3405 or slot > 3409 { return -1. }
                                                    return 74.
                                                } else {
                                                    if slot < 3410 or slot > 3417 { return -1. }
                                                    return 75.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3443 {
                                            if slot <= 3424 {
                                                if slot < 3418 or slot > 3424 { return -1. }
                                                return 76.
                                            } else {
                                                if slot <= 3436 {
                                                    if slot < 3425 or slot > 3436 { return -1. }
                                                    return 77.
                                                } else {
                                                    if slot < 3437 or slot > 3443 { return -1. }
                                                    return 78.
                                                }
                                            }
                                        } else {
                                            if slot <= 3448 {
                                                if slot < 3444 or slot > 3448 { return -1. }
                                                return 79.
                                            } else {
                                                if slot <= 3454 {
                                                    if slot < 3449 or slot > 3454 { return -1. }
                                                    return 80.
                                                } else {
                                                    if slot < 3455 or slot > 3456 { return -1. }
                                                    return 81.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 3843 {
                            if slot <= 3627 {
                                if slot <= 3531 {
                                    if slot <= 3488 {
                                        if slot <= 3475 {
                                            if slot <= 3471 {
                                                if slot < 3457 or slot > 3471 { return -1. }
                                                return 82.
                                            } else {
                                                if slot < 3472 or slot > 3475 { return -1. }
                                                return 83.
                                            }
                                        } else {
                                            if slot <= 3482 {
                                                if slot < 3476 or slot > 3482 { return -1. }
                                                return 84.
                                            } else {
                                                if slot <= 3484 {
                                                    if slot < 3483 or slot > 3484 { return -1. }
                                                    return 85.
                                                } else {
                                                    if slot < 3485 or slot > 3488 { return -1. }
                                                    return 86.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3507 {
                                            if slot <= 3491 {
                                                if slot < 3489 or slot > 3491 { return -1. }
                                                return 87.
                                            } else {
                                                if slot < 3492 or slot > 3507 { return -1. }
                                                return 88.
                                            }
                                        } else {
                                            if slot <= 3509 {
                                                if slot < 3508 or slot > 3509 { return -1. }
                                                return 89.
                                            } else {
                                                if slot <= 3523 {
                                                    if slot < 3510 or slot > 3523 { return -1. }
                                                    return 90.
                                                } else {
                                                    if slot < 3524 or slot > 3531 { return -1. }
                                                    return 91.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3560 {
                                        if slot <= 3542 {
                                            if slot <= 3538 {
                                                if slot < 3532 or slot > 3538 { return -1. }
                                                return 92.
                                            } else {
                                                if slot < 3539 or slot > 3542 { return -1. }
                                                return 93.
                                            }
                                        } else {
                                            if slot <= 3546 {
                                                if slot < 3543 or slot > 3546 { return -1. }
                                                return 94.
                                            } else {
                                                if slot <= 3550 {
                                                    if slot < 3547 or slot > 3550 { return -1. }
                                                    return 95.
                                                } else {
                                                    if slot < 3551 or slot > 3560 { return -1. }
                                                    return 96.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3609 {
                                            if slot <= 3599 {
                                                if slot < 3561 or slot > 3599 { return -1. }
                                                return 97.
                                            } else {
                                                if slot < 3600 or slot > 3609 { return -1. }
                                                return 98.
                                            }
                                        } else {
                                            if slot <= 3611 {
                                                if slot < 3610 or slot > 3611 { return -1. }
                                                return 99.
                                            } else {
                                                if slot <= 3622 {
                                                    if slot < 3612 or slot > 3622 { return -1. }
                                                    return 100.
                                                } else {
                                                    if slot < 3623 or slot > 3627 { return -1. }
                                                    return 101.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 3770 {
                                    if slot <= 3701 {
                                        if slot <= 3637 {
                                            if slot <= 3630 {
                                                if slot < 3628 or slot > 3630 { return -1. }
                                                return 102.
                                            } else {
                                                if slot < 3631 or slot > 3637 { return -1. }
                                                return 103.
                                            }
                                        } else {
                                            if slot <= 3663 {
                                                if slot < 3638 or slot > 3663 { return -1. }
                                                return 104.
                                            } else {
                                                if slot <= 3674 {
                                                    if slot < 3664 or slot > 3674 { return -1. }
                                                    return 105.
                                                } else {
                                                    if slot < 3675 or slot > 3701 { return -1. }
                                                    return 106.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3717 {
                                            if slot <= 3712 {
                                                if slot < 3702 or slot > 3712 { return -1. }
                                                return 107.
                                            } else {
                                                if slot < 3713 or slot > 3717 { return -1. }
                                                return 108.
                                            }
                                        } else {
                                            if slot <= 3732 {
                                                if slot < 3718 or slot > 3732 { return -1. }
                                                return 109.
                                            } else {
                                                if slot <= 3736 {
                                                    if slot < 3733 or slot > 3736 { return -1. }
                                                    return 110.
                                                } else {
                                                    if slot < 3737 or slot > 3770 { return -1. }
                                                    return 111.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3813 {
                                        if slot <= 3795 {
                                            if slot <= 3789 {
                                                if slot < 3771 or slot > 3789 { return -1. }
                                                return 112.
                                            } else {
                                                if slot < 3790 or slot > 3795 { return -1. }
                                                return 113.
                                            }
                                        } else {
                                            if slot <= 3801 {
                                                if slot < 3796 or slot > 3801 { return -1. }
                                                return 114.
                                            } else {
                                                if slot <= 3807 {
                                                    if slot < 3802 or slot > 3807 { return -1. }
                                                    return 115.
                                                } else {
                                                    if slot < 3808 or slot > 3813 { return -1. }
                                                    return 116.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3832 {
                                            if slot <= 3819 {
                                                if slot < 3814 or slot > 3819 { return -1. }
                                                return 117.
                                            } else {
                                                if slot <= 3825 {
                                                    if slot < 3820 or slot > 3825 { return -1. }
                                                    return 118.
                                                } else {
                                                    if slot < 3826 or slot > 3832 { return -1. }
                                                    return 119.
                                                }
                                            }
                                        } else {
                                            if slot <= 3835 {
                                                if slot < 3833 or slot > 3835 { return -1. }
                                                return 120.
                                            } else {
                                                if slot <= 3838 {
                                                    if slot < 3836 or slot > 3838 { return -1. }
                                                    return 121.
                                                } else {
                                                    if slot < 3839 or slot > 3843 { return -1. }
                                                    return 122.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 4064 {
                                if slot <= 3950 {
                                    if slot <= 3909 {
                                        if slot <= 3878 {
                                            if slot <= 3846 {
                                                if slot < 3844 or slot > 3846 { return -1. }
                                                return 123.
                                            } else {
                                                if slot < 3847 or slot > 3878 { return -1. }
                                                return 124.
                                            }
                                        } else {
                                            if slot <= 3881 {
                                                if slot < 3879 or slot > 3881 { return -1. }
                                                return 125.
                                            } else {
                                                if slot <= 3904 {
                                                    if slot < 3882 or slot > 3904 { return -1. }
                                                    return 126.
                                                } else {
                                                    if slot < 3905 or slot > 3909 { return -1. }
                                                    return 127.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 3920 {
                                            if slot <= 3916 {
                                                if slot < 3910 or slot > 3916 { return -1. }
                                                return 128.
                                            } else {
                                                if slot < 3917 or slot > 3920 { return -1. }
                                                return 129.
                                            }
                                        } else {
                                            if slot <= 3924 {
                                                if slot < 3921 or slot > 3924 { return -1. }
                                                return 130.
                                            } else {
                                                if slot <= 3943 {
                                                    if slot < 3926 or slot > 3943 { return -1. }
                                                    return 131.
                                                } else {
                                                    if slot < 3944 or slot > 3950 { return -1. }
                                                    return 132.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3998 {
                                        if slot <= 3968 {
                                            if slot <= 3963 {
                                                if slot < 3951 or slot > 3963 { return -1. }
                                                return 133.
                                            } else {
                                                if slot < 3964 or slot > 3968 { return -1. }
                                                return 134.
                                            }
                                        } else {
                                            if slot <= 3972 {
                                                if slot < 3969 or slot > 3972 { return -1. }
                                                return 135.
                                            } else {
                                                if slot <= 3995 {
                                                    if slot < 3973 or slot > 3995 { return -1. }
                                                    return 136.
                                                } else {
                                                    if slot < 3996 or slot > 3998 { return -1. }
                                                    return 137.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4037 {
                                            if slot <= 4019 {
                                                if slot < 3999 or slot > 4019 { return -1. }
                                                return 138.
                                            } else {
                                                if slot <= 4023 {
                                                    if slot < 4020 or slot > 4023 { return -1. }
                                                    return 139.
                                                } else {
                                                    if slot < 4024 or slot > 4037 { return -1. }
                                                    return 140.
                                                }
                                            }
                                        } else {
                                            if slot <= 4038 {
                                                if slot < 4038 or slot > 4038 { return -1. }
                                                return 141.
                                            } else {
                                                if slot <= 4063 {
                                                    if slot < 4039 or slot > 4063 { return -1. }
                                                    return 142.
                                                } else {
                                                    if slot < 4064 or slot > 4064 { return -1. }
                                                    return 143.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 4203 {
                                    if slot <= 4139 {
                                        if slot <= 4072 {
                                            if slot <= 4068 {
                                                if slot < 4065 or slot > 4068 { return -1. }
                                                return 144.
                                            } else {
                                                if slot < 4069 or slot > 4072 { return -1. }
                                                return 145.
                                            }
                                        } else {
                                            if slot <= 4077 {
                                                if slot < 4073 or slot > 4077 { return -1. }
                                                return 146.
                                            } else {
                                                if slot <= 4087 {
                                                    if slot < 4078 or slot > 4087 { return -1. }
                                                    return 147.
                                                } else {
                                                    if slot < 4096 or slot > 4139 { return -1. }
                                                    return 148.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4189 {
                                            if slot <= 4179 {
                                                if slot < 4162 or slot > 4179 { return -1. }
                                                return 149.
                                            } else {
                                                if slot < 4180 or slot > 4189 { return -1. }
                                                return 150.
                                            }
                                        } else {
                                            if slot <= 4196 {
                                                if slot < 4190 or slot > 4196 { return -1. }
                                                return 151.
                                            } else {
                                                if slot <= 4201 {
                                                    if slot < 4197 or slot > 4201 { return -1. }
                                                    return 152.
                                                } else {
                                                    if slot < 4202 or slot > 4203 { return -1. }
                                                    return 153.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4268 {
                                        if slot <= 4227 {
                                            if slot <= 4225 {
                                                if slot < 4204 or slot > 4225 { return -1. }
                                                return 154.
                                            } else {
                                                if slot < 4226 or slot > 4227 { return -1. }
                                                return 155.
                                            }
                                        } else {
                                            if slot <= 4248 {
                                                if slot < 4228 or slot > 4248 { return -1. }
                                                return 156.
                                            } else {
                                                if slot <= 4258 {
                                                    if slot < 4249 or slot > 4258 { return -1. }
                                                    return 157.
                                                } else {
                                                    if slot < 4259 or slot > 4268 { return -1. }
                                                    return 158.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4321 {
                                            if slot <= 4290 {
                                                if slot < 4269 or slot > 4290 { return -1. }
                                                return 159.
                                            } else {
                                                if slot <= 4305 {
                                                    if slot < 4291 or slot > 4305 { return -1. }
                                                    return 160.
                                                } else {
                                                    if slot < 4306 or slot > 4321 { return -1. }
                                                    return 161.
                                                }
                                            }
                                        } else {
                                            if slot <= 4328 {
                                                if slot < 4322 or slot > 4328 { return -1. }
                                                return 162.
                                            } else {
                                                if slot <= 4339 {
                                                    if slot < 4329 or slot > 4339 { return -1. }
                                                    return 163.
                                                } else {
                                                    if slot < 4340 or slot > 4388 { return -1. }
                                                    return 164.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 5097 {
                        if slot <= 4845 {
                            if slot <= 4664 {
                                if slot <= 4496 {
                                    if slot <= 4453 {
                                        if slot <= 4431 {
                                            if slot <= 4425 {
                                                if slot < 4389 or slot > 4425 { return -1. }
                                                return 165.
                                            } else {
                                                if slot < 4426 or slot > 4431 { return -1. }
                                                return 166.
                                            }
                                        } else {
                                            if slot <= 4438 {
                                                if slot < 4432 or slot > 4438 { return -1. }
                                                return 167.
                                            } else {
                                                if slot <= 4448 {
                                                    if slot < 4439 or slot > 4448 { return -1. }
                                                    return 168.
                                                } else {
                                                    if slot < 4449 or slot > 4453 { return -1. }
                                                    return 169.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4463 {
                                            if slot <= 4459 {
                                                if slot < 4454 or slot > 4459 { return -1. }
                                                return 170.
                                            } else {
                                                if slot < 4460 or slot > 4463 { return -1. }
                                                return 171.
                                            }
                                        } else {
                                            if slot <= 4467 {
                                                if slot < 4464 or slot > 4467 { return -1. }
                                                return 172.
                                            } else {
                                                if slot <= 4492 {
                                                    if slot < 4468 or slot > 4492 { return -1. }
                                                    return 173.
                                                } else {
                                                    if slot < 4494 or slot > 4496 { return -1. }
                                                    return 174.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4542 {
                                        if slot <= 4511 {
                                            if slot <= 4504 {
                                                if slot < 4497 or slot > 4504 { return -1. }
                                                return 175.
                                            } else {
                                                if slot < 4505 or slot > 4511 { return -1. }
                                                return 176.
                                            }
                                        } else {
                                            if slot <= 4516 {
                                                if slot < 4512 or slot > 4516 { return -1. }
                                                return 177.
                                            } else {
                                                if slot <= 4532 {
                                                    if slot < 4517 or slot > 4532 { return -1. }
                                                    return 178.
                                                } else {
                                                    if slot < 4533 or slot > 4542 { return -1. }
                                                    return 179.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4561 {
                                            if slot <= 4550 {
                                                if slot < 4543 or slot > 4550 { return -1. }
                                                return 180.
                                            } else {
                                                if slot < 4551 or slot > 4561 { return -1. }
                                                return 181.
                                            }
                                        } else {
                                            if slot <= 4569 {
                                                if slot < 4562 or slot > 4569 { return -1. }
                                                return 182.
                                            } else {
                                                if slot <= 4643 {
                                                    if slot < 4634 or slot > 4643 { return -1. }
                                                    return 183.
                                                } else {
                                                    if slot < 4644 or slot > 4664 { return -1. }
                                                    return 184.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 4780 {
                                    if slot <= 4729 {
                                        if slot <= 4671 {
                                            if slot <= 4665 {
                                                if slot < 4665 or slot > 4665 { return -1. }
                                                return 185.
                                            } else {
                                                if slot < 4666 or slot > 4671 { return -1. }
                                                return 186.
                                            }
                                        } else {
                                            if slot <= 4681 {
                                                if slot < 4672 or slot > 4681 { return -1. }
                                                return 187.
                                            } else {
                                                if slot <= 4724 {
                                                    if slot < 4682 or slot > 4724 { return -1. }
                                                    return 188.
                                                } else {
                                                    if slot < 4725 or slot > 4729 { return -1. }
                                                    return 189.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4752 {
                                            if slot <= 4744 {
                                                if slot < 4731 or slot > 4744 { return -1. }
                                                return 190.
                                            } else {
                                                if slot < 4745 or slot > 4752 { return -1. }
                                                return 191.
                                            }
                                        } else {
                                            if slot <= 4754 {
                                                if slot < 4753 or slot > 4754 { return -1. }
                                                return 192.
                                            } else {
                                                if slot <= 4767 {
                                                    if slot < 4755 or slot > 4767 { return -1. }
                                                    return 193.
                                                } else {
                                                    if slot < 4768 or slot > 4780 { return -1. }
                                                    return 194.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4810 {
                                        if slot <= 4784 {
                                            if slot <= 4783 {
                                                if slot < 4781 or slot > 4783 { return -1. }
                                                return 195.
                                            } else {
                                                if slot < 4784 or slot > 4784 { return -1. }
                                                return 196.
                                            }
                                        } else {
                                            if slot <= 4802 {
                                                if slot < 4785 or slot > 4802 { return -1. }
                                                return 197.
                                            } else {
                                                if slot <= 4806 {
                                                    if slot < 4803 or slot > 4806 { return -1. }
                                                    return 198.
                                                } else {
                                                    if slot < 4809 or slot > 4810 { return -1. }
                                                    return 199.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4822 {
                                            if slot <= 4816 {
                                                if slot < 4811 or slot > 4816 { return -1. }
                                                return 200.
                                            } else {
                                                if slot <= 4818 {
                                                    if slot < 4817 or slot > 4818 { return -1. }
                                                    return 201.
                                                } else {
                                                    if slot < 4819 or slot > 4822 { return -1. }
                                                    return 202.
                                                }
                                            }
                                        } else {
                                            if slot <= 4825 {
                                                if slot < 4823 or slot > 4825 { return -1. }
                                                return 203.
                                            } else {
                                                if slot <= 4839 {
                                                    if slot < 4826 or slot > 4839 { return -1. }
                                                    return 204.
                                                } else {
                                                    if slot < 4840 or slot > 4845 { return -1. }
                                                    return 205.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 4969 {
                                if slot <= 4910 {
                                    if slot <= 4889 {
                                        if slot <= 4867 {
                                            if slot <= 4855 {
                                                if slot < 4846 or slot > 4855 { return -1. }
                                                return 206.
                                            } else {
                                                if slot < 4856 or slot > 4867 { return -1. }
                                                return 207.
                                            }
                                        } else {
                                            if slot <= 4882 {
                                                if slot < 4868 or slot > 4882 { return -1. }
                                                return 208.
                                            } else {
                                                if slot <= 4884 {
                                                    if slot < 4883 or slot > 4884 { return -1. }
                                                    return 209.
                                                } else {
                                                    if slot < 4885 or slot > 4889 { return -1. }
                                                    return 210.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4897 {
                                            if slot <= 4893 {
                                                if slot < 4890 or slot > 4893 { return -1. }
                                                return 211.
                                            } else {
                                                if slot < 4894 or slot > 4897 { return -1. }
                                                return 212.
                                            }
                                        } else {
                                            if slot <= 4900 {
                                                if slot < 4898 or slot > 4900 { return -1. }
                                                return 213.
                                            } else {
                                                if slot <= 4906 {
                                                    if slot < 4901 or slot > 4906 { return -1. }
                                                    return 214.
                                                } else {
                                                    if slot < 4907 or slot > 4910 { return -1. }
                                                    return 215.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4938 {
                                        if slot <= 4920 {
                                            if slot <= 4915 {
                                                if slot < 4911 or slot > 4915 { return -1. }
                                                return 216.
                                            } else {
                                                if slot < 4916 or slot > 4920 { return -1. }
                                                return 217.
                                            }
                                        } else {
                                            if slot <= 4923 {
                                                if slot < 4921 or slot > 4923 { return -1. }
                                                return 218.
                                            } else {
                                                if slot <= 4931 {
                                                    if slot < 4924 or slot > 4931 { return -1. }
                                                    return 219.
                                                } else {
                                                    if slot < 4932 or slot > 4938 { return -1. }
                                                    return 220.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4962 {
                                            if slot <= 4952 {
                                                if slot < 4939 or slot > 4952 { return -1. }
                                                return 221.
                                            } else {
                                                if slot <= 4959 {
                                                    if slot < 4953 or slot > 4959 { return -1. }
                                                    return 222.
                                                } else {
                                                    if slot < 4960 or slot > 4962 { return -1. }
                                                    return 223.
                                                }
                                            }
                                        } else {
                                            if slot <= 4963 {
                                                if slot < 4963 or slot > 4963 { return -1. }
                                                return 224.
                                            } else {
                                                if slot <= 4967 {
                                                    if slot < 4964 or slot > 4967 { return -1. }
                                                    return 225.
                                                } else {
                                                    if slot < 4968 or slot > 4969 { return -1. }
                                                    return 226.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 5038 {
                                    if slot <= 5015 {
                                        if slot <= 4975 {
                                            if slot <= 4973 {
                                                if slot < 4970 or slot > 4973 { return -1. }
                                                return 227.
                                            } else {
                                                if slot < 4974 or slot > 4975 { return -1. }
                                                return 228.
                                            }
                                        } else {
                                            if slot <= 4982 {
                                                if slot < 4976 or slot > 4982 { return -1. }
                                                return 229.
                                            } else {
                                                if slot <= 4987 {
                                                    if slot < 4983 or slot > 4987 { return -1. }
                                                    return 230.
                                                } else {
                                                    if slot < 4988 or slot > 5015 { return -1. }
                                                    return 231.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5024 {
                                            if slot <= 5019 {
                                                if slot < 5016 or slot > 5019 { return -1. }
                                                return 232.
                                            } else {
                                                if slot < 5020 or slot > 5024 { return -1. }
                                                return 233.
                                            }
                                        } else {
                                            if slot <= 5026 {
                                                if slot < 5025 or slot > 5026 { return -1. }
                                                return 234.
                                            } else {
                                                if slot <= 5033 {
                                                    if slot < 5027 or slot > 5033 { return -1. }
                                                    return 235.
                                                } else {
                                                    if slot < 5034 or slot > 5038 { return -1. }
                                                    return 236.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5060 {
                                        if slot <= 5047 {
                                            if slot <= 5040 {
                                                if slot < 5039 or slot > 5040 { return -1. }
                                                return 237.
                                            } else {
                                                if slot < 5041 or slot > 5047 { return -1. }
                                                return 238.
                                            }
                                        } else {
                                            if slot <= 5053 {
                                                if slot < 5048 or slot > 5053 { return -1. }
                                                return 239.
                                            } else {
                                                if slot <= 5055 {
                                                    if slot < 5054 or slot > 5055 { return -1. }
                                                    return 240.
                                                } else {
                                                    if slot < 5056 or slot > 5060 { return -1. }
                                                    return 241.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5075 {
                                            if slot <= 5064 {
                                                if slot < 5061 or slot > 5064 { return -1. }
                                                return 242.
                                            } else {
                                                if slot <= 5068 {
                                                    if slot < 5065 or slot > 5068 { return -1. }
                                                    return 243.
                                                } else {
                                                    if slot < 5069 or slot > 5075 { return -1. }
                                                    return 244.
                                                }
                                            }
                                        } else {
                                            if slot <= 5086 {
                                                if slot < 5076 or slot > 5086 { return -1. }
                                                return 245.
                                            } else {
                                                if slot <= 5091 {
                                                    if slot < 5087 or slot > 5091 { return -1. }
                                                    return 246.
                                                } else {
                                                    if slot < 5092 or slot > 5097 { return -1. }
                                                    return 247.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 5437 {
                            if slot <= 5266 {
                                if slot <= 5180 {
                                    if slot <= 5140 {
                                        if slot <= 5115 {
                                            if slot <= 5098 {
                                                if slot < 5098 or slot > 5098 { return -1. }
                                                return 248.
                                            } else {
                                                if slot < 5099 or slot > 5115 { return -1. }
                                                return 249.
                                            }
                                        } else {
                                            if slot <= 5125 {
                                                if slot < 5121 or slot > 5125 { return -1. }
                                                return 250.
                                            } else {
                                                if slot <= 5137 {
                                                    if slot < 5129 or slot > 5137 { return -1. }
                                                    return 251.
                                                } else {
                                                    if slot < 5138 or slot > 5140 { return -1. }
                                                    return 252.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5149 {
                                            if slot <= 5147 {
                                                if slot < 5143 or slot > 5147 { return -1. }
                                                return 253.
                                            } else {
                                                if slot < 5148 or slot > 5149 { return -1. }
                                                return 254.
                                            }
                                        } else {
                                            if slot <= 5164 {
                                                if slot < 5151 or slot > 5164 { return -1. }
                                                return 255.
                                            } else {
                                                if slot <= 5177 {
                                                    if slot < 5165 or slot > 5177 { return -1. }
                                                    return 256.
                                                } else {
                                                    if slot < 5178 or slot > 5180 { return -1. }
                                                    return 257.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5219 {
                                        if slot <= 5194 {
                                            if slot <= 5191 {
                                                if slot < 5181 or slot > 5191 { return -1. }
                                                return 258.
                                            } else {
                                                if slot < 5192 or slot > 5194 { return -1. }
                                                return 259.
                                            }
                                        } else {
                                            if slot <= 5204 {
                                                if slot < 5195 or slot > 5204 { return -1. }
                                                return 260.
                                            } else {
                                                if slot <= 5213 {
                                                    if slot < 5205 or slot > 5213 { return -1. }
                                                    return 261.
                                                } else {
                                                    if slot < 5214 or slot > 5219 { return -1. }
                                                    return 262.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5237 {
                                            if slot <= 5226 {
                                                if slot < 5220 or slot > 5226 { return -1. }
                                                return 263.
                                            } else {
                                                if slot < 5227 or slot > 5237 { return -1. }
                                                return 264.
                                            }
                                        } else {
                                            if slot <= 5251 {
                                                if slot < 5238 or slot > 5251 { return -1. }
                                                return 265.
                                            } else {
                                                if slot <= 5260 {
                                                    if slot < 5252 or slot > 5260 { return -1. }
                                                    return 266.
                                                } else {
                                                    if slot < 5261 or slot > 5266 { return -1. }
                                                    return 267.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 5307 {
                                    if slot <= 5289 {
                                        if slot <= 5273 {
                                            if slot <= 5270 {
                                                if slot < 5267 or slot > 5270 { return -1. }
                                                return 268.
                                            } else {
                                                if slot < 5271 or slot > 5273 { return -1. }
                                                return 269.
                                            }
                                        } else {
                                            if slot <= 5276 {
                                                if slot < 5274 or slot > 5276 { return -1. }
                                                return 270.
                                            } else {
                                                if slot <= 5286 {
                                                    if slot < 5277 or slot > 5286 { return -1. }
                                                    return 271.
                                                } else {
                                                    if slot < 5287 or slot > 5289 { return -1. }
                                                    return 272.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5298 {
                                            if slot <= 5292 {
                                                if slot < 5290 or slot > 5292 { return -1. }
                                                return 273.
                                            } else {
                                                if slot < 5293 or slot > 5298 { return -1. }
                                                return 274.
                                            }
                                        } else {
                                            if slot <= 5302 {
                                                if slot < 5299 or slot > 5302 { return -1. }
                                                return 275.
                                            } else {
                                                if slot <= 5305 {
                                                    if slot < 5303 or slot > 5305 { return -1. }
                                                    return 276.
                                                } else {
                                                    if slot < 5306 or slot > 5307 { return -1. }
                                                    return 277.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5392 {
                                        if slot <= 5360 {
                                            if slot <= 5355 {
                                                if slot < 5308 or slot > 5355 { return -1. }
                                                return 278.
                                            } else {
                                                if slot < 5356 or slot > 5360 { return -1. }
                                                return 279.
                                            }
                                        } else {
                                            if slot <= 5369 {
                                                if slot < 5361 or slot > 5369 { return -1. }
                                                return 280.
                                            } else {
                                                if slot <= 5389 {
                                                    if slot < 5370 or slot > 5389 { return -1. }
                                                    return 281.
                                                } else {
                                                    if slot < 5390 or slot > 5392 { return -1. }
                                                    return 282.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5418 {
                                            if slot <= 5407 {
                                                if slot < 5393 or slot > 5407 { return -1. }
                                                return 283.
                                            } else {
                                                if slot <= 5414 {
                                                    if slot < 5408 or slot > 5414 { return -1. }
                                                    return 284.
                                                } else {
                                                    if slot < 5415 or slot > 5418 { return -1. }
                                                    return 285.
                                                }
                                            }
                                        } else {
                                            if slot <= 5422 {
                                                if slot < 5419 or slot > 5422 { return -1. }
                                                return 286.
                                            } else {
                                                if slot <= 5433 {
                                                    if slot < 5423 or slot > 5433 { return -1. }
                                                    return 287.
                                                } else {
                                                    if slot < 5434 or slot > 5437 { return -1. }
                                                    return 288.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 5522 {
                                if slot <= 5478 {
                                    if slot <= 5455 {
                                        if slot <= 5445 {
                                            if slot <= 5443 {
                                                if slot < 5438 or slot > 5443 { return -1. }
                                                return 289.
                                            } else {
                                                if slot < 5444 or slot > 5445 { return -1. }
                                                return 290.
                                            }
                                        } else {
                                            if slot <= 5447 {
                                                if slot < 5446 or slot > 5447 { return -1. }
                                                return 291.
                                            } else {
                                                if slot <= 5451 {
                                                    if slot < 5448 or slot > 5451 { return -1. }
                                                    return 292.
                                                } else {
                                                    if slot < 5452 or slot > 5455 { return -1. }
                                                    return 293.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5464 {
                                            if slot <= 5461 {
                                                if slot < 5456 or slot > 5461 { return -1. }
                                                return 294.
                                            } else {
                                                if slot < 5462 or slot > 5464 { return -1. }
                                                return 295.
                                            }
                                        } else {
                                            if slot <= 5466 {
                                                if slot < 5465 or slot > 5466 { return -1. }
                                                return 296.
                                            } else {
                                                if slot <= 5475 {
                                                    if slot < 5467 or slot > 5475 { return -1. }
                                                    return 297.
                                                } else {
                                                    if slot < 5476 or slot > 5478 { return -1. }
                                                    return 298.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5501 {
                                        if slot <= 5489 {
                                            if slot <= 5485 {
                                                if slot < 5479 or slot > 5485 { return -1. }
                                                return 299.
                                            } else {
                                                if slot < 5486 or slot > 5489 { return -1. }
                                                return 300.
                                            }
                                        } else {
                                            if slot <= 5492 {
                                                if slot < 5490 or slot > 5492 { return -1. }
                                                return 301.
                                            } else {
                                                if slot <= 5494 {
                                                    if slot < 5493 or slot > 5494 { return -1. }
                                                    return 302.
                                                } else {
                                                    if slot < 5495 or slot > 5501 { return -1. }
                                                    return 303.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5510 {
                                            if slot <= 5504 {
                                                if slot < 5502 or slot > 5504 { return -1. }
                                                return 304.
                                            } else {
                                                if slot <= 5507 {
                                                    if slot < 5505 or slot > 5507 { return -1. }
                                                    return 305.
                                                } else {
                                                    if slot < 5508 or slot > 5510 { return -1. }
                                                    return 306.
                                                }
                                            }
                                        } else {
                                            if slot <= 5514 {
                                                if slot < 5511 or slot > 5514 { return -1. }
                                                return 307.
                                            } else {
                                                if slot <= 5518 {
                                                    if slot < 5515 or slot > 5518 { return -1. }
                                                    return 308.
                                                } else {
                                                    if slot < 5519 or slot > 5522 { return -1. }
                                                    return 309.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 5578 {
                                    if slot <= 5541 {
                                        if slot <= 5528 {
                                            if slot <= 5524 {
                                                if slot < 5523 or slot > 5524 { return -1. }
                                                return 310.
                                            } else {
                                                if slot < 5525 or slot > 5528 { return -1. }
                                                return 311.
                                            }
                                        } else {
                                            if slot <= 5530 {
                                                if slot < 5529 or slot > 5530 { return -1. }
                                                return 312.
                                            } else {
                                                if slot <= 5534 {
                                                    if slot < 5531 or slot > 5534 { return -1. }
                                                    return 313.
                                                } else {
                                                    if slot < 5535 or slot > 5541 { return -1. }
                                                    return 314.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5568 {
                                            if slot <= 5562 {
                                                if slot < 5542 or slot > 5562 { return -1. }
                                                return 315.
                                            } else {
                                                if slot < 5563 or slot > 5568 { return -1. }
                                                return 316.
                                            }
                                        } else {
                                            if slot <= 5572 {
                                                if slot < 5569 or slot > 5572 { return -1. }
                                                return 317.
                                            } else {
                                                if slot <= 5574 {
                                                    if slot < 5573 or slot > 5574 { return -1. }
                                                    return 318.
                                                } else {
                                                    if slot < 5575 or slot > 5578 { return -1. }
                                                    return 319.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5613 {
                                        if slot <= 5600 {
                                            if slot <= 5584 {
                                                if slot < 5579 or slot > 5584 { return -1. }
                                                return 320.
                                            } else {
                                                if slot < 5585 or slot > 5600 { return -1. }
                                                return 321.
                                            }
                                        } else {
                                            if slot <= 5602 {
                                                if slot < 5601 or slot > 5602 { return -1. }
                                                return 322.
                                            } else {
                                                if slot <= 5605 {
                                                    if slot < 5603 or slot > 5605 { return -1. }
                                                    return 323.
                                                } else {
                                                    if slot < 5607 or slot > 5613 { return -1. }
                                                    return 324.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5631 {
                                            if slot <= 5620 {
                                                if slot < 5614 or slot > 5620 { return -1. }
                                                return 325.
                                            } else {
                                                if slot <= 5627 {
                                                    if slot < 5621 or slot > 5627 { return -1. }
                                                    return 326.
                                                } else {
                                                    if slot < 5628 or slot > 5631 { return -1. }
                                                    return 327.
                                                }
                                            }
                                        } else {
                                            if slot <= 5639 {
                                                if slot < 5632 or slot > 5639 { return -1. }
                                                return 328.
                                            } else {
                                                if slot <= 5648 {
                                                    if slot < 5640 or slot > 5648 { return -1. }
                                                    return 329.
                                                } else {
                                                    if slot < 5649 or slot > 5653 { return -1. }
                                                    return 330.
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
                if slot <= 8608 {
                    if slot <= 6967 {
                        if slot <= 6277 {
                            if slot <= 6052 {
                                if slot <= 5750 {
                                    if slot <= 5691 {
                                        if slot <= 5664 {
                                            if slot <= 5658 {
                                                if slot < 5654 or slot > 5658 { return -1. }
                                                return 331.
                                            } else {
                                                if slot < 5659 or slot > 5664 { return -1. }
                                                return 332.
                                            }
                                        } else {
                                            if slot <= 5674 {
                                                if slot < 5665 or slot > 5674 { return -1. }
                                                return 333.
                                            } else {
                                                if slot <= 5684 {
                                                    if slot < 5675 or slot > 5684 { return -1. }
                                                    return 334.
                                                } else {
                                                    if slot < 5685 or slot > 5691 { return -1. }
                                                    return 335.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5700 {
                                            if slot <= 5694 {
                                                if slot < 5692 or slot > 5694 { return -1. }
                                                return 336.
                                            } else {
                                                if slot < 5695 or slot > 5700 { return -1. }
                                                return 337.
                                            }
                                        } else {
                                            if slot <= 5704 {
                                                if slot < 5701 or slot > 5704 { return -1. }
                                                return 338.
                                            } else {
                                                if slot <= 5716 {
                                                    if slot < 5705 or slot > 5716 { return -1. }
                                                    return 339.
                                                } else {
                                                    if slot < 5717 or slot > 5750 { return -1. }
                                                    return 340.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6009 {
                                        if slot <= 5790 {
                                            if slot <= 5779 {
                                                if slot < 5751 or slot > 5779 { return -1. }
                                                return 341.
                                            } else {
                                                if slot < 5780 or slot > 5790 { return -1. }
                                                return 342.
                                            }
                                        } else {
                                            if slot <= 5800 {
                                                if slot < 5791 or slot > 5800 { return -1. }
                                                return 343.
                                            } else {
                                                if slot <= 5881 {
                                                    if slot < 5801 or slot > 5881 { return -1. }
                                                    return 344.
                                                } else {
                                                    if slot < 5882 or slot > 6009 { return -1. }
                                                    return 345.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6021 {
                                            if slot <= 6017 {
                                                if slot < 6010 or slot > 6017 { return -1. }
                                                return 346.
                                            } else {
                                                if slot < 6018 or slot > 6021 { return -1. }
                                                return 347.
                                            }
                                        } else {
                                            if slot <= 6041 {
                                                if slot < 6022 or slot > 6041 { return -1. }
                                                return 348.
                                            } else {
                                                if slot <= 6048 {
                                                    if slot < 6042 or slot > 6048 { return -1. }
                                                    return 349.
                                                } else {
                                                    if slot < 6049 or slot > 6052 { return -1. }
                                                    return 350.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 6175 {
                                    if slot <= 6123 {
                                        if slot <= 6062 {
                                            if slot <= 6058 {
                                                if slot < 6053 or slot > 6058 { return -1. }
                                                return 351.
                                            } else {
                                                if slot < 6059 or slot > 6062 { return -1. }
                                                return 352.
                                            }
                                        } else {
                                            if slot <= 6067 {
                                                if slot < 6063 or slot > 6067 { return -1. }
                                                return 353.
                                            } else {
                                                if slot <= 6087 {
                                                    if slot < 6068 or slot > 6087 { return -1. }
                                                    return 354.
                                                } else {
                                                    if slot < 6120 or slot > 6123 { return -1. }
                                                    return 355.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6165 {
                                            if slot <= 6124 {
                                                if slot < 6124 or slot > 6124 { return -1. }
                                                return 356.
                                            } else {
                                                if slot < 6164 or slot > 6165 { return -1. }
                                                return 357.
                                            }
                                        } else {
                                            if slot <= 6167 {
                                                if slot < 6166 or slot > 6167 { return -1. }
                                                return 358.
                                            } else {
                                                if slot <= 6171 {
                                                    if slot < 6168 or slot > 6171 { return -1. }
                                                    return 359.
                                                } else {
                                                    if slot < 6172 or slot > 6175 { return -1. }
                                                    return 360.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6242 {
                                        if slot <= 6201 {
                                            if slot <= 6198 {
                                                if slot < 6176 or slot > 6198 { return -1. }
                                                return 361.
                                            } else {
                                                if slot < 6199 or slot > 6201 { return -1. }
                                                return 362.
                                            }
                                        } else {
                                            if slot <= 6205 {
                                                if slot < 6202 or slot > 6205 { return -1. }
                                                return 363.
                                            } else {
                                                if slot <= 6220 {
                                                    if slot < 6206 or slot > 6220 { return -1. }
                                                    return 364.
                                                } else {
                                                    if slot < 6221 or slot > 6242 { return -1. }
                                                    return 365.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6252 {
                                            if slot <= 6246 {
                                                if slot < 6243 or slot > 6246 { return -1. }
                                                return 366.
                                            } else {
                                                if slot <= 6248 {
                                                    if slot < 6247 or slot > 6248 { return -1. }
                                                    return 367.
                                                } else {
                                                    if slot < 6249 or slot > 6252 { return -1. }
                                                    return 368.
                                                }
                                            }
                                        } else {
                                            if slot <= 6254 {
                                                if slot < 6253 or slot > 6254 { return -1. }
                                                return 369.
                                            } else {
                                                if slot <= 6256 {
                                                    if slot < 6255 or slot > 6256 { return -1. }
                                                    return 370.
                                                } else {
                                                    if slot < 6257 or slot > 6277 { return -1. }
                                                    return 371.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 6579 {
                                if slot <= 6375 {
                                    if slot <= 6312 {
                                        if slot <= 6285 {
                                            if slot <= 6279 {
                                                if slot < 6278 or slot > 6279 { return -1. }
                                                return 372.
                                            } else {
                                                if slot < 6280 or slot > 6285 { return -1. }
                                                return 373.
                                            }
                                        } else {
                                            if slot <= 6289 {
                                                if slot < 6286 or slot > 6289 { return -1. }
                                                return 374.
                                            } else {
                                                if slot <= 6293 {
                                                    if slot < 6290 or slot > 6293 { return -1. }
                                                    return 375.
                                                } else {
                                                    if slot < 6294 or slot > 6312 { return -1. }
                                                    return 376.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6351 {
                                            if slot <= 6349 {
                                                if slot < 6313 or slot > 6349 { return -1. }
                                                return 377.
                                            } else {
                                                if slot < 6350 or slot > 6351 { return -1. }
                                                return 378.
                                            }
                                        } else {
                                            if slot <= 6359 {
                                                if slot < 6352 or slot > 6359 { return -1. }
                                                return 379.
                                            } else {
                                                if slot <= 6362 {
                                                    if slot < 6360 or slot > 6362 { return -1. }
                                                    return 380.
                                                } else {
                                                    if slot < 6363 or slot > 6375 { return -1. }
                                                    return 381.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6550 {
                                        if slot <= 6399 {
                                            if slot <= 6393 {
                                                if slot < 6376 or slot > 6393 { return -1. }
                                                return 382.
                                            } else {
                                                if slot < 6394 or slot > 6399 { return -1. }
                                                return 383.
                                            }
                                        } else {
                                            if slot <= 6533 {
                                                if slot < 6526 or slot > 6533 { return -1. }
                                                return 384.
                                            } else {
                                                if slot <= 6543 {
                                                    if slot < 6534 or slot > 6543 { return -1. }
                                                    return 385.
                                                } else {
                                                    if slot < 6544 or slot > 6550 { return -1. }
                                                    return 386.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6564 {
                                            if slot <= 6556 {
                                                if slot < 6551 or slot > 6556 { return -1. }
                                                return 387.
                                            } else {
                                                if slot <= 6557 {
                                                    if slot < 6557 or slot > 6557 { return -1. }
                                                    return 388.
                                                } else {
                                                    if slot < 6558 or slot > 6564 { return -1. }
                                                    return 389.
                                                }
                                            }
                                        } else {
                                            if slot <= 6566 {
                                                if slot < 6565 or slot > 6566 { return -1. }
                                                return 390.
                                            } else {
                                                if slot <= 6573 {
                                                    if slot < 6567 or slot > 6573 { return -1. }
                                                    return 391.
                                                } else {
                                                    if slot < 6574 or slot > 6579 { return -1. }
                                                    return 392.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 6842 {
                                    if slot <= 6816 {
                                        if slot <= 6652 {
                                            if slot <= 6649 {
                                                if slot < 6580 or slot > 6649 { return -1. }
                                                return 393.
                                            } else {
                                                if slot < 6650 or slot > 6652 { return -1. }
                                                return 394.
                                            }
                                        } else {
                                            if slot <= 6661 {
                                                if slot < 6653 or slot > 6661 { return -1. }
                                                return 395.
                                            } else {
                                                if slot <= 6814 {
                                                    if slot < 6773 or slot > 6814 { return -1. }
                                                    return 396.
                                                } else {
                                                    if slot < 6815 or slot > 6816 { return -1. }
                                                    return 397.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6823 {
                                            if slot <= 6821 {
                                                if slot < 6817 or slot > 6821 { return -1. }
                                                return 398.
                                            } else {
                                                if slot < 6822 or slot > 6823 { return -1. }
                                                return 399.
                                            }
                                        } else {
                                            if slot <= 6824 {
                                                if slot < 6824 or slot > 6824 { return -1. }
                                                return 400.
                                            } else {
                                                if slot <= 6841 {
                                                    if slot < 6828 or slot > 6841 { return -1. }
                                                    return 401.
                                                } else {
                                                    if slot < 6842 or slot > 6842 { return -1. }
                                                    return 402.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6912 {
                                        if slot <= 6861 {
                                            if slot <= 6858 {
                                                if slot < 6844 or slot > 6858 { return -1. }
                                                return 403.
                                            } else {
                                                if slot < 6859 or slot > 6861 { return -1. }
                                                return 404.
                                            }
                                        } else {
                                            if slot <= 6908 {
                                                if slot < 6862 or slot > 6908 { return -1. }
                                                return 405.
                                            } else {
                                                if slot <= 6911 {
                                                    if slot < 6909 or slot > 6911 { return -1. }
                                                    return 406.
                                                } else {
                                                    if slot < 6912 or slot > 6912 { return -1. }
                                                    return 407.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6923 {
                                            if slot <= 6917 {
                                                if slot < 6913 or slot > 6917 { return -1. }
                                                return 408.
                                            } else {
                                                if slot <= 6921 {
                                                    if slot < 6918 or slot > 6921 { return -1. }
                                                    return 409.
                                                } else {
                                                    if slot < 6922 or slot > 6923 { return -1. }
                                                    return 410.
                                                }
                                            }
                                        } else {
                                            if slot <= 6934 {
                                                if slot < 6924 or slot > 6934 { return -1. }
                                                return 411.
                                            } else {
                                                if slot <= 6954 {
                                                    if slot < 6935 or slot > 6954 { return -1. }
                                                    return 412.
                                                } else {
                                                    if slot < 6955 or slot > 6967 { return -1. }
                                                    return 413.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 8074 {
                            if slot <= 7160 {
                                if slot <= 7065 {
                                    if slot <= 7022 {
                                        if slot <= 7000 {
                                            if slot <= 6991 {
                                                if slot < 6968 or slot > 6991 { return -1. }
                                                return 414.
                                            } else {
                                                if slot < 6992 or slot > 7000 { return -1. }
                                                return 415.
                                            }
                                        } else {
                                            if slot <= 7015 {
                                                if slot < 7001 or slot > 7015 { return -1. }
                                                return 416.
                                            } else {
                                                if slot <= 7020 {
                                                    if slot < 7016 or slot > 7020 { return -1. }
                                                    return 417.
                                                } else {
                                                    if slot < 7021 or slot > 7022 { return -1. }
                                                    return 418.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 7027 {
                                            if slot <= 7024 {
                                                if slot < 7023 or slot > 7024 { return -1. }
                                                return 419.
                                            } else {
                                                if slot < 7025 or slot > 7027 { return -1. }
                                                return 420.
                                            }
                                        } else {
                                            if slot <= 7056 {
                                                if slot < 7028 or slot > 7056 { return -1. }
                                                return 421.
                                            } else {
                                                if slot <= 7062 {
                                                    if slot < 7057 or slot > 7062 { return -1. }
                                                    return 422.
                                                } else {
                                                    if slot < 7063 or slot > 7065 { return -1. }
                                                    return 423.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 7101 {
                                        if slot <= 7081 {
                                            if slot <= 7066 {
                                                if slot < 7066 or slot > 7066 { return -1. }
                                                return 424.
                                            } else {
                                                if slot < 7067 or slot > 7081 { return -1. }
                                                return 425.
                                            }
                                        } else {
                                            if slot <= 7086 {
                                                if slot < 7082 or slot > 7086 { return -1. }
                                                return 426.
                                            } else {
                                                if slot <= 7090 {
                                                    if slot < 7087 or slot > 7090 { return -1. }
                                                    return 427.
                                                } else {
                                                    if slot < 7091 or slot > 7101 { return -1. }
                                                    return 428.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 7110 {
                                            if slot <= 7106 {
                                                if slot < 7102 or slot > 7106 { return -1. }
                                                return 429.
                                            } else {
                                                if slot < 7107 or slot > 7110 { return -1. }
                                                return 430.
                                            }
                                        } else {
                                            if slot <= 7135 {
                                                if slot < 7111 or slot > 7135 { return -1. }
                                                return 431.
                                            } else {
                                                if slot <= 7150 {
                                                    if slot < 7136 or slot > 7150 { return -1. }
                                                    return 432.
                                                } else {
                                                    if slot < 7151 or slot > 7160 { return -1. }
                                                    return 433.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 7871 {
                                    if slot <= 7682 {
                                        if slot <= 7586 {
                                            if slot <= 7469 {
                                                if slot < 7463 or slot > 7469 { return -1. }
                                                return 434.
                                            } else {
                                                if slot < 7470 or slot > 7586 { return -1. }
                                                return 435.
                                            }
                                        } else {
                                            if slot <= 7593 {
                                                if slot < 7587 or slot > 7593 { return -1. }
                                                return 436.
                                            } else {
                                                if slot <= 7637 {
                                                    if slot < 7594 or slot > 7637 { return -1. }
                                                    return 437.
                                                } else {
                                                    if slot < 7638 or slot > 7682 { return -1. }
                                                    return 438.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 7724 {
                                            if slot <= 7707 {
                                                if slot < 7683 or slot > 7707 { return -1. }
                                                return 439.
                                            } else {
                                                if slot < 7708 or slot > 7724 { return -1. }
                                                return 440.
                                            }
                                        } else {
                                            if slot <= 7735 {
                                                if slot < 7726 or slot > 7735 { return -1. }
                                                return 441.
                                            } else {
                                                if slot <= 7862 {
                                                    if slot < 7736 or slot > 7862 { return -1. }
                                                    return 442.
                                                } else {
                                                    if slot < 7863 or slot > 7871 { return -1. }
                                                    return 443.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8025 {
                                        if slot <= 7948 {
                                            if slot <= 7909 {
                                                if slot < 7872 or slot > 7909 { return -1. }
                                                return 444.
                                            } else {
                                                if slot < 7938 or slot > 7948 { return -1. }
                                                return 445.
                                            }
                                        } else {
                                            if slot <= 7994 {
                                                if slot < 7949 or slot > 7994 { return -1. }
                                                return 446.
                                            } else {
                                                if slot <= 8021 {
                                                    if slot < 8006 or slot > 8021 { return -1. }
                                                    return 447.
                                                } else {
                                                    if slot < 8022 or slot > 8025 { return -1. }
                                                    return 448.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8048 {
                                            if slot <= 8031 {
                                                if slot < 8026 or slot > 8031 { return -1. }
                                                return 449.
                                            } else {
                                                if slot <= 8036 {
                                                    if slot < 8032 or slot > 8036 { return -1. }
                                                    return 450.
                                                } else {
                                                    if slot < 8037 or slot > 8048 { return -1. }
                                                    return 451.
                                                }
                                            }
                                        } else {
                                            if slot <= 8061 {
                                                if slot < 8049 or slot > 8061 { return -1. }
                                                return 452.
                                            } else {
                                                if slot <= 8065 {
                                                    if slot < 8062 or slot > 8065 { return -1. }
                                                    return 453.
                                                } else {
                                                    if slot < 8066 or slot > 8074 { return -1. }
                                                    return 454.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 8306 {
                                if slot <= 8166 {
                                    if slot <= 8105 {
                                        if slot <= 8088 {
                                            if slot <= 8086 {
                                                if slot < 8075 or slot > 8086 { return -1. }
                                                return 455.
                                            } else {
                                                if slot < 8087 or slot > 8088 { return -1. }
                                                return 456.
                                            }
                                        } else {
                                            if slot <= 8093 {
                                                if slot < 8089 or slot > 8093 { return -1. }
                                                return 457.
                                            } else {
                                                if slot <= 8096 {
                                                    if slot < 8094 or slot > 8096 { return -1. }
                                                    return 458.
                                                } else {
                                                    if slot < 8097 or slot > 8105 { return -1. }
                                                    return 459.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8119 {
                                            if slot <= 8115 {
                                                if slot < 8106 or slot > 8115 { return -1. }
                                                return 460.
                                            } else {
                                                if slot < 8116 or slot > 8119 { return -1. }
                                                return 461.
                                            }
                                        } else {
                                            if slot <= 8145 {
                                                if slot < 8120 or slot > 8145 { return -1. }
                                                return 462.
                                            } else {
                                                if slot <= 8152 {
                                                    if slot < 8146 or slot > 8152 { return -1. }
                                                    return 463.
                                                } else {
                                                    if slot < 8153 or slot > 8166 { return -1. }
                                                    return 464.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8223 {
                                        if slot <= 8185 {
                                            if slot <= 8169 {
                                                if slot < 8167 or slot > 8169 { return -1. }
                                                return 465.
                                            } else {
                                                if slot < 8170 or slot > 8185 { return -1. }
                                                return 466.
                                            }
                                        } else {
                                            if slot <= 8201 {
                                                if slot < 8192 or slot > 8201 { return -1. }
                                                return 467.
                                            } else {
                                                if slot <= 8219 {
                                                    if slot < 8202 or slot > 8219 { return -1. }
                                                    return 468.
                                                } else {
                                                    if slot < 8220 or slot > 8223 { return -1. }
                                                    return 469.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8238 {
                                            if slot <= 8225 {
                                                if slot < 8224 or slot > 8225 { return -1. }
                                                return 470.
                                            } else {
                                                if slot <= 8233 {
                                                    if slot < 8226 or slot > 8233 { return -1. }
                                                    return 471.
                                                } else {
                                                    if slot < 8234 or slot > 8238 { return -1. }
                                                    return 472.
                                                }
                                            }
                                        } else {
                                            if slot <= 8269 {
                                                if slot < 8239 or slot > 8269 { return -1. }
                                                return 473.
                                            } else {
                                                if slot <= 8271 {
                                                    if slot < 8270 or slot > 8271 { return -1. }
                                                    return 474.
                                                } else {
                                                    if slot < 8272 or slot > 8306 { return -1. }
                                                    return 475.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 8434 {
                                    if slot <= 8365 {
                                        if slot <= 8329 {
                                            if slot <= 8313 {
                                                if slot < 8307 or slot > 8313 { return -1. }
                                                return 476.
                                            } else {
                                                if slot < 8314 or slot > 8329 { return -1. }
                                                return 477.
                                            }
                                        } else {
                                            if slot <= 8337 {
                                                if slot < 8330 or slot > 8337 { return -1. }
                                                return 478.
                                            } else {
                                                if slot <= 8340 {
                                                    if slot < 8338 or slot > 8340 { return -1. }
                                                    return 479.
                                                } else {
                                                    if slot < 8341 or slot > 8365 { return -1. }
                                                    return 480.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8389 {
                                            if slot <= 8370 {
                                                if slot < 8366 or slot > 8370 { return -1. }
                                                return 481.
                                            } else {
                                                if slot < 8371 or slot > 8389 { return -1. }
                                                return 482.
                                            }
                                        } else {
                                            if slot <= 8394 {
                                                if slot < 8390 or slot > 8394 { return -1. }
                                                return 483.
                                            } else {
                                                if slot <= 8421 {
                                                    if slot < 8395 or slot > 8421 { return -1. }
                                                    return 484.
                                                } else {
                                                    if slot < 8422 or slot > 8434 { return -1. }
                                                    return 485.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8497 {
                                        if slot <= 8469 {
                                            if slot <= 8442 {
                                                if slot < 8435 or slot > 8442 { return -1. }
                                                return 486.
                                            } else {
                                                if slot < 8443 or slot > 8469 { return -1. }
                                                return 487.
                                            }
                                        } else {
                                            if slot <= 8473 {
                                                if slot < 8471 or slot > 8473 { return -1. }
                                                return 488.
                                            } else {
                                                if slot <= 8493 {
                                                    if slot < 8474 or slot > 8493 { return -1. }
                                                    return 489.
                                                } else {
                                                    if slot < 8494 or slot > 8497 { return -1. }
                                                    return 490.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8564 {
                                            if slot <= 8523 {
                                                if slot < 8498 or slot > 8523 { return -1. }
                                                return 491.
                                            } else {
                                                if slot <= 8556 {
                                                    if slot < 8524 or slot > 8556 { return -1. }
                                                    return 492.
                                                } else {
                                                    if slot < 8557 or slot > 8564 { return -1. }
                                                    return 493.
                                                }
                                            }
                                        } else {
                                            if slot <= 8584 {
                                                if slot < 8565 or slot > 8584 { return -1. }
                                                return 494.
                                            } else {
                                                if slot <= 8600 {
                                                    if slot < 8585 or slot > 8600 { return -1. }
                                                    return 495.
                                                } else {
                                                    if slot < 8601 or slot > 8608 { return -1. }
                                                    return 496.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 9607 {
                        if slot <= 9059 {
                            if slot <= 8866 {
                                if slot <= 8778 {
                                    if slot <= 8709 {
                                        if slot <= 8636 {
                                            if slot <= 8631 {
                                                if slot < 8610 or slot > 8631 { return -1. }
                                                return 497.
                                            } else {
                                                if slot < 8632 or slot > 8636 { return -1. }
                                                return 498.
                                            }
                                        } else {
                                            if slot <= 8641 {
                                                if slot < 8637 or slot > 8641 { return -1. }
                                                return 499.
                                            } else {
                                                if slot <= 8689 {
                                                    if slot < 8642 or slot > 8689 { return -1. }
                                                    return 500.
                                                } else {
                                                    if slot < 8690 or slot > 8709 { return -1. }
                                                    return 501.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8731 {
                                            if slot <= 8729 {
                                                if slot < 8710 or slot > 8729 { return -1. }
                                                return 502.
                                            } else {
                                                if slot < 8730 or slot > 8731 { return -1. }
                                                return 503.
                                            }
                                        } else {
                                            if slot <= 8755 {
                                                if slot < 8732 or slot > 8755 { return -1. }
                                                return 504.
                                            } else {
                                                if slot <= 8759 {
                                                    if slot < 8756 or slot > 8759 { return -1. }
                                                    return 505.
                                                } else {
                                                    if slot < 8760 or slot > 8778 { return -1. }
                                                    return 506.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8842 {
                                        if slot <= 8793 {
                                            if slot <= 8789 {
                                                if slot < 8779 or slot > 8789 { return -1. }
                                                return 507.
                                            } else {
                                                if slot < 8790 or slot > 8793 { return -1. }
                                                return 508.
                                            }
                                        } else {
                                            if slot <= 8813 {
                                                if slot < 8794 or slot > 8813 { return -1. }
                                                return 509.
                                            } else {
                                                if slot <= 8835 {
                                                    if slot < 8814 or slot > 8835 { return -1. }
                                                    return 510.
                                                } else {
                                                    if slot < 8836 or slot > 8842 { return -1. }
                                                    return 511.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8852 {
                                            if slot <= 8846 {
                                                if slot < 8843 or slot > 8846 { return -1. }
                                                return 512.
                                            } else {
                                                if slot < 8847 or slot > 8852 { return -1. }
                                                return 513.
                                            }
                                        } else {
                                            if slot <= 8856 {
                                                if slot < 8853 or slot > 8856 { return -1. }
                                                return 514.
                                            } else {
                                                if slot <= 8865 {
                                                    if slot < 8857 or slot > 8865 { return -1. }
                                                    return 515.
                                                } else {
                                                    if slot < 8866 or slot > 8866 { return -1. }
                                                    return 516.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 9012 {
                                    if slot <= 8909 {
                                        if slot <= 8896 {
                                            if slot <= 8893 {
                                                if slot < 8883 or slot > 8893 { return -1. }
                                                return 517.
                                            } else {
                                                if slot < 8894 or slot > 8896 { return -1. }
                                                return 518.
                                            }
                                        } else {
                                            if slot <= 8902 {
                                                if slot < 8897 or slot > 8902 { return -1. }
                                                return 519.
                                            } else {
                                                if slot <= 8907 {
                                                    if slot < 8903 or slot > 8907 { return -1. }
                                                    return 520.
                                                } else {
                                                    if slot < 8908 or slot > 8909 { return -1. }
                                                    return 521.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8937 {
                                            if slot <= 8915 {
                                                if slot < 8910 or slot > 8915 { return -1. }
                                                return 522.
                                            } else {
                                                if slot < 8916 or slot > 8937 { return -1. }
                                                return 523.
                                            }
                                        } else {
                                            if slot <= 8995 {
                                                if slot < 8938 or slot > 8995 { return -1. }
                                                return 524.
                                            } else {
                                                if slot <= 9002 {
                                                    if slot < 8996 or slot > 9002 { return -1. }
                                                    return 525.
                                                } else {
                                                    if slot < 9003 or slot > 9012 { return -1. }
                                                    return 526.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9038 {
                                        if slot <= 9022 {
                                            if slot <= 9019 {
                                                if slot < 9013 or slot > 9019 { return -1. }
                                                return 527.
                                            } else {
                                                if slot < 9020 or slot > 9022 { return -1. }
                                                return 528.
                                            }
                                        } else {
                                            if slot <= 9024 {
                                                if slot < 9023 or slot > 9024 { return -1. }
                                                return 529.
                                            } else {
                                                if slot <= 9034 {
                                                    if slot < 9025 or slot > 9034 { return -1. }
                                                    return 530.
                                                } else {
                                                    if slot < 9035 or slot > 9038 { return -1. }
                                                    return 531.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9049 {
                                            if slot <= 9041 {
                                                if slot < 9039 or slot > 9041 { return -1. }
                                                return 532.
                                            } else {
                                                if slot <= 9045 {
                                                    if slot < 9042 or slot > 9045 { return -1. }
                                                    return 533.
                                                } else {
                                                    if slot < 9046 or slot > 9049 { return -1. }
                                                    return 534.
                                                }
                                            }
                                        } else {
                                            if slot <= 9052 {
                                                if slot < 9050 or slot > 9052 { return -1. }
                                                return 535.
                                            } else {
                                                if slot <= 9054 {
                                                    if slot < 9053 or slot > 9054 { return -1. }
                                                    return 536.
                                                } else {
                                                    if slot < 9055 or slot > 9059 { return -1. }
                                                    return 537.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 9306 {
                                if slot <= 9245 {
                                    if slot <= 9137 {
                                        if slot <= 9067 {
                                            if slot <= 9063 {
                                                if slot < 9060 or slot > 9063 { return -1. }
                                                return 538.
                                            } else {
                                                if slot < 9064 or slot > 9067 { return -1. }
                                                return 539.
                                            }
                                        } else {
                                            if slot <= 9084 {
                                                if slot < 9068 or slot > 9084 { return -1. }
                                                return 540.
                                            } else {
                                                if slot <= 9130 {
                                                    if slot < 9085 or slot > 9130 { return -1. }
                                                    return 541.
                                                } else {
                                                    if slot < 9131 or slot > 9137 { return -1. }
                                                    return 542.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9164 {
                                            if slot <= 9140 {
                                                if slot < 9138 or slot > 9140 { return -1. }
                                                return 543.
                                            } else {
                                                if slot < 9141 or slot > 9164 { return -1. }
                                                return 544.
                                            }
                                        } else {
                                            if slot <= 9221 {
                                                if slot < 9216 or slot > 9221 { return -1. }
                                                return 545.
                                            } else {
                                                if slot <= 9240 {
                                                    if slot < 9222 or slot > 9240 { return -1. }
                                                    return 546.
                                                } else {
                                                    if slot < 9241 or slot > 9245 { return -1. }
                                                    return 547.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9272 {
                                        if slot <= 9254 {
                                            if slot <= 9249 {
                                                if slot < 9246 or slot > 9249 { return -1. }
                                                return 548.
                                            } else {
                                                if slot < 9250 or slot > 9254 { return -1. }
                                                return 549.
                                            }
                                        } else {
                                            if slot <= 9260 {
                                                if slot < 9255 or slot > 9260 { return -1. }
                                                return 550.
                                            } else {
                                                if slot <= 9263 {
                                                    if slot < 9261 or slot > 9263 { return -1. }
                                                    return 551.
                                                } else {
                                                    if slot < 9264 or slot > 9272 { return -1. }
                                                    return 552.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9300 {
                                            if slot <= 9289 {
                                                if slot < 9273 or slot > 9289 { return -1. }
                                                return 553.
                                            } else {
                                                if slot <= 9296 {
                                                    if slot < 9290 or slot > 9296 { return -1. }
                                                    return 554.
                                                } else {
                                                    if slot < 9297 or slot > 9300 { return -1. }
                                                    return 555.
                                                }
                                            }
                                        } else {
                                            if slot <= 9302 {
                                                if slot < 9301 or slot > 9302 { return -1. }
                                                return 556.
                                            } else {
                                                if slot <= 9304 {
                                                    if slot < 9303 or slot > 9304 { return -1. }
                                                    return 557.
                                                } else {
                                                    if slot < 9305 or slot > 9306 { return -1. }
                                                    return 558.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 9433 {
                                    if slot <= 9354 {
                                        if slot <= 9312 {
                                            if slot <= 9310 {
                                                if slot < 9307 or slot > 9310 { return -1. }
                                                return 559.
                                            } else {
                                                if slot < 9311 or slot > 9312 { return -1. }
                                                return 560.
                                            }
                                        } else {
                                            if slot <= 9335 {
                                                if slot < 9313 or slot > 9335 { return -1. }
                                                return 561.
                                            } else {
                                                if slot <= 9345 {
                                                    if slot < 9336 or slot > 9345 { return -1. }
                                                    return 562.
                                                } else {
                                                    if slot < 9346 or slot > 9354 { return -1. }
                                                    return 563.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9420 {
                                            if slot <= 9385 {
                                                if slot < 9355 or slot > 9385 { return -1. }
                                                return 564.
                                            } else {
                                                if slot < 9386 or slot > 9420 { return -1. }
                                                return 565.
                                            }
                                        } else {
                                            if slot <= 9425 {
                                                if slot < 9421 or slot > 9425 { return -1. }
                                                return 566.
                                            } else {
                                                if slot <= 9430 {
                                                    if slot < 9428 or slot > 9430 { return -1. }
                                                    return 567.
                                                } else {
                                                    if slot < 9431 or slot > 9433 { return -1. }
                                                    return 568.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9517 {
                                        if slot <= 9482 {
                                            if slot <= 9459 {
                                                if slot < 9434 or slot > 9459 { return -1. }
                                                return 569.
                                            } else {
                                                if slot < 9460 or slot > 9482 { return -1. }
                                                return 570.
                                            }
                                        } else {
                                            if slot <= 9484 {
                                                if slot < 9483 or slot > 9484 { return -1. }
                                                return 571.
                                            } else {
                                                if slot <= 9514 {
                                                    if slot < 9485 or slot > 9514 { return -1. }
                                                    return 572.
                                                } else {
                                                    if slot < 9515 or slot > 9517 { return -1. }
                                                    return 573.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9573 {
                                            if slot <= 9528 {
                                                if slot < 9518 or slot > 9528 { return -1. }
                                                return 574.
                                            } else {
                                                if slot <= 9564 {
                                                    if slot < 9529 or slot > 9564 { return -1. }
                                                    return 575.
                                                } else {
                                                    if slot < 9565 or slot > 9573 { return -1. }
                                                    return 576.
                                                }
                                            }
                                        } else {
                                            if slot <= 9576 {
                                                if slot < 9574 or slot > 9576 { return -1. }
                                                return 577.
                                            } else {
                                                if slot <= 9579 {
                                                    if slot < 9577 or slot > 9579 { return -1. }
                                                    return 578.
                                                } else {
                                                    if slot < 9580 or slot > 9607 { return -1. }
                                                    return 579.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 10012 {
                            if slot <= 9792 {
                                if slot <= 9726 {
                                    if slot <= 9642 {
                                        if slot <= 9622 {
                                            if slot <= 9612 {
                                                if slot < 9608 or slot > 9612 { return -1. }
                                                return 580.
                                            } else {
                                                if slot < 9613 or slot > 9622 { return -1. }
                                                return 581.
                                            }
                                        } else {
                                            if slot <= 9625 {
                                                if slot < 9623 or slot > 9625 { return -1. }
                                                return 582.
                                            } else {
                                                if slot <= 9639 {
                                                    if slot < 9626 or slot > 9639 { return -1. }
                                                    return 583.
                                                } else {
                                                    if slot < 9640 or slot > 9642 { return -1. }
                                                    return 584.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9682 {
                                            if slot <= 9654 {
                                                if slot < 9643 or slot > 9654 { return -1. }
                                                return 585.
                                            } else {
                                                if slot < 9676 or slot > 9682 { return -1. }
                                                return 586.
                                            }
                                        } else {
                                            if slot <= 9702 {
                                                if slot < 9683 or slot > 9702 { return -1. }
                                                return 587.
                                            } else {
                                                if slot <= 9708 {
                                                    if slot < 9703 or slot > 9708 { return -1. }
                                                    return 588.
                                                } else {
                                                    if slot < 9709 or slot > 9726 { return -1. }
                                                    return 589.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9765 {
                                        if slot <= 9743 {
                                            if slot <= 9734 {
                                                if slot < 9727 or slot > 9734 { return -1. }
                                                return 590.
                                            } else {
                                                if slot < 9735 or slot > 9743 { return -1. }
                                                return 591.
                                            }
                                        } else {
                                            if slot <= 9746 {
                                                if slot < 9744 or slot > 9746 { return -1. }
                                                return 592.
                                            } else {
                                                if slot <= 9755 {
                                                    if slot < 9747 or slot > 9755 { return -1. }
                                                    return 593.
                                                } else {
                                                    if slot < 9756 or slot > 9765 { return -1. }
                                                    return 594.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9779 {
                                            if slot <= 9774 {
                                                if slot < 9766 or slot > 9774 { return -1. }
                                                return 595.
                                            } else {
                                                if slot < 9775 or slot > 9779 { return -1. }
                                                return 596.
                                            }
                                        } else {
                                            if slot <= 9785 {
                                                if slot < 9780 or slot > 9785 { return -1. }
                                                return 597.
                                            } else {
                                                if slot <= 9789 {
                                                    if slot < 9786 or slot > 9789 { return -1. }
                                                    return 598.
                                                } else {
                                                    if slot < 9790 or slot > 9792 { return -1. }
                                                    return 599.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 9926 {
                                    if slot <= 9823 {
                                        if slot <= 9806 {
                                            if slot <= 9804 {
                                                if slot < 9793 or slot > 9804 { return -1. }
                                                return 600.
                                            } else {
                                                if slot < 9805 or slot > 9806 { return -1. }
                                                return 601.
                                            }
                                        } else {
                                            if slot <= 9812 {
                                                if slot < 9807 or slot > 9812 { return -1. }
                                                return 602.
                                            } else {
                                                if slot <= 9817 {
                                                    if slot < 9813 or slot > 9817 { return -1. }
                                                    return 603.
                                                } else {
                                                    if slot < 9818 or slot > 9823 { return -1. }
                                                    return 604.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9876 {
                                            if slot <= 9863 {
                                                if slot < 9824 or slot > 9863 { return -1. }
                                                return 605.
                                            } else {
                                                if slot < 9864 or slot > 9876 { return -1. }
                                                return 606.
                                            }
                                        } else {
                                            if slot <= 9880 {
                                                if slot < 9877 or slot > 9880 { return -1. }
                                                return 607.
                                            } else {
                                                if slot <= 9898 {
                                                    if slot < 9881 or slot > 9898 { return -1. }
                                                    return 608.
                                                } else {
                                                    if slot < 9899 or slot > 9926 { return -1. }
                                                    return 609.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9969 {
                                        if slot <= 9950 {
                                            if slot <= 9936 {
                                                if slot < 9927 or slot > 9936 { return -1. }
                                                return 610.
                                            } else {
                                                if slot < 9937 or slot > 9950 { return -1. }
                                                return 611.
                                            }
                                        } else {
                                            if slot <= 9961 {
                                                if slot < 9951 or slot > 9961 { return -1. }
                                                return 612.
                                            } else {
                                                if slot <= 9964 {
                                                    if slot < 9962 or slot > 9964 { return -1. }
                                                    return 613.
                                                } else {
                                                    if slot < 9965 or slot > 9969 { return -1. }
                                                    return 614.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9999 {
                                            if slot <= 9988 {
                                                if slot < 9970 or slot > 9988 { return -1. }
                                                return 615.
                                            } else {
                                                if slot <= 9997 {
                                                    if slot < 9989 or slot > 9997 { return -1. }
                                                    return 616.
                                                } else {
                                                    if slot < 9998 or slot > 9999 { return -1. }
                                                    return 617.
                                                }
                                            }
                                        } else {
                                            if slot <= 10001 {
                                                if slot < 10000 or slot > 10001 { return -1. }
                                                return 618.
                                            } else {
                                                if slot <= 10003 {
                                                    if slot < 10002 or slot > 10003 { return -1. }
                                                    return 619.
                                                } else {
                                                    if slot < 10004 or slot > 10012 { return -1. }
                                                    return 620.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 10269 {
                                if slot <= 10169 {
                                    if slot <= 10084 {
                                        if slot <= 10064 {
                                            if slot <= 10025 {
                                                if slot < 10013 or slot > 10025 { return -1. }
                                                return 621.
                                            } else {
                                                if slot < 10026 or slot > 10064 { return -1. }
                                                return 622.
                                            }
                                        } else {
                                            if slot <= 10070 {
                                                if slot < 10065 or slot > 10070 { return -1. }
                                                return 623.
                                            } else {
                                                if slot <= 10078 {
                                                    if slot < 10071 or slot > 10078 { return -1. }
                                                    return 624.
                                                } else {
                                                    if slot < 10079 or slot > 10084 { return -1. }
                                                    return 625.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10105 {
                                            if slot <= 10093 {
                                                if slot < 10085 or slot > 10093 { return -1. }
                                                return 626.
                                            } else {
                                                if slot < 10094 or slot > 10105 { return -1. }
                                                return 627.
                                            }
                                        } else {
                                            if slot <= 10112 {
                                                if slot < 10107 or slot > 10112 { return -1. }
                                                return 628.
                                            } else {
                                                if slot <= 10136 {
                                                    if slot < 10113 or slot > 10136 { return -1. }
                                                    return 629.
                                                } else {
                                                    if slot < 10137 or slot > 10169 { return -1. }
                                                    return 630.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10199 {
                                        if slot <= 10180 {
                                            if slot <= 10176 {
                                                if slot < 10170 or slot > 10176 { return -1. }
                                                return 631.
                                            } else {
                                                if slot < 10177 or slot > 10180 { return -1. }
                                                return 632.
                                            }
                                        } else {
                                            if slot <= 10184 {
                                                if slot < 10181 or slot > 10184 { return -1. }
                                                return 633.
                                            } else {
                                                if slot <= 10194 {
                                                    if slot < 10185 or slot > 10194 { return -1. }
                                                    return 634.
                                                } else {
                                                    if slot < 10195 or slot > 10199 { return -1. }
                                                    return 635.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10220 {
                                            if slot <= 10207 {
                                                if slot < 10200 or slot > 10207 { return -1. }
                                                return 636.
                                            } else {
                                                if slot <= 10215 {
                                                    if slot < 10208 or slot > 10215 { return -1. }
                                                    return 637.
                                                } else {
                                                    if slot < 10216 or slot > 10220 { return -1. }
                                                    return 638.
                                                }
                                            }
                                        } else {
                                            if slot <= 10232 {
                                                if slot < 10221 or slot > 10232 { return -1. }
                                                return 639.
                                            } else {
                                                if slot <= 10266 {
                                                    if slot < 10265 or slot > 10266 { return -1. }
                                                    return 640.
                                                } else {
                                                    if slot < 10267 or slot > 10269 { return -1. }
                                                    return 641.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 10350 {
                                    if slot <= 10309 {
                                        if slot <= 10285 {
                                            if slot <= 10281 {
                                                if slot < 10270 or slot > 10281 { return -1. }
                                                return 642.
                                            } else {
                                                if slot < 10282 or slot > 10285 { return -1. }
                                                return 643.
                                            }
                                        } else {
                                            if slot <= 10289 {
                                                if slot < 10286 or slot > 10289 { return -1. }
                                                return 644.
                                            } else {
                                                if slot <= 10297 {
                                                    if slot < 10290 or slot > 10297 { return -1. }
                                                    return 645.
                                                } else {
                                                    if slot < 10298 or slot > 10309 { return -1. }
                                                    return 646.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10321 {
                                            if slot <= 10314 {
                                                if slot < 10310 or slot > 10314 { return -1. }
                                                return 647.
                                            } else {
                                                if slot < 10315 or slot > 10321 { return -1. }
                                                return 648.
                                            }
                                        } else {
                                            if slot <= 10330 {
                                                if slot < 10322 or slot > 10330 { return -1. }
                                                return 649.
                                            } else {
                                                if slot <= 10346 {
                                                    if slot < 10331 or slot > 10346 { return -1. }
                                                    return 650.
                                                } else {
                                                    if slot < 10347 or slot > 10350 { return -1. }
                                                    return 651.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10378 {
                                        if slot <= 10367 {
                                            if slot <= 10354 {
                                                if slot < 10351 or slot > 10354 { return -1. }
                                                return 652.
                                            } else {
                                                if slot < 10355 or slot > 10367 { return -1. }
                                                return 653.
                                            }
                                        } else {
                                            if slot <= 10371 {
                                                if slot < 10368 or slot > 10371 { return -1. }
                                                return 654.
                                            } else {
                                                if slot <= 10375 {
                                                    if slot < 10372 or slot > 10375 { return -1. }
                                                    return 655.
                                                } else {
                                                    if slot < 10376 or slot > 10378 { return -1. }
                                                    return 656.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10406 {
                                            if slot <= 10384 {
                                                if slot < 10379 or slot > 10384 { return -1. }
                                                return 657.
                                            } else {
                                                if slot <= 10387 {
                                                    if slot < 10385 or slot > 10387 { return -1. }
                                                    return 658.
                                                } else {
                                                    if slot < 10388 or slot > 10406 { return -1. }
                                                    return 659.
                                                }
                                            }
                                        } else {
                                            if slot <= 10413 {
                                                if slot < 10407 or slot > 10413 { return -1. }
                                                return 660.
                                            } else {
                                                if slot <= 10419 {
                                                    if slot < 10414 or slot > 10419 { return -1. }
                                                    return 661.
                                                } else {
                                                    if slot < 10420 or slot > 10425 { return -1. }
                                                    return 662.
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
            if slot <= 16306 {
                if slot <= 14913 {
                    if slot <= 12707 {
                        if slot <= 10895 {
                            if slot <= 10741 {
                                if slot <= 10622 {
                                    if slot <= 10452 {
                                        if slot <= 10437 {
                                            if slot <= 10430 {
                                                if slot < 10426 or slot > 10430 { return -1. }
                                                return 663.
                                            } else {
                                                if slot < 10431 or slot > 10437 { return -1. }
                                                return 664.
                                            }
                                        } else {
                                            if slot <= 10445 {
                                                if slot < 10438 or slot > 10445 { return -1. }
                                                return 665.
                                            } else {
                                                if slot <= 10448 {
                                                    if slot < 10446 or slot > 10448 { return -1. }
                                                    return 666.
                                                } else {
                                                    if slot < 10449 or slot > 10452 { return -1. }
                                                    return 667.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10512 {
                                            if slot <= 10453 {
                                                if slot < 10453 or slot > 10453 { return -1. }
                                                return 668.
                                            } else {
                                                if slot < 10454 or slot > 10512 { return -1. }
                                                return 669.
                                            }
                                        } else {
                                            if slot <= 10515 {
                                                if slot < 10513 or slot > 10515 { return -1. }
                                                return 670.
                                            } else {
                                                if slot <= 10583 {
                                                    if slot < 10516 or slot > 10583 { return -1. }
                                                    return 671.
                                                } else {
                                                    if slot < 10584 or slot > 10622 { return -1. }
                                                    return 672.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10721 {
                                        if slot <= 10681 {
                                            if slot <= 10669 {
                                                if slot < 10623 or slot > 10669 { return -1. }
                                                return 673.
                                            } else {
                                                if slot < 10670 or slot > 10681 { return -1. }
                                                return 674.
                                            }
                                        } else {
                                            if slot <= 10685 {
                                                if slot < 10682 or slot > 10685 { return -1. }
                                                return 675.
                                            } else {
                                                if slot <= 10716 {
                                                    if slot < 10686 or slot > 10716 { return -1. }
                                                    return 676.
                                                } else {
                                                    if slot < 10717 or slot > 10721 { return -1. }
                                                    return 677.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10730 {
                                            if slot <= 10727 {
                                                if slot < 10722 or slot > 10727 { return -1. }
                                                return 678.
                                            } else {
                                                if slot < 10728 or slot > 10730 { return -1. }
                                                return 679.
                                            }
                                        } else {
                                            if slot <= 10733 {
                                                if slot < 10731 or slot > 10733 { return -1. }
                                                return 680.
                                            } else {
                                                if slot <= 10736 {
                                                    if slot < 10734 or slot > 10736 { return -1. }
                                                    return 681.
                                                } else {
                                                    if slot < 10737 or slot > 10741 { return -1. }
                                                    return 682.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 10802 {
                                    if slot <= 10762 {
                                        if slot <= 10753 {
                                            if slot <= 10746 {
                                                if slot < 10742 or slot > 10746 { return -1. }
                                                return 683.
                                            } else {
                                                if slot < 10747 or slot > 10753 { return -1. }
                                                return 684.
                                            }
                                        } else {
                                            if slot <= 10757 {
                                                if slot < 10754 or slot > 10757 { return -1. }
                                                return 685.
                                            } else {
                                                if slot <= 10760 {
                                                    if slot < 10758 or slot > 10760 { return -1. }
                                                    return 686.
                                                } else {
                                                    if slot < 10761 or slot > 10762 { return -1. }
                                                    return 687.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10774 {
                                            if slot <= 10765 {
                                                if slot < 10763 or slot > 10765 { return -1. }
                                                return 688.
                                            } else {
                                                if slot < 10766 or slot > 10774 { return -1. }
                                                return 689.
                                            }
                                        } else {
                                            if slot <= 10777 {
                                                if slot < 10775 or slot > 10777 { return -1. }
                                                return 690.
                                            } else {
                                                if slot <= 10779 {
                                                    if slot < 10778 or slot > 10779 { return -1. }
                                                    return 691.
                                                } else {
                                                    if slot < 10780 or slot > 10802 { return -1. }
                                                    return 692.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10839 {
                                        if slot <= 10816 {
                                            if slot <= 10814 {
                                                if slot < 10803 or slot > 10814 { return -1. }
                                                return 693.
                                            } else {
                                                if slot < 10815 or slot > 10816 { return -1. }
                                                return 694.
                                            }
                                        } else {
                                            if slot <= 10823 {
                                                if slot < 10817 or slot > 10823 { return -1. }
                                                return 695.
                                            } else {
                                                if slot <= 10837 {
                                                    if slot < 10824 or slot > 10837 { return -1. }
                                                    return 696.
                                                } else {
                                                    if slot < 10838 or slot > 10839 { return -1. }
                                                    return 697.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10862 {
                                            if slot <= 10841 {
                                                if slot < 10840 or slot > 10841 { return -1. }
                                                return 698.
                                            } else {
                                                if slot <= 10858 {
                                                    if slot < 10842 or slot > 10858 { return -1. }
                                                    return 699.
                                                } else {
                                                    if slot < 10859 or slot > 10862 { return -1. }
                                                    return 700.
                                                }
                                            }
                                        } else {
                                            if slot <= 10868 {
                                                if slot < 10863 or slot > 10868 { return -1. }
                                                return 701.
                                            } else {
                                                if slot <= 10873 {
                                                    if slot < 10869 or slot > 10873 { return -1. }
                                                    return 702.
                                                } else {
                                                    if slot < 10874 or slot > 10895 { return -1. }
                                                    return 703.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 11200 {
                                if slot <= 11000 {
                                    if slot <= 10934 {
                                        if slot <= 10910 {
                                            if slot <= 10904 {
                                                if slot < 10896 or slot > 10904 { return -1. }
                                                return 704.
                                            } else {
                                                if slot < 10905 or slot > 10910 { return -1. }
                                                return 705.
                                            }
                                        } else {
                                            if slot <= 10924 {
                                                if slot < 10911 or slot > 10924 { return -1. }
                                                return 706.
                                            } else {
                                                if slot <= 10926 {
                                                    if slot < 10925 or slot > 10926 { return -1. }
                                                    return 707.
                                                } else {
                                                    if slot < 10927 or slot > 10934 { return -1. }
                                                    return 708.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 10978 {
                                            if slot <= 10937 {
                                                if slot < 10935 or slot > 10937 { return -1. }
                                                return 709.
                                            } else {
                                                if slot < 10938 or slot > 10978 { return -1. }
                                                return 710.
                                            }
                                        } else {
                                            if slot <= 10983 {
                                                if slot < 10979 or slot > 10983 { return -1. }
                                                return 711.
                                            } else {
                                                if slot <= 10993 {
                                                    if slot < 10984 or slot > 10993 { return -1. }
                                                    return 712.
                                                } else {
                                                    if slot < 10994 or slot > 11000 { return -1. }
                                                    return 713.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 11121 {
                                        if slot <= 11050 {
                                            if slot <= 11009 {
                                                if slot < 11001 or slot > 11009 { return -1. }
                                                return 714.
                                            } else {
                                                if slot < 11011 or slot > 11050 { return -1. }
                                                return 715.
                                            }
                                        } else {
                                            if slot <= 11058 {
                                                if slot < 11051 or slot > 11058 { return -1. }
                                                return 716.
                                            } else {
                                                if slot <= 11068 {
                                                    if slot < 11059 or slot > 11068 { return -1. }
                                                    return 717.
                                                } else {
                                                    if slot < 11108 or slot > 11121 { return -1. }
                                                    return 718.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 11130 {
                                            if slot <= 11128 {
                                                if slot < 11122 or slot > 11128 { return -1. }
                                                return 719.
                                            } else {
                                                if slot < 11129 or slot > 11130 { return -1. }
                                                return 720.
                                            }
                                        } else {
                                            if slot <= 11181 {
                                                if slot < 11131 or slot > 11181 { return -1. }
                                                return 721.
                                            } else {
                                                if slot <= 11186 {
                                                    if slot < 11182 or slot > 11186 { return -1. }
                                                    return 722.
                                                } else {
                                                    if slot < 11187 or slot > 11200 { return -1. }
                                                    return 723.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 11468 {
                                    if slot <= 11253 {
                                        if slot <= 11206 {
                                            if slot <= 11203 {
                                                if slot < 11201 or slot > 11203 { return -1. }
                                                return 724.
                                            } else {
                                                if slot < 11204 or slot > 11206 { return -1. }
                                                return 725.
                                            }
                                        } else {
                                            if slot <= 11208 {
                                                if slot < 11207 or slot > 11208 { return -1. }
                                                return 726.
                                            } else {
                                                if slot <= 11226 {
                                                    if slot < 11209 or slot > 11226 { return -1. }
                                                    return 727.
                                                } else {
                                                    if slot < 11227 or slot > 11253 { return -1. }
                                                    return 728.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 11259 {
                                            if slot <= 11255 {
                                                if slot < 11254 or slot > 11255 { return -1. }
                                                return 729.
                                            } else {
                                                if slot < 11256 or slot > 11259 { return -1. }
                                                return 730.
                                            }
                                        } else {
                                            if slot <= 11260 {
                                                if slot < 11260 or slot > 11260 { return -1. }
                                                return 731.
                                            } else {
                                                if slot <= 11457 {
                                                    if slot < 11453 or slot > 11457 { return -1. }
                                                    return 732.
                                                } else {
                                                    if slot < 11458 or slot > 11468 { return -1. }
                                                    return 733.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 12223 {
                                        if slot <= 12170 {
                                            if slot <= 11514 {
                                                if slot < 11469 or slot > 11514 { return -1. }
                                                return 734.
                                            } else {
                                                if slot < 11792 or slot > 12170 { return -1. }
                                                return 735.
                                            }
                                        } else {
                                            if slot <= 12172 {
                                                if slot < 12171 or slot > 12172 { return -1. }
                                                return 736.
                                            } else {
                                                if slot <= 12174 {
                                                    if slot < 12173 or slot > 12174 { return -1. }
                                                    return 737.
                                                } else {
                                                    if slot < 12175 or slot > 12223 { return -1. }
                                                    return 738.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 12583 {
                                            if slot <= 12225 {
                                                if slot < 12224 or slot > 12225 { return -1. }
                                                return 739.
                                            } else {
                                                if slot <= 12226 {
                                                    if slot < 12226 or slot > 12226 { return -1. }
                                                    return 740.
                                                } else {
                                                    if slot < 12562 or slot > 12583 { return -1. }
                                                    return 741.
                                                }
                                            }
                                        } else {
                                            if slot <= 12587 {
                                                if slot < 12584 or slot > 12587 { return -1. }
                                                return 742.
                                            } else {
                                                if slot <= 12609 {
                                                    if slot < 12588 or slot > 12609 { return -1. }
                                                    return 743.
                                                } else {
                                                    if slot < 12610 or slot > 12707 { return -1. }
                                                    return 744.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 13941 {
                            if slot <= 13723 {
                                if slot <= 13456 {
                                    if slot <= 13282 {
                                        if slot <= 12712 {
                                            if slot <= 12710 {
                                                if slot < 12708 or slot > 12710 { return -1. }
                                                return 745.
                                            } else {
                                                if slot < 12711 or slot > 12712 { return -1. }
                                                return 746.
                                            }
                                        } else {
                                            if slot <= 12832 {
                                                if slot < 12713 or slot > 12832 { return -1. }
                                                return 747.
                                            } else {
                                                if slot <= 12848 {
                                                    if slot < 12833 or slot > 12848 { return -1. }
                                                    return 748.
                                                } else {
                                                    if slot < 12849 or slot > 13282 { return -1. }
                                                    return 749.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 13444 {
                                            if slot <= 13283 {
                                                if slot < 13283 or slot > 13283 { return -1. }
                                                return 750.
                                            } else {
                                                if slot < 13437 or slot > 13444 { return -1. }
                                                return 751.
                                            }
                                        } else {
                                            if slot <= 13448 {
                                                if slot < 13447 or slot > 13448 { return -1. }
                                                return 752.
                                            } else {
                                                if slot <= 13453 {
                                                    if slot < 13449 or slot > 13453 { return -1. }
                                                    return 753.
                                                } else {
                                                    if slot < 13454 or slot > 13456 { return -1. }
                                                    return 754.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 13527 {
                                        if slot <= 13517 {
                                            if slot <= 13462 {
                                                if slot < 13457 or slot > 13462 { return -1. }
                                                return 755.
                                            } else {
                                                if slot < 13463 or slot > 13517 { return -1. }
                                                return 756.
                                            }
                                        } else {
                                            if slot <= 13519 {
                                                if slot < 13518 or slot > 13519 { return -1. }
                                                return 757.
                                            } else {
                                                if slot <= 13521 {
                                                    if slot < 13520 or slot > 13521 { return -1. }
                                                    return 758.
                                                } else {
                                                    if slot < 13522 or slot > 13527 { return -1. }
                                                    return 759.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 13533 {
                                            if slot <= 13530 {
                                                if slot < 13528 or slot > 13530 { return -1. }
                                                return 760.
                                            } else {
                                                if slot < 13531 or slot > 13533 { return -1. }
                                                return 761.
                                            }
                                        } else {
                                            if slot <= 13701 {
                                                if slot < 13700 or slot > 13701 { return -1. }
                                                return 762.
                                            } else {
                                                if slot <= 13705 {
                                                    if slot < 13702 or slot > 13705 { return -1. }
                                                    return 763.
                                                } else {
                                                    if slot < 13706 or slot > 13723 { return -1. }
                                                    return 764.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 13782 {
                                    if slot <= 13743 {
                                        if slot <= 13730 {
                                            if slot <= 13725 {
                                                if slot < 13724 or slot > 13725 { return -1. }
                                                return 765.
                                            } else {
                                                if slot < 13726 or slot > 13730 { return -1. }
                                                return 766.
                                            }
                                        } else {
                                            if slot <= 13739 {
                                                if slot < 13731 or slot > 13739 { return -1. }
                                                return 767.
                                            } else {
                                                if slot <= 13741 {
                                                    if slot < 13740 or slot > 13741 { return -1. }
                                                    return 768.
                                                } else {
                                                    if slot < 13742 or slot > 13743 { return -1. }
                                                    return 769.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 13759 {
                                            if slot <= 13755 {
                                                if slot < 13744 or slot > 13755 { return -1. }
                                                return 770.
                                            } else {
                                                if slot < 13756 or slot > 13759 { return -1. }
                                                return 771.
                                            }
                                        } else {
                                            if slot <= 13761 {
                                                if slot < 13760 or slot > 13761 { return -1. }
                                                return 772.
                                            } else {
                                                if slot <= 13778 {
                                                    if slot < 13762 or slot > 13778 { return -1. }
                                                    return 773.
                                                } else {
                                                    if slot < 13779 or slot > 13782 { return -1. }
                                                    return 774.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 13815 {
                                        if slot <= 13798 {
                                            if slot <= 13784 {
                                                if slot < 13783 or slot > 13784 { return -1. }
                                                return 775.
                                            } else {
                                                if slot < 13785 or slot > 13798 { return -1. }
                                                return 776.
                                            }
                                        } else {
                                            if slot <= 13802 {
                                                if slot < 13799 or slot > 13802 { return -1. }
                                                return 777.
                                            } else {
                                                if slot <= 13804 {
                                                    if slot < 13803 or slot > 13804 { return -1. }
                                                    return 778.
                                                } else {
                                                    if slot < 13805 or slot > 13815 { return -1. }
                                                    return 779.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 13853 {
                                            if slot <= 13819 {
                                                if slot < 13816 or slot > 13819 { return -1. }
                                                return 780.
                                            } else {
                                                if slot <= 13821 {
                                                    if slot < 13820 or slot > 13821 { return -1. }
                                                    return 781.
                                                } else {
                                                    if slot < 13822 or slot > 13853 { return -1. }
                                                    return 782.
                                                }
                                            }
                                        } else {
                                            if slot <= 13937 {
                                                if slot < 13854 or slot > 13937 { return -1. }
                                                return 783.
                                            } else {
                                                if slot <= 13939 {
                                                    if slot < 13938 or slot > 13939 { return -1. }
                                                    return 784.
                                                } else {
                                                    if slot < 13940 or slot > 13941 { return -1. }
                                                    return 785.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 14616 {
                                if slot <= 14259 {
                                    if slot <= 14106 {
                                        if slot <= 13985 {
                                            if slot <= 13982 {
                                                if slot < 13942 or slot > 13982 { return -1. }
                                                return 786.
                                            } else {
                                                if slot < 13983 or slot > 13985 { return -1. }
                                                return 787.
                                            }
                                        } else {
                                            if slot <= 14092 {
                                                if slot < 13986 or slot > 14092 { return -1. }
                                                return 788.
                                            } else {
                                                if slot <= 14099 {
                                                    if slot < 14093 or slot > 14099 { return -1. }
                                                    return 789.
                                                } else {
                                                    if slot < 14100 or slot > 14106 { return -1. }
                                                    return 790.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 14112 {
                                            if slot <= 14109 {
                                                if slot < 14107 or slot > 14109 { return -1. }
                                                return 791.
                                            } else {
                                                if slot < 14110 or slot > 14112 { return -1. }
                                                return 792.
                                            }
                                        } else {
                                            if slot <= 14122 {
                                                if slot < 14113 or slot > 14122 { return -1. }
                                                return 793.
                                            } else {
                                                if slot <= 14227 {
                                                    if slot < 14123 or slot > 14227 { return -1. }
                                                    return 794.
                                                } else {
                                                    if slot < 14228 or slot > 14259 { return -1. }
                                                    return 795.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 14595 {
                                        if slot <= 14263 {
                                            if slot <= 14262 {
                                                if slot < 14260 or slot > 14262 { return -1. }
                                                return 796.
                                            } else {
                                                if slot < 14263 or slot > 14263 { return -1. }
                                                return 797.
                                            }
                                        } else {
                                            if slot <= 14326 {
                                                if slot < 14317 or slot > 14326 { return -1. }
                                                return 798.
                                            } else {
                                                if slot <= 14590 {
                                                    if slot < 14579 or slot > 14590 { return -1. }
                                                    return 799.
                                                } else {
                                                    if slot < 14591 or slot > 14595 { return -1. }
                                                    return 800.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 14605 {
                                            if slot <= 14599 {
                                                if slot < 14596 or slot > 14599 { return -1. }
                                                return 801.
                                            } else {
                                                if slot <= 14601 {
                                                    if slot < 14600 or slot > 14601 { return -1. }
                                                    return 802.
                                                } else {
                                                    if slot < 14602 or slot > 14605 { return -1. }
                                                    return 803.
                                                }
                                            }
                                        } else {
                                            if slot <= 14610 {
                                                if slot < 14606 or slot > 14610 { return -1. }
                                                return 804.
                                            } else {
                                                if slot <= 14613 {
                                                    if slot < 14611 or slot > 14613 { return -1. }
                                                    return 805.
                                                } else {
                                                    if slot < 14614 or slot > 14616 { return -1. }
                                                    return 806.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 14865 {
                                    if slot <= 14644 {
                                        if slot <= 14624 {
                                            if slot <= 14621 {
                                                if slot < 14617 or slot > 14621 { return -1. }
                                                return 807.
                                            } else {
                                                if slot < 14622 or slot > 14624 { return -1. }
                                                return 808.
                                            }
                                        } else {
                                            if slot <= 14626 {
                                                if slot < 14625 or slot > 14626 { return -1. }
                                                return 809.
                                            } else {
                                                if slot <= 14627 {
                                                    if slot < 14627 or slot > 14627 { return -1. }
                                                    return 810.
                                                } else {
                                                    if slot < 14642 or slot > 14644 { return -1. }
                                                    return 811.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 14840 {
                                            if slot <= 14728 {
                                                if slot < 14645 or slot > 14728 { return -1. }
                                                return 812.
                                            } else {
                                                if slot < 14729 or slot > 14840 { return -1. }
                                                return 813.
                                            }
                                        } else {
                                            if slot <= 14857 {
                                                if slot < 14841 or slot > 14857 { return -1. }
                                                return 814.
                                            } else {
                                                if slot <= 14863 {
                                                    if slot < 14858 or slot > 14863 { return -1. }
                                                    return 815.
                                                } else {
                                                    if slot < 14864 or slot > 14865 { return -1. }
                                                    return 816.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 14887 {
                                        if slot <= 14878 {
                                            if slot <= 14868 {
                                                if slot < 14866 or slot > 14868 { return -1. }
                                                return 817.
                                            } else {
                                                if slot < 14869 or slot > 14878 { return -1. }
                                                return 818.
                                            }
                                        } else {
                                            if slot <= 14880 {
                                                if slot < 14879 or slot > 14880 { return -1. }
                                                return 819.
                                            } else {
                                                if slot <= 14884 {
                                                    if slot < 14881 or slot > 14884 { return -1. }
                                                    return 820.
                                                } else {
                                                    if slot < 14885 or slot > 14887 { return -1. }
                                                    return 821.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 14900 {
                                            if slot <= 14894 {
                                                if slot < 14888 or slot > 14894 { return -1. }
                                                return 822.
                                            } else {
                                                if slot <= 14896 {
                                                    if slot < 14895 or slot > 14896 { return -1. }
                                                    return 823.
                                                } else {
                                                    if slot < 14897 or slot > 14900 { return -1. }
                                                    return 824.
                                                }
                                            }
                                        } else {
                                            if slot <= 14902 {
                                                if slot < 14901 or slot > 14902 { return -1. }
                                                return 825.
                                            } else {
                                                if slot <= 14904 {
                                                    if slot < 14903 or slot > 14904 { return -1. }
                                                    return 826.
                                                } else {
                                                    if slot < 14905 or slot > 14913 { return -1. }
                                                    return 827.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 15640 {
                        if slot <= 15193 {
                            if slot <= 15086 {
                                if slot <= 15000 {
                                    if slot <= 14970 {
                                        if slot <= 14940 {
                                            if slot <= 14915 {
                                                if slot < 14914 or slot > 14915 { return -1. }
                                                return 828.
                                            } else {
                                                if slot < 14916 or slot > 14940 { return -1. }
                                                return 829.
                                            }
                                        } else {
                                            if slot <= 14943 {
                                                if slot < 14941 or slot > 14943 { return -1. }
                                                return 830.
                                            } else {
                                                if slot <= 14948 {
                                                    if slot < 14944 or slot > 14948 { return -1. }
                                                    return 831.
                                                } else {
                                                    if slot < 14949 or slot > 14970 { return -1. }
                                                    return 832.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 14976 {
                                            if slot <= 14973 {
                                                if slot < 14971 or slot > 14973 { return -1. }
                                                return 833.
                                            } else {
                                                if slot < 14974 or slot > 14976 { return -1. }
                                                return 834.
                                            }
                                        } else {
                                            if slot <= 14978 {
                                                if slot < 14977 or slot > 14978 { return -1. }
                                                return 835.
                                            } else {
                                                if slot <= 14981 {
                                                    if slot < 14979 or slot > 14981 { return -1. }
                                                    return 836.
                                                } else {
                                                    if slot < 14982 or slot > 15000 { return -1. }
                                                    return 837.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15016 {
                                        if slot <= 15008 {
                                            if slot <= 15003 {
                                                if slot < 15001 or slot > 15003 { return -1. }
                                                return 838.
                                            } else {
                                                if slot < 15004 or slot > 15008 { return -1. }
                                                return 839.
                                            }
                                        } else {
                                            if slot <= 15011 {
                                                if slot < 15009 or slot > 15011 { return -1. }
                                                return 840.
                                            } else {
                                                if slot <= 15013 {
                                                    if slot < 15012 or slot > 15013 { return -1. }
                                                    return 841.
                                                } else {
                                                    if slot < 15014 or slot > 15016 { return -1. }
                                                    return 842.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15052 {
                                            if slot <= 15049 {
                                                if slot < 15017 or slot > 15049 { return -1. }
                                                return 843.
                                            } else {
                                                if slot < 15050 or slot > 15052 { return -1. }
                                                return 844.
                                            }
                                        } else {
                                            if slot <= 15058 {
                                                if slot < 15053 or slot > 15058 { return -1. }
                                                return 845.
                                            } else {
                                                if slot <= 15084 {
                                                    if slot < 15059 or slot > 15084 { return -1. }
                                                    return 846.
                                                } else {
                                                    if slot < 15085 or slot > 15086 { return -1. }
                                                    return 847.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 15149 {
                                    if slot <= 15128 {
                                        if slot <= 15118 {
                                            if slot <= 15114 {
                                                if slot < 15087 or slot > 15114 { return -1. }
                                                return 848.
                                            } else {
                                                if slot < 15115 or slot > 15118 { return -1. }
                                                return 849.
                                            }
                                        } else {
                                            if slot <= 15121 {
                                                if slot < 15119 or slot > 15121 { return -1. }
                                                return 850.
                                            } else {
                                                if slot <= 15124 {
                                                    if slot < 15122 or slot > 15124 { return -1. }
                                                    return 851.
                                                } else {
                                                    if slot < 15125 or slot > 15128 { return -1. }
                                                    return 852.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15135 {
                                            if slot <= 15131 {
                                                if slot < 15129 or slot > 15131 { return -1. }
                                                return 853.
                                            } else {
                                                if slot < 15132 or slot > 15135 { return -1. }
                                                return 854.
                                            }
                                        } else {
                                            if slot <= 15142 {
                                                if slot < 15136 or slot > 15142 { return -1. }
                                                return 855.
                                            } else {
                                                if slot <= 15145 {
                                                    if slot < 15143 or slot > 15145 { return -1. }
                                                    return 856.
                                                } else {
                                                    if slot < 15146 or slot > 15149 { return -1. }
                                                    return 857.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15166 {
                                        if slot <= 15154 {
                                            if slot <= 15151 {
                                                if slot < 15150 or slot > 15151 { return -1. }
                                                return 858.
                                            } else {
                                                if slot < 15152 or slot > 15154 { return -1. }
                                                return 859.
                                            }
                                        } else {
                                            if slot <= 15162 {
                                                if slot < 15155 or slot > 15162 { return -1. }
                                                return 860.
                                            } else {
                                                if slot <= 15164 {
                                                    if slot < 15163 or slot > 15164 { return -1. }
                                                    return 861.
                                                } else {
                                                    if slot < 15165 or slot > 15166 { return -1. }
                                                    return 862.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15178 {
                                            if slot <= 15168 {
                                                if slot < 15167 or slot > 15168 { return -1. }
                                                return 863.
                                            } else {
                                                if slot <= 15176 {
                                                    if slot < 15169 or slot > 15176 { return -1. }
                                                    return 864.
                                                } else {
                                                    if slot < 15177 or slot > 15178 { return -1. }
                                                    return 865.
                                                }
                                            }
                                        } else {
                                            if slot <= 15182 {
                                                if slot < 15179 or slot > 15182 { return -1. }
                                                return 866.
                                            } else {
                                                if slot <= 15188 {
                                                    if slot < 15183 or slot > 15188 { return -1. }
                                                    return 867.
                                                } else {
                                                    if slot < 15189 or slot > 15193 { return -1. }
                                                    return 868.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 15417 {
                                if slot <= 15291 {
                                    if slot <= 15225 {
                                        if slot <= 15218 {
                                            if slot <= 15208 {
                                                if slot < 15194 or slot > 15208 { return -1. }
                                                return 869.
                                            } else {
                                                if slot < 15209 or slot > 15218 { return -1. }
                                                return 870.
                                            }
                                        } else {
                                            if slot <= 15221 {
                                                if slot < 15219 or slot > 15221 { return -1. }
                                                return 871.
                                            } else {
                                                if slot <= 15223 {
                                                    if slot < 15222 or slot > 15223 { return -1. }
                                                    return 872.
                                                } else {
                                                    if slot < 15224 or slot > 15225 { return -1. }
                                                    return 873.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15230 {
                                            if slot <= 15227 {
                                                if slot < 15226 or slot > 15227 { return -1. }
                                                return 874.
                                            } else {
                                                if slot < 15229 or slot > 15230 { return -1. }
                                                return 875.
                                            }
                                        } else {
                                            if slot <= 15234 {
                                                if slot < 15231 or slot > 15234 { return -1. }
                                                return 876.
                                            } else {
                                                if slot <= 15289 {
                                                    if slot < 15235 or slot > 15289 { return -1. }
                                                    return 877.
                                                } else {
                                                    if slot < 15290 or slot > 15291 { return -1. }
                                                    return 878.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15333 {
                                        if slot <= 15303 {
                                            if slot <= 15298 {
                                                if slot < 15292 or slot > 15298 { return -1. }
                                                return 879.
                                            } else {
                                                if slot < 15299 or slot > 15303 { return -1. }
                                                return 880.
                                            }
                                        } else {
                                            if slot <= 15317 {
                                                if slot < 15304 or slot > 15317 { return -1. }
                                                return 881.
                                            } else {
                                                if slot <= 15326 {
                                                    if slot < 15318 or slot > 15326 { return -1. }
                                                    return 882.
                                                } else {
                                                    if slot < 15327 or slot > 15333 { return -1. }
                                                    return 883.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15350 {
                                            if slot <= 15343 {
                                                if slot < 15334 or slot > 15343 { return -1. }
                                                return 884.
                                            } else {
                                                if slot <= 15345 {
                                                    if slot < 15344 or slot > 15345 { return -1. }
                                                    return 885.
                                                } else {
                                                    if slot < 15346 or slot > 15350 { return -1. }
                                                    return 886.
                                                }
                                            }
                                        } else {
                                            if slot <= 15401 {
                                                if slot < 15400 or slot > 15401 { return -1. }
                                                return 887.
                                            } else {
                                                if slot <= 15412 {
                                                    if slot < 15402 or slot > 15412 { return -1. }
                                                    return 888.
                                                } else {
                                                    if slot < 15413 or slot > 15417 { return -1. }
                                                    return 889.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 15483 {
                                    if slot <= 15461 {
                                        if slot <= 15428 {
                                            if slot <= 15422 {
                                                if slot < 15418 or slot > 15422 { return -1. }
                                                return 890.
                                            } else {
                                                if slot < 15423 or slot > 15428 { return -1. }
                                                return 891.
                                            }
                                        } else {
                                            if slot <= 15437 {
                                                if slot < 15429 or slot > 15437 { return -1. }
                                                return 892.
                                            } else {
                                                if slot <= 15454 {
                                                    if slot < 15438 or slot > 15454 { return -1. }
                                                    return 893.
                                                } else {
                                                    if slot < 15455 or slot > 15461 { return -1. }
                                                    return 894.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15469 {
                                            if slot <= 15464 {
                                                if slot < 15462 or slot > 15464 { return -1. }
                                                return 895.
                                            } else {
                                                if slot < 15465 or slot > 15469 { return -1. }
                                                return 896.
                                            }
                                        } else {
                                            if slot <= 15478 {
                                                if slot < 15470 or slot > 15478 { return -1. }
                                                return 897.
                                            } else {
                                                if slot <= 15480 {
                                                    if slot < 15479 or slot > 15480 { return -1. }
                                                    return 898.
                                                } else {
                                                    if slot < 15481 or slot > 15483 { return -1. }
                                                    return 899.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15557 {
                                        if slot <= 15531 {
                                            if slot <= 15524 {
                                                if slot < 15484 or slot > 15524 { return -1. }
                                                return 900.
                                            } else {
                                                if slot < 15525 or slot > 15531 { return -1. }
                                                return 901.
                                            }
                                        } else {
                                            if slot <= 15541 {
                                                if slot < 15532 or slot > 15541 { return -1. }
                                                return 902.
                                            } else {
                                                if slot <= 15543 {
                                                    if slot < 15542 or slot > 15543 { return -1. }
                                                    return 903.
                                                } else {
                                                    if slot < 15544 or slot > 15557 { return -1. }
                                                    return 904.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15625 {
                                            if slot <= 15563 {
                                                if slot < 15558 or slot > 15563 { return -1. }
                                                return 905.
                                            } else {
                                                if slot <= 15571 {
                                                    if slot < 15564 or slot > 15571 { return -1. }
                                                    return 906.
                                                } else {
                                                    if slot < 15572 or slot > 15625 { return -1. }
                                                    return 907.
                                                }
                                            }
                                        } else {
                                            if slot <= 15627 {
                                                if slot < 15626 or slot > 15627 { return -1. }
                                                return 908.
                                            } else {
                                                if slot <= 15632 {
                                                    if slot < 15628 or slot > 15632 { return -1. }
                                                    return 909.
                                                } else {
                                                    if slot < 15633 or slot > 15640 { return -1. }
                                                    return 910.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 15908 {
                            if slot <= 15804 {
                                if slot <= 15704 {
                                    if slot <= 15665 {
                                        if slot <= 15649 {
                                            if slot <= 15643 {
                                                if slot < 15641 or slot > 15643 { return -1. }
                                                return 911.
                                            } else {
                                                if slot < 15644 or slot > 15649 { return -1. }
                                                return 912.
                                            }
                                        } else {
                                            if slot <= 15662 {
                                                if slot < 15650 or slot > 15662 { return -1. }
                                                return 913.
                                            } else {
                                                if slot <= 15664 {
                                                    if slot < 15663 or slot > 15664 { return -1. }
                                                    return 914.
                                                } else {
                                                    if slot < 15665 or slot > 15665 { return -1. }
                                                    return 915.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15685 {
                                            if slot <= 15678 {
                                                if slot < 15666 or slot > 15678 { return -1. }
                                                return 916.
                                            } else {
                                                if slot < 15679 or slot > 15685 { return -1. }
                                                return 917.
                                            }
                                        } else {
                                            if slot <= 15690 {
                                                if slot < 15686 or slot > 15690 { return -1. }
                                                return 918.
                                            } else {
                                                if slot <= 15698 {
                                                    if slot < 15691 or slot > 15698 { return -1. }
                                                    return 919.
                                                } else {
                                                    if slot < 15699 or slot > 15704 { return -1. }
                                                    return 920.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15780 {
                                        if slot <= 15710 {
                                            if slot <= 15706 {
                                                if slot < 15705 or slot > 15706 { return -1. }
                                                return 921.
                                            } else {
                                                if slot < 15707 or slot > 15710 { return -1. }
                                                return 922.
                                            }
                                        } else {
                                            if slot <= 15730 {
                                                if slot < 15711 or slot > 15730 { return -1. }
                                                return 923.
                                            } else {
                                                if slot <= 15778 {
                                                    if slot < 15731 or slot > 15778 { return -1. }
                                                    return 924.
                                                } else {
                                                    if slot < 15779 or slot > 15780 { return -1. }
                                                    return 925.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15787 {
                                            if slot <= 15783 {
                                                if slot < 15781 or slot > 15783 { return -1. }
                                                return 926.
                                            } else {
                                                if slot < 15784 or slot > 15787 { return -1. }
                                                return 927.
                                            }
                                        } else {
                                            if slot <= 15789 {
                                                if slot < 15788 or slot > 15789 { return -1. }
                                                return 928.
                                            } else {
                                                if slot <= 15794 {
                                                    if slot < 15790 or slot > 15794 { return -1. }
                                                    return 929.
                                                } else {
                                                    if slot < 15795 or slot > 15804 { return -1. }
                                                    return 930.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 15831 {
                                    if slot <= 15815 {
                                        if slot <= 15808 {
                                            if slot <= 15806 {
                                                if slot < 15805 or slot > 15806 { return -1. }
                                                return 931.
                                            } else {
                                                if slot < 15807 or slot > 15808 { return -1. }
                                                return 932.
                                            }
                                        } else {
                                            if slot <= 15810 {
                                                if slot < 15809 or slot > 15810 { return -1. }
                                                return 933.
                                            } else {
                                                if slot <= 15813 {
                                                    if slot < 15811 or slot > 15813 { return -1. }
                                                    return 934.
                                                } else {
                                                    if slot < 15814 or slot > 15815 { return -1. }
                                                    return 935.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15824 {
                                            if slot <= 15822 {
                                                if slot < 15816 or slot > 15822 { return -1. }
                                                return 936.
                                            } else {
                                                if slot < 15823 or slot > 15824 { return -1. }
                                                return 937.
                                            }
                                        } else {
                                            if slot <= 15826 {
                                                if slot < 15825 or slot > 15826 { return -1. }
                                                return 938.
                                            } else {
                                                if slot <= 15828 {
                                                    if slot < 15827 or slot > 15828 { return -1. }
                                                    return 939.
                                                } else {
                                                    if slot < 15829 or slot > 15831 { return -1. }
                                                    return 940.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15860 {
                                        if slot <= 15838 {
                                            if slot <= 15834 {
                                                if slot < 15832 or slot > 15834 { return -1. }
                                                return 941.
                                            } else {
                                                if slot < 15835 or slot > 15838 { return -1. }
                                                return 942.
                                            }
                                        } else {
                                            if slot <= 15841 {
                                                if slot < 15839 or slot > 15841 { return -1. }
                                                return 943.
                                            } else {
                                                if slot <= 15858 {
                                                    if slot < 15842 or slot > 15858 { return -1. }
                                                    return 944.
                                                } else {
                                                    if slot < 15859 or slot > 15860 { return -1. }
                                                    return 945.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15899 {
                                            if slot <= 15895 {
                                                if slot < 15861 or slot > 15895 { return -1. }
                                                return 946.
                                            } else {
                                                if slot <= 15897 {
                                                    if slot < 15896 or slot > 15897 { return -1. }
                                                    return 947.
                                                } else {
                                                    if slot < 15898 or slot > 15899 { return -1. }
                                                    return 948.
                                                }
                                            }
                                        } else {
                                            if slot <= 15903 {
                                                if slot < 15900 or slot > 15903 { return -1. }
                                                return 949.
                                            } else {
                                                if slot <= 15905 {
                                                    if slot < 15904 or slot > 15905 { return -1. }
                                                    return 950.
                                                } else {
                                                    if slot < 15906 or slot > 15908 { return -1. }
                                                    return 951.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 16087 {
                                if slot <= 16006 {
                                    if slot <= 15962 {
                                        if slot <= 15920 {
                                            if slot <= 15914 {
                                                if slot < 15909 or slot > 15914 { return -1. }
                                                return 952.
                                            } else {
                                                if slot < 15915 or slot > 15920 { return -1. }
                                                return 953.
                                            }
                                        } else {
                                            if slot <= 15926 {
                                                if slot < 15921 or slot > 15926 { return -1. }
                                                return 954.
                                            } else {
                                                if slot <= 15935 {
                                                    if slot < 15927 or slot > 15935 { return -1. }
                                                    return 955.
                                                } else {
                                                    if slot < 15936 or slot > 15962 { return -1. }
                                                    return 956.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15985 {
                                            if slot <= 15969 {
                                                if slot < 15963 or slot > 15969 { return -1. }
                                                return 957.
                                            } else {
                                                if slot < 15970 or slot > 15985 { return -1. }
                                                return 958.
                                            }
                                        } else {
                                            if slot <= 15987 {
                                                if slot < 15986 or slot > 15987 { return -1. }
                                                return 959.
                                            } else {
                                                if slot <= 15995 {
                                                    if slot < 15988 or slot > 15995 { return -1. }
                                                    return 960.
                                                } else {
                                                    if slot < 15996 or slot > 16006 { return -1. }
                                                    return 961.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 16060 {
                                        if slot <= 16018 {
                                            if slot <= 16009 {
                                                if slot < 16007 or slot > 16009 { return -1. }
                                                return 962.
                                            } else {
                                                if slot < 16010 or slot > 16018 { return -1. }
                                                return 963.
                                            }
                                        } else {
                                            if slot <= 16042 {
                                                if slot < 16019 or slot > 16042 { return -1. }
                                                return 964.
                                            } else {
                                                if slot <= 16057 {
                                                    if slot < 16043 or slot > 16057 { return -1. }
                                                    return 965.
                                                } else {
                                                    if slot < 16058 or slot > 16060 { return -1. }
                                                    return 966.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 16075 {
                                            if slot <= 16063 {
                                                if slot < 16061 or slot > 16063 { return -1. }
                                                return 967.
                                            } else {
                                                if slot <= 16065 {
                                                    if slot < 16064 or slot > 16065 { return -1. }
                                                    return 968.
                                                } else {
                                                    if slot < 16066 or slot > 16075 { return -1. }
                                                    return 969.
                                                }
                                            }
                                        } else {
                                            if slot <= 16077 {
                                                if slot < 16076 or slot > 16077 { return -1. }
                                                return 970.
                                            } else {
                                                if slot <= 16082 {
                                                    if slot < 16078 or slot > 16082 { return -1. }
                                                    return 971.
                                                } else {
                                                    if slot < 16083 or slot > 16087 { return -1. }
                                                    return 972.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 16228 {
                                    if slot <= 16136 {
                                        if slot <= 16103 {
                                            if slot <= 16092 {
                                                if slot < 16088 or slot > 16092 { return -1. }
                                                return 973.
                                            } else {
                                                if slot < 16093 or slot > 16103 { return -1. }
                                                return 974.
                                            }
                                        } else {
                                            if slot <= 16108 {
                                                if slot < 16104 or slot > 16108 { return -1. }
                                                return 975.
                                            } else {
                                                if slot <= 16111 {
                                                    if slot < 16109 or slot > 16111 { return -1. }
                                                    return 976.
                                                } else {
                                                    if slot < 16112 or slot > 16136 { return -1. }
                                                    return 977.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 16171 {
                                            if slot <= 16154 {
                                                if slot < 16137 or slot > 16154 { return -1. }
                                                return 978.
                                            } else {
                                                if slot < 16155 or slot > 16171 { return -1. }
                                                return 979.
                                            }
                                        } else {
                                            if slot <= 16174 {
                                                if slot < 16172 or slot > 16174 { return -1. }
                                                return 980.
                                            } else {
                                                if slot <= 16224 {
                                                    if slot < 16175 or slot > 16224 { return -1. }
                                                    return 981.
                                                } else {
                                                    if slot < 16225 or slot > 16228 { return -1. }
                                                    return 982.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 16248 {
                                        if slot <= 16236 {
                                            if slot <= 16230 {
                                                if slot < 16229 or slot > 16230 { return -1. }
                                                return 983.
                                            } else {
                                                if slot < 16231 or slot > 16236 { return -1. }
                                                return 984.
                                            }
                                        } else {
                                            if slot <= 16242 {
                                                if slot < 16237 or slot > 16242 { return -1. }
                                                return 985.
                                            } else {
                                                if slot <= 16244 {
                                                    if slot < 16243 or slot > 16244 { return -1. }
                                                    return 986.
                                                } else {
                                                    if slot < 16245 or slot > 16248 { return -1. }
                                                    return 987.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 16295 {
                                            if slot <= 16269 {
                                                if slot < 16249 or slot > 16269 { return -1. }
                                                return 988.
                                            } else {
                                                if slot <= 16283 {
                                                    if slot < 16270 or slot > 16283 { return -1. }
                                                    return 989.
                                                } else {
                                                    if slot < 16284 or slot > 16295 { return -1. }
                                                    return 990.
                                                }
                                            }
                                        } else {
                                            if slot <= 16297 {
                                                if slot < 16296 or slot > 16297 { return -1. }
                                                return 991.
                                            } else {
                                                if slot <= 16303 {
                                                    if slot < 16298 or slot > 16303 { return -1. }
                                                    return 992.
                                                } else {
                                                    if slot < 16304 or slot > 16306 { return -1. }
                                                    return 993.
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
                if slot <= 19111 {
                    if slot <= 17948 {
                        if slot <= 17369 {
                            if slot <= 17003 {
                                if slot <= 16587 {
                                    if slot <= 16496 {
                                        if slot <= 16416 {
                                            if slot <= 16307 {
                                                if slot < 16307 or slot > 16307 { return -1. }
                                                return 994.
                                            } else {
                                                if slot < 16384 or slot > 16416 { return -1. }
                                                return 995.
                                            }
                                        } else {
                                            if slot <= 16423 {
                                                if slot < 16417 or slot > 16423 { return -1. }
                                                return 996.
                                            } else {
                                                if slot <= 16494 {
                                                    if slot < 16424 or slot > 16494 { return -1. }
                                                    return 997.
                                                } else {
                                                    if slot < 16495 or slot > 16496 { return -1. }
                                                    return 998.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 16517 {
                                            if slot <= 16498 {
                                                if slot < 16497 or slot > 16498 { return -1. }
                                                return 999.
                                            } else {
                                                if slot < 16499 or slot > 16517 { return -1. }
                                                return 1000.
                                            }
                                        } else {
                                            if slot <= 16520 {
                                                if slot < 16518 or slot > 16520 { return -1. }
                                                return 1001.
                                            } else {
                                                if slot <= 16530 {
                                                    if slot < 16523 or slot > 16530 { return -1. }
                                                    return 1002.
                                                } else {
                                                    if slot < 16531 or slot > 16587 { return -1. }
                                                    return 1003.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 16821 {
                                        if slot <= 16653 {
                                            if slot <= 16589 {
                                                if slot < 16588 or slot > 16589 { return -1. }
                                                return 1004.
                                            } else {
                                                if slot < 16590 or slot > 16653 { return -1. }
                                                return 1005.
                                            }
                                        } else {
                                            if slot <= 16781 {
                                                if slot < 16654 or slot > 16781 { return -1. }
                                                return 1006.
                                            } else {
                                                if slot <= 16787 {
                                                    if slot < 16782 or slot > 16787 { return -1. }
                                                    return 1007.
                                                } else {
                                                    if slot < 16788 or slot > 16821 { return -1. }
                                                    return 1008.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 16890 {
                                            if slot <= 16873 {
                                                if slot < 16822 or slot > 16873 { return -1. }
                                                return 1009.
                                            } else {
                                                if slot < 16874 or slot > 16890 { return -1. }
                                                return 1010.
                                            }
                                        } else {
                                            if slot <= 16913 {
                                                if slot < 16891 or slot > 16913 { return -1. }
                                                return 1011.
                                            } else {
                                                if slot <= 16989 {
                                                    if slot < 16914 or slot > 16989 { return -1. }
                                                    return 1012.
                                                } else {
                                                    if slot < 16990 or slot > 17003 { return -1. }
                                                    return 1013.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 17255 {
                                    if slot <= 17215 {
                                        if slot <= 17164 {
                                            if slot <= 17046 {
                                                if slot < 17004 or slot > 17046 { return -1. }
                                                return 1014.
                                            } else {
                                                if slot < 17047 or slot > 17164 { return -1. }
                                                return 1015.
                                            }
                                        } else {
                                            if slot <= 17171 {
                                                if slot < 17165 or slot > 17171 { return -1. }
                                                return 1016.
                                            } else {
                                                if slot <= 17176 {
                                                    if slot < 17172 or slot > 17176 { return -1. }
                                                    return 1017.
                                                } else {
                                                    if slot < 17177 or slot > 17215 { return -1. }
                                                    return 1018.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 17240 {
                                            if slot <= 17225 {
                                                if slot < 17216 or slot > 17225 { return -1. }
                                                return 1019.
                                            } else {
                                                if slot < 17226 or slot > 17240 { return -1. }
                                                return 1020.
                                            }
                                        } else {
                                            if slot <= 17244 {
                                                if slot < 17241 or slot > 17244 { return -1. }
                                                return 1021.
                                            } else {
                                                if slot <= 17246 {
                                                    if slot < 17245 or slot > 17246 { return -1. }
                                                    return 1022.
                                                } else {
                                                    if slot < 17247 or slot > 17255 { return -1. }
                                                    return 1023.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 17330 {
                                        if slot <= 17310 {
                                            if slot <= 17299 {
                                                if slot < 17256 or slot > 17299 { return -1. }
                                                return 1024.
                                            } else {
                                                if slot < 17300 or slot > 17310 { return -1. }
                                                return 1025.
                                            }
                                        } else {
                                            if slot <= 17318 {
                                                if slot < 17313 or slot > 17318 { return -1. }
                                                return 1026.
                                            } else {
                                                if slot <= 17325 {
                                                    if slot < 17319 or slot > 17325 { return -1. }
                                                    return 1027.
                                                } else {
                                                    if slot < 17326 or slot > 17330 { return -1. }
                                                    return 1028.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 17341 {
                                            if slot <= 17332 {
                                                if slot < 17331 or slot > 17332 { return -1. }
                                                return 1029.
                                            } else {
                                                if slot <= 17338 {
                                                    if slot < 17333 or slot > 17338 { return -1. }
                                                    return 1030.
                                                } else {
                                                    if slot < 17339 or slot > 17341 { return -1. }
                                                    return 1031.
                                                }
                                            }
                                        } else {
                                            if slot <= 17347 {
                                                if slot < 17342 or slot > 17347 { return -1. }
                                                return 1032.
                                            } else {
                                                if slot <= 17353 {
                                                    if slot < 17348 or slot > 17353 { return -1. }
                                                    return 1033.
                                                } else {
                                                    if slot < 17354 or slot > 17369 { return -1. }
                                                    return 1034.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 17765 {
                                if slot <= 17529 {
                                    if slot <= 17419 {
                                        if slot <= 17401 {
                                            if slot <= 17372 {
                                                if slot < 17370 or slot > 17372 { return -1. }
                                                return 1035.
                                            } else {
                                                if slot < 17374 or slot > 17401 { return -1. }
                                                return 1036.
                                            }
                                        } else {
                                            if slot <= 17411 {
                                                if slot < 17408 or slot > 17411 { return -1. }
                                                return 1037.
                                            } else {
                                                if slot <= 17413 {
                                                    if slot < 17412 or slot > 17413 { return -1. }
                                                    return 1038.
                                                } else {
                                                    if slot < 17414 or slot > 17419 { return -1. }
                                                    return 1039.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 17428 {
                                            if slot <= 17427 {
                                                if slot < 17420 or slot > 17427 { return -1. }
                                                return 1040.
                                            } else {
                                                if slot < 17428 or slot > 17428 { return -1. }
                                                return 1041.
                                            }
                                        } else {
                                            if slot <= 17460 {
                                                if slot < 17431 or slot > 17460 { return -1. }
                                                return 1042.
                                            } else {
                                                if slot <= 17465 {
                                                    if slot < 17461 or slot > 17465 { return -1. }
                                                    return 1043.
                                                } else {
                                                    if slot < 17466 or slot > 17529 { return -1. }
                                                    return 1044.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 17616 {
                                        if slot <= 17595 {
                                            if slot <= 17547 {
                                                if slot < 17530 or slot > 17547 { return -1. }
                                                return 1045.
                                            } else {
                                                if slot < 17548 or slot > 17595 { return -1. }
                                                return 1046.
                                            }
                                        } else {
                                            if slot <= 17601 {
                                                if slot < 17596 or slot > 17601 { return -1. }
                                                return 1047.
                                            } else {
                                                if slot <= 17606 {
                                                    if slot < 17602 or slot > 17606 { return -1. }
                                                    return 1048.
                                                } else {
                                                    if slot < 17607 or slot > 17616 { return -1. }
                                                    return 1049.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 17732 {
                                            if slot <= 17636 {
                                                if slot < 17617 or slot > 17636 { return -1. }
                                                return 1050.
                                            } else {
                                                if slot <= 17707 {
                                                    if slot < 17637 or slot > 17707 { return -1. }
                                                    return 1051.
                                                } else {
                                                    if slot < 17708 or slot > 17732 { return -1. }
                                                    return 1052.
                                                }
                                            }
                                        } else {
                                            if slot <= 17759 {
                                                if slot < 17733 or slot > 17759 { return -1. }
                                                return 1053.
                                            } else {
                                                if slot <= 17762 {
                                                    if slot < 17760 or slot > 17762 { return -1. }
                                                    return 1054.
                                                } else {
                                                    if slot < 17763 or slot > 17765 { return -1. }
                                                    return 1055.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 17858 {
                                    if slot <= 17787 {
                                        if slot <= 17772 {
                                            if slot <= 17770 {
                                                if slot < 17766 or slot > 17770 { return -1. }
                                                return 1056.
                                            } else {
                                                if slot < 17771 or slot > 17772 { return -1. }
                                                return 1057.
                                            }
                                        } else {
                                            if slot <= 17775 {
                                                if slot < 17773 or slot > 17775 { return -1. }
                                                return 1058.
                                            } else {
                                                if slot <= 17783 {
                                                    if slot < 17776 or slot > 17783 { return -1. }
                                                    return 1059.
                                                } else {
                                                    if slot < 17784 or slot > 17787 { return -1. }
                                                    return 1060.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 17813 {
                                            if slot <= 17807 {
                                                if slot < 17788 or slot > 17807 { return -1. }
                                                return 1061.
                                            } else {
                                                if slot < 17808 or slot > 17813 { return -1. }
                                                return 1062.
                                            }
                                        } else {
                                            if slot <= 17852 {
                                                if slot < 17814 or slot > 17852 { return -1. }
                                                return 1063.
                                            } else {
                                                if slot <= 17855 {
                                                    if slot < 17853 or slot > 17855 { return -1. }
                                                    return 1064.
                                                } else {
                                                    if slot < 17856 or slot > 17858 { return -1. }
                                                    return 1065.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 17911 {
                                        if slot <= 17875 {
                                            if slot <= 17861 {
                                                if slot < 17859 or slot > 17861 { return -1. }
                                                return 1066.
                                            } else {
                                                if slot < 17862 or slot > 17875 { return -1. }
                                                return 1067.
                                            }
                                        } else {
                                            if slot <= 17878 {
                                                if slot < 17876 or slot > 17878 { return -1. }
                                                return 1068.
                                            } else {
                                                if slot <= 17894 {
                                                    if slot < 17879 or slot > 17894 { return -1. }
                                                    return 1069.
                                                } else {
                                                    if slot < 17895 or slot > 17911 { return -1. }
                                                    return 1070.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 17923 {
                                            if slot <= 17916 {
                                                if slot < 17912 or slot > 17916 { return -1. }
                                                return 1071.
                                            } else {
                                                if slot <= 17920 {
                                                    if slot < 17917 or slot > 17920 { return -1. }
                                                    return 1072.
                                                } else {
                                                    if slot < 17921 or slot > 17923 { return -1. }
                                                    return 1073.
                                                }
                                            }
                                        } else {
                                            if slot <= 17934 {
                                                if slot < 17924 or slot > 17934 { return -1. }
                                                return 1074.
                                            } else {
                                                if slot <= 17939 {
                                                    if slot < 17935 or slot > 17939 { return -1. }
                                                    return 1075.
                                                } else {
                                                    if slot < 17940 or slot > 17948 { return -1. }
                                                    return 1076.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 18514 {
                            if slot <= 18157 {
                                if slot <= 18055 {
                                    if slot <= 18024 {
                                        if slot <= 17960 {
                                            if slot <= 17953 {
                                                if slot < 17949 or slot > 17953 { return -1. }
                                                return 1077.
                                            } else {
                                                if slot < 17954 or slot > 17960 { return -1. }
                                                return 1078.
                                            }
                                        } else {
                                            if slot <= 17969 {
                                                if slot < 17961 or slot > 17969 { return -1. }
                                                return 1079.
                                            } else {
                                                if slot <= 17995 {
                                                    if slot < 17970 or slot > 17995 { return -1. }
                                                    return 1080.
                                                } else {
                                                    if slot < 17996 or slot > 18024 { return -1. }
                                                    return 1081.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18040 {
                                            if slot <= 18033 {
                                                if slot < 18025 or slot > 18033 { return -1. }
                                                return 1082.
                                            } else {
                                                if slot < 18034 or slot > 18040 { return -1. }
                                                return 1083.
                                            }
                                        } else {
                                            if slot <= 18044 {
                                                if slot < 18041 or slot > 18044 { return -1. }
                                                return 1084.
                                            } else {
                                                if slot <= 18046 {
                                                    if slot < 18045 or slot > 18046 { return -1. }
                                                    return 1085.
                                                } else {
                                                    if slot < 18047 or slot > 18055 { return -1. }
                                                    return 1086.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 18080 {
                                        if slot <= 18065 {
                                            if slot <= 18057 {
                                                if slot < 18056 or slot > 18057 { return -1. }
                                                return 1087.
                                            } else {
                                                if slot < 18058 or slot > 18065 { return -1. }
                                                return 1088.
                                            }
                                        } else {
                                            if slot <= 18067 {
                                                if slot < 18066 or slot > 18067 { return -1. }
                                                return 1089.
                                            } else {
                                                if slot <= 18077 {
                                                    if slot < 18068 or slot > 18077 { return -1. }
                                                    return 1090.
                                                } else {
                                                    if slot < 18078 or slot > 18080 { return -1. }
                                                    return 1091.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18093 {
                                            if slot <= 18089 {
                                                if slot < 18081 or slot > 18089 { return -1. }
                                                return 1092.
                                            } else {
                                                if slot < 18090 or slot > 18093 { return -1. }
                                                return 1093.
                                            }
                                        } else {
                                            if slot <= 18141 {
                                                if slot < 18094 or slot > 18141 { return -1. }
                                                return 1094.
                                            } else {
                                                if slot <= 18155 {
                                                    if slot < 18142 or slot > 18155 { return -1. }
                                                    return 1095.
                                                } else {
                                                    if slot < 18156 or slot > 18157 { return -1. }
                                                    return 1096.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 18236 {
                                    if slot <= 18189 {
                                        if slot <= 18169 {
                                            if slot <= 18164 {
                                                if slot < 18158 or slot > 18164 { return -1. }
                                                return 1097.
                                            } else {
                                                if slot < 18165 or slot > 18169 { return -1. }
                                                return 1098.
                                            }
                                        } else {
                                            if slot <= 18173 {
                                                if slot < 18170 or slot > 18173 { return -1. }
                                                return 1099.
                                            } else {
                                                if slot <= 18182 {
                                                    if slot < 18174 or slot > 18182 { return -1. }
                                                    return 1100.
                                                } else {
                                                    if slot < 18183 or slot > 18189 { return -1. }
                                                    return 1101.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18212 {
                                            if slot <= 18207 {
                                                if slot < 18190 or slot > 18207 { return -1. }
                                                return 1102.
                                            } else {
                                                if slot < 18208 or slot > 18212 { return -1. }
                                                return 1103.
                                            }
                                        } else {
                                            if slot <= 18228 {
                                                if slot < 18213 or slot > 18228 { return -1. }
                                                return 1104.
                                            } else {
                                                if slot <= 18233 {
                                                    if slot < 18229 or slot > 18233 { return -1. }
                                                    return 1105.
                                                } else {
                                                    if slot < 18234 or slot > 18236 { return -1. }
                                                    return 1106.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 18362 {
                                        if slot <= 18292 {
                                            if slot <= 18267 {
                                                if slot < 18237 or slot > 18267 { return -1. }
                                                return 1107.
                                            } else {
                                                if slot < 18268 or slot > 18292 { return -1. }
                                                return 1108.
                                            }
                                        } else {
                                            if slot <= 18295 {
                                                if slot < 18293 or slot > 18295 { return -1. }
                                                return 1109.
                                            } else {
                                                if slot <= 18336 {
                                                    if slot < 18296 or slot > 18336 { return -1. }
                                                    return 1110.
                                                } else {
                                                    if slot < 18337 or slot > 18362 { return -1. }
                                                    return 1111.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18384 {
                                            if slot <= 18364 {
                                                if slot < 18363 or slot > 18364 { return -1. }
                                                return 1112.
                                            } else {
                                                if slot <= 18373 {
                                                    if slot < 18365 or slot > 18373 { return -1. }
                                                    return 1113.
                                                } else {
                                                    if slot < 18374 or slot > 18384 { return -1. }
                                                    return 1114.
                                                }
                                            }
                                        } else {
                                            if slot <= 18453 {
                                                if slot < 18436 or slot > 18453 { return -1. }
                                                return 1115.
                                            } else {
                                                if slot <= 18504 {
                                                    if slot < 18454 or slot > 18504 { return -1. }
                                                    return 1116.
                                                } else {
                                                    if slot < 18509 or slot > 18514 { return -1. }
                                                    return 1117.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 18889 {
                                if slot <= 18718 {
                                    if slot <= 18698 {
                                        if slot <= 18538 {
                                            if slot <= 18526 {
                                                if slot < 18515 or slot > 18526 { return -1. }
                                                return 1118.
                                            } else {
                                                if slot < 18527 or slot > 18538 { return -1. }
                                                return 1119.
                                            }
                                        } else {
                                            if slot <= 18581 {
                                                if slot < 18539 or slot > 18581 { return -1. }
                                                return 1120.
                                            } else {
                                                if slot <= 18688 {
                                                    if slot < 18582 or slot > 18688 { return -1. }
                                                    return 1121.
                                                } else {
                                                    if slot < 18689 or slot > 18698 { return -1. }
                                                    return 1122.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18704 {
                                            if slot <= 18701 {
                                                if slot < 18699 or slot > 18701 { return -1. }
                                                return 1123.
                                            } else {
                                                if slot < 18702 or slot > 18704 { return -1. }
                                                return 1124.
                                            }
                                        } else {
                                            if slot <= 18706 {
                                                if slot < 18705 or slot > 18706 { return -1. }
                                                return 1125.
                                            } else {
                                                if slot <= 18716 {
                                                    if slot < 18707 or slot > 18716 { return -1. }
                                                    return 1126.
                                                } else {
                                                    if slot < 18717 or slot > 18718 { return -1. }
                                                    return 1127.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 18797 {
                                        if slot <= 18724 {
                                            if slot <= 18720 {
                                                if slot < 18719 or slot > 18720 { return -1. }
                                                return 1128.
                                            } else {
                                                if slot < 18721 or slot > 18724 { return -1. }
                                                return 1129.
                                            }
                                        } else {
                                            if slot <= 18733 {
                                                if slot < 18727 or slot > 18733 { return -1. }
                                                return 1130.
                                            } else {
                                                if slot <= 18793 {
                                                    if slot < 18734 or slot > 18793 { return -1. }
                                                    return 1131.
                                                } else {
                                                    if slot < 18794 or slot > 18797 { return -1. }
                                                    return 1132.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18859 {
                                            if slot <= 18801 {
                                                if slot < 18798 or slot > 18801 { return -1. }
                                                return 1133.
                                            } else {
                                                if slot <= 18803 {
                                                    if slot < 18802 or slot > 18803 { return -1. }
                                                    return 1134.
                                                } else {
                                                    if slot < 18804 or slot > 18859 { return -1. }
                                                    return 1135.
                                                }
                                            }
                                        } else {
                                            if slot <= 18875 {
                                                if slot < 18860 or slot > 18875 { return -1. }
                                                return 1136.
                                            } else {
                                                if slot <= 18883 {
                                                    if slot < 18876 or slot > 18883 { return -1. }
                                                    return 1137.
                                                } else {
                                                    if slot < 18884 or slot > 18889 { return -1. }
                                                    return 1138.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 19018 {
                                    if slot <= 18923 {
                                        if slot <= 18912 {
                                            if slot <= 18907 {
                                                if slot < 18890 or slot > 18907 { return -1. }
                                                return 1139.
                                            } else {
                                                if slot < 18908 or slot > 18912 { return -1. }
                                                return 1140.
                                            }
                                        } else {
                                            if slot <= 18916 {
                                                if slot < 18913 or slot > 18916 { return -1. }
                                                return 1141.
                                            } else {
                                                if slot <= 18919 {
                                                    if slot < 18917 or slot > 18919 { return -1. }
                                                    return 1142.
                                                } else {
                                                    if slot < 18920 or slot > 18923 { return -1. }
                                                    return 1143.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18945 {
                                            if slot <= 18938 {
                                                if slot < 18924 or slot > 18938 { return -1. }
                                                return 1144.
                                            } else {
                                                if slot < 18939 or slot > 18945 { return -1. }
                                                return 1145.
                                            }
                                        } else {
                                            if slot <= 18948 {
                                                if slot < 18946 or slot > 18948 { return -1. }
                                                return 1146.
                                            } else {
                                                if slot <= 19012 {
                                                    if slot < 18949 or slot > 19012 { return -1. }
                                                    return 1147.
                                                } else {
                                                    if slot < 19013 or slot > 19018 { return -1. }
                                                    return 1148.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19039 {
                                        if slot <= 19031 {
                                            if slot <= 19024 {
                                                if slot < 19019 or slot > 19024 { return -1. }
                                                return 1149.
                                            } else {
                                                if slot < 19025 or slot > 19031 { return -1. }
                                                return 1150.
                                            }
                                        } else {
                                            if slot <= 19034 {
                                                if slot < 19032 or slot > 19034 { return -1. }
                                                return 1151.
                                            } else {
                                                if slot <= 19036 {
                                                    if slot < 19035 or slot > 19036 { return -1. }
                                                    return 1152.
                                                } else {
                                                    if slot < 19037 or slot > 19039 { return -1. }
                                                    return 1153.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19054 {
                                            if slot <= 19042 {
                                                if slot < 19040 or slot > 19042 { return -1. }
                                                return 1154.
                                            } else {
                                                if slot <= 19046 {
                                                    if slot < 19043 or slot > 19046 { return -1. }
                                                    return 1155.
                                                } else {
                                                    if slot < 19047 or slot > 19054 { return -1. }
                                                    return 1156.
                                                }
                                            }
                                        } else {
                                            if slot <= 19079 {
                                                if slot < 19055 or slot > 19079 { return -1. }
                                                return 1157.
                                            } else {
                                                if slot <= 19095 {
                                                    if slot < 19080 or slot > 19095 { return -1. }
                                                    return 1158.
                                                } else {
                                                    if slot < 19096 or slot > 19111 { return -1. }
                                                    return 1159.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 20220 {
                        if slot <= 19891 {
                            if slot <= 19302 {
                                if slot <= 19241 {
                                    if slot <= 19193 {
                                        if slot <= 19173 {
                                            if slot <= 19154 {
                                                if slot < 19112 or slot > 19154 { return -1. }
                                                return 1160.
                                            } else {
                                                if slot < 19155 or slot > 19173 { return -1. }
                                                return 1161.
                                            }
                                        } else {
                                            if slot <= 19175 {
                                                if slot < 19174 or slot > 19175 { return -1. }
                                                return 1162.
                                            } else {
                                                if slot <= 19190 {
                                                    if slot < 19176 or slot > 19190 { return -1. }
                                                    return 1163.
                                                } else {
                                                    if slot < 19191 or slot > 19193 { return -1. }
                                                    return 1164.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19200 {
                                            if slot <= 19194 {
                                                if slot < 19194 or slot > 19194 { return -1. }
                                                return 1165.
                                            } else {
                                                if slot < 19195 or slot > 19200 { return -1. }
                                                return 1166.
                                            }
                                        } else {
                                            if slot <= 19203 {
                                                if slot < 19201 or slot > 19203 { return -1. }
                                                return 1167.
                                            } else {
                                                if slot <= 19238 {
                                                    if slot < 19204 or slot > 19238 { return -1. }
                                                    return 1168.
                                                } else {
                                                    if slot < 19239 or slot > 19241 { return -1. }
                                                    return 1169.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19275 {
                                        if slot <= 19255 {
                                            if slot <= 19252 {
                                                if slot < 19242 or slot > 19252 { return -1. }
                                                return 1170.
                                            } else {
                                                if slot < 19253 or slot > 19255 { return -1. }
                                                return 1171.
                                            }
                                        } else {
                                            if slot <= 19266 {
                                                if slot < 19256 or slot > 19266 { return -1. }
                                                return 1172.
                                            } else {
                                                if slot <= 19269 {
                                                    if slot < 19267 or slot > 19269 { return -1. }
                                                    return 1173.
                                                } else {
                                                    if slot < 19270 or slot > 19275 { return -1. }
                                                    return 1174.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19288 {
                                            if slot <= 19279 {
                                                if slot < 19276 or slot > 19279 { return -1. }
                                                return 1175.
                                            } else {
                                                if slot < 19280 or slot > 19288 { return -1. }
                                                return 1176.
                                            }
                                        } else {
                                            if slot <= 19291 {
                                                if slot < 19289 or slot > 19291 { return -1. }
                                                return 1177.
                                            } else {
                                                if slot <= 19293 {
                                                    if slot < 19292 or slot > 19293 { return -1. }
                                                    return 1178.
                                                } else {
                                                    if slot < 19294 or slot > 19302 { return -1. }
                                                    return 1179.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 19559 {
                                    if slot <= 19433 {
                                        if slot <= 19338 {
                                            if slot <= 19326 {
                                                if slot < 19303 or slot > 19326 { return -1. }
                                                return 1180.
                                            } else {
                                                if slot < 19327 or slot > 19338 { return -1. }
                                                return 1181.
                                            }
                                        } else {
                                            if slot <= 19343 {
                                                if slot < 19339 or slot > 19343 { return -1. }
                                                return 1182.
                                            } else {
                                                if slot <= 19411 {
                                                    if slot < 19344 or slot > 19411 { return -1. }
                                                    return 1183.
                                                } else {
                                                    if slot < 19412 or slot > 19433 { return -1. }
                                                    return 1184.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19472 {
                                            if slot <= 19441 {
                                                if slot < 19434 or slot > 19441 { return -1. }
                                                return 1185.
                                            } else {
                                                if slot < 19462 or slot > 19472 { return -1. }
                                                return 1186.
                                            }
                                        } else {
                                            if slot <= 19527 {
                                                if slot < 19473 or slot > 19527 { return -1. }
                                                return 1187.
                                            } else {
                                                if slot <= 19542 {
                                                    if slot < 19528 or slot > 19542 { return -1. }
                                                    return 1188.
                                                } else {
                                                    if slot < 19544 or slot > 19559 { return -1. }
                                                    return 1189.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19858 {
                                        if slot <= 19691 {
                                            if slot <= 19563 {
                                                if slot < 19560 or slot > 19563 { return -1. }
                                                return 1190.
                                            } else {
                                                if slot < 19564 or slot > 19691 { return -1. }
                                                return 1191.
                                            }
                                        } else {
                                            if slot <= 19699 {
                                                if slot < 19692 or slot > 19699 { return -1. }
                                                return 1192.
                                            } else {
                                                if slot <= 19820 {
                                                    if slot < 19700 or slot > 19820 { return -1. }
                                                    return 1193.
                                                } else {
                                                    if slot < 19821 or slot > 19858 { return -1. }
                                                    return 1194.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19876 {
                                            if slot <= 19864 {
                                                if slot < 19859 or slot > 19864 { return -1. }
                                                return 1195.
                                            } else {
                                                if slot <= 19870 {
                                                    if slot < 19865 or slot > 19870 { return -1. }
                                                    return 1196.
                                                } else {
                                                    if slot < 19871 or slot > 19876 { return -1. }
                                                    return 1197.
                                                }
                                            }
                                        } else {
                                            if slot <= 19882 {
                                                if slot < 19877 or slot > 19882 { return -1. }
                                                return 1198.
                                            } else {
                                                if slot <= 19887 {
                                                    if slot < 19883 or slot > 19887 { return -1. }
                                                    return 1199.
                                                } else {
                                                    if slot < 19888 or slot > 19891 { return -1. }
                                                    return 1200.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 19981 {
                                if slot <= 19939 {
                                    if slot <= 19915 {
                                        if slot <= 19901 {
                                            if slot <= 19896 {
                                                if slot < 19892 or slot > 19896 { return -1. }
                                                return 1201.
                                            } else {
                                                if slot < 19897 or slot > 19901 { return -1. }
                                                return 1202.
                                            }
                                        } else {
                                            if slot <= 19908 {
                                                if slot < 19902 or slot > 19908 { return -1. }
                                                return 1203.
                                            } else {
                                                if slot <= 19911 {
                                                    if slot < 19909 or slot > 19911 { return -1. }
                                                    return 1204.
                                                } else {
                                                    if slot < 19912 or slot > 19915 { return -1. }
                                                    return 1205.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19925 {
                                            if slot <= 19921 {
                                                if slot < 19916 or slot > 19921 { return -1. }
                                                return 1206.
                                            } else {
                                                if slot < 19922 or slot > 19925 { return -1. }
                                                return 1207.
                                            }
                                        } else {
                                            if slot <= 19929 {
                                                if slot < 19926 or slot > 19929 { return -1. }
                                                return 1208.
                                            } else {
                                                if slot <= 19934 {
                                                    if slot < 19930 or slot > 19934 { return -1. }
                                                    return 1209.
                                                } else {
                                                    if slot < 19935 or slot > 19939 { return -1. }
                                                    return 1210.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19959 {
                                        if slot <= 19948 {
                                            if slot <= 19944 {
                                                if slot < 19940 or slot > 19944 { return -1. }
                                                return 1211.
                                            } else {
                                                if slot < 19945 or slot > 19948 { return -1. }
                                                return 1212.
                                            }
                                        } else {
                                            if slot <= 19951 {
                                                if slot < 19949 or slot > 19951 { return -1. }
                                                return 1213.
                                            } else {
                                                if slot <= 19954 {
                                                    if slot < 19952 or slot > 19954 { return -1. }
                                                    return 1214.
                                                } else {
                                                    if slot < 19955 or slot > 19959 { return -1. }
                                                    return 1215.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19971 {
                                            if slot <= 19963 {
                                                if slot < 19960 or slot > 19963 { return -1. }
                                                return 1216.
                                            } else {
                                                if slot <= 19966 {
                                                    if slot < 19964 or slot > 19966 { return -1. }
                                                    return 1217.
                                                } else {
                                                    if slot < 19967 or slot > 19971 { return -1. }
                                                    return 1218.
                                                }
                                            }
                                        } else {
                                            if slot <= 19973 {
                                                if slot < 19972 or slot > 19973 { return -1. }
                                                return 1219.
                                            } else {
                                                if slot <= 19979 {
                                                    if slot < 19975 or slot > 19979 { return -1. }
                                                    return 1220.
                                                } else {
                                                    if slot < 19980 or slot > 19981 { return -1. }
                                                    return 1221.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 20048 {
                                    if slot <= 19994 {
                                        if slot <= 19987 {
                                            if slot <= 19985 {
                                                if slot < 19982 or slot > 19985 { return -1. }
                                                return 1222.
                                            } else {
                                                if slot < 19986 or slot > 19987 { return -1. }
                                                return 1223.
                                            }
                                        } else {
                                            if slot <= 19989 {
                                                if slot < 19988 or slot > 19989 { return -1. }
                                                return 1224.
                                            } else {
                                                if slot <= 19992 {
                                                    if slot < 19990 or slot > 19992 { return -1. }
                                                    return 1225.
                                                } else {
                                                    if slot < 19993 or slot > 19994 { return -1. }
                                                    return 1226.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19999 {
                                            if slot <= 19997 {
                                                if slot < 19995 or slot > 19997 { return -1. }
                                                return 1227.
                                            } else {
                                                if slot < 19998 or slot > 19999 { return -1. }
                                                return 1228.
                                            }
                                        } else {
                                            if slot <= 20001 {
                                                if slot < 20000 or slot > 20001 { return -1. }
                                                return 1229.
                                            } else {
                                                if slot <= 20029 {
                                                    if slot < 20002 or slot > 20029 { return -1. }
                                                    return 1230.
                                                } else {
                                                    if slot < 20031 or slot > 20048 { return -1. }
                                                    return 1231.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 20131 {
                                        if slot <= 20058 {
                                            if slot <= 20054 {
                                                if slot < 20049 or slot > 20054 { return -1. }
                                                return 1232.
                                            } else {
                                                if slot < 20055 or slot > 20058 { return -1. }
                                                return 1233.
                                            }
                                        } else {
                                            if slot <= 20061 {
                                                if slot < 20059 or slot > 20061 { return -1. }
                                                return 1234.
                                            } else {
                                                if slot <= 20066 {
                                                    if slot < 20062 or slot > 20066 { return -1. }
                                                    return 1235.
                                                } else {
                                                    if slot < 20067 or slot > 20131 { return -1. }
                                                    return 1236.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 20193 {
                                            if slot <= 20164 {
                                                if slot < 20132 or slot > 20164 { return -1. }
                                                return 1237.
                                            } else {
                                                if slot <= 20183 {
                                                    if slot < 20165 or slot > 20183 { return -1. }
                                                    return 1238.
                                                } else {
                                                    if slot < 20184 or slot > 20193 { return -1. }
                                                    return 1239.
                                                }
                                            }
                                        } else {
                                            if slot <= 20198 {
                                                if slot < 20194 or slot > 20198 { return -1. }
                                                return 1240.
                                            } else {
                                                if slot <= 20209 {
                                                    if slot < 20199 or slot > 20209 { return -1. }
                                                    return 1241.
                                                } else {
                                                    if slot < 20210 or slot > 20220 { return -1. }
                                                    return 1242.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 20962 {
                            if slot <= 20412 {
                                if slot <= 20352 {
                                    if slot <= 20256 {
                                        if slot <= 20241 {
                                            if slot <= 20237 {
                                                if slot < 20221 or slot > 20237 { return -1. }
                                                return 1243.
                                            } else {
                                                if slot < 20238 or slot > 20241 { return -1. }
                                                return 1244.
                                            }
                                        } else {
                                            if slot <= 20246 {
                                                if slot < 20242 or slot > 20246 { return -1. }
                                                return 1245.
                                            } else {
                                                if slot <= 20252 {
                                                    if slot < 20247 or slot > 20252 { return -1. }
                                                    return 1246.
                                                } else {
                                                    if slot < 20253 or slot > 20256 { return -1. }
                                                    return 1247.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 20289 {
                                            if slot <= 20285 {
                                                if slot < 20257 or slot > 20285 { return -1. }
                                                return 1248.
                                            } else {
                                                if slot < 20286 or slot > 20289 { return -1. }
                                                return 1249.
                                            }
                                        } else {
                                            if slot <= 20304 {
                                                if slot < 20290 or slot > 20304 { return -1. }
                                                return 1250.
                                            } else {
                                                if slot <= 20326 {
                                                    if slot < 20305 or slot > 20326 { return -1. }
                                                    return 1251.
                                                } else {
                                                    if slot < 20327 or slot > 20352 { return -1. }
                                                    return 1252.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 20393 {
                                        if slot <= 20363 {
                                            if slot <= 20361 {
                                                if slot < 20353 or slot > 20361 { return -1. }
                                                return 1253.
                                            } else {
                                                if slot < 20362 or slot > 20363 { return -1. }
                                                return 1254.
                                            }
                                        } else {
                                            if slot <= 20381 {
                                                if slot < 20364 or slot > 20381 { return -1. }
                                                return 1255.
                                            } else {
                                                if slot <= 20389 {
                                                    if slot < 20382 or slot > 20389 { return -1. }
                                                    return 1256.
                                                } else {
                                                    if slot < 20391 or slot > 20393 { return -1. }
                                                    return 1257.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 20404 {
                                            if slot <= 20398 {
                                                if slot < 20394 or slot > 20398 { return -1. }
                                                return 1258.
                                            } else {
                                                if slot < 20399 or slot > 20404 { return -1. }
                                                return 1259.
                                            }
                                        } else {
                                            if slot <= 20406 {
                                                if slot < 20405 or slot > 20406 { return -1. }
                                                return 1260.
                                            } else {
                                                if slot <= 20409 {
                                                    if slot < 20407 or slot > 20409 { return -1. }
                                                    return 1261.
                                                } else {
                                                    if slot < 20410 or slot > 20412 { return -1. }
                                                    return 1262.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 20711 {
                                    if slot <= 20701 {
                                        if slot <= 20422 {
                                            if slot <= 20415 {
                                                if slot < 20413 or slot > 20415 { return -1. }
                                                return 1263.
                                            } else {
                                                if slot < 20416 or slot > 20422 { return -1. }
                                                return 1264.
                                            }
                                        } else {
                                            if slot <= 20440 {
                                                if slot < 20423 or slot > 20440 { return -1. }
                                                return 1265.
                                            } else {
                                                if slot <= 20471 {
                                                    if slot < 20441 or slot > 20471 { return -1. }
                                                    return 1266.
                                                } else {
                                                    if slot < 20484 or slot > 20701 { return -1. }
                                                    return 1267.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 20705 {
                                            if slot <= 20703 {
                                                if slot < 20702 or slot > 20703 { return -1. }
                                                return 1268.
                                            } else {
                                                if slot < 20704 or slot > 20705 { return -1. }
                                                return 1269.
                                            }
                                        } else {
                                            if slot <= 20707 {
                                                if slot < 20706 or slot > 20707 { return -1. }
                                                return 1270.
                                            } else {
                                                if slot <= 20709 {
                                                    if slot < 20708 or slot > 20709 { return -1. }
                                                    return 1271.
                                                } else {
                                                    if slot < 20710 or slot > 20711 { return -1. }
                                                    return 1272.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 20738 {
                                        if slot <= 20715 {
                                            if slot <= 20713 {
                                                if slot < 20712 or slot > 20713 { return -1. }
                                                return 1273.
                                            } else {
                                                if slot < 20714 or slot > 20715 { return -1. }
                                                return 1274.
                                            }
                                        } else {
                                            if slot <= 20717 {
                                                if slot < 20716 or slot > 20717 { return -1. }
                                                return 1275.
                                            } else {
                                                if slot <= 20719 {
                                                    if slot < 20718 or slot > 20719 { return -1. }
                                                    return 1276.
                                                } else {
                                                    if slot < 20720 or slot > 20738 { return -1. }
                                                    return 1277.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 20953 {
                                            if slot <= 20948 {
                                                if slot < 20739 or slot > 20948 { return -1. }
                                                return 1278.
                                            } else {
                                                if slot <= 20950 {
                                                    if slot < 20949 or slot > 20950 { return -1. }
                                                    return 1279.
                                                } else {
                                                    if slot < 20951 or slot > 20953 { return -1. }
                                                    return 1280.
                                                }
                                            }
                                        } else {
                                            if slot <= 20955 {
                                                if slot < 20954 or slot > 20955 { return -1. }
                                                return 1281.
                                            } else {
                                                if slot <= 20960 {
                                                    if slot < 20956 or slot > 20960 { return -1. }
                                                    return 1282.
                                                } else {
                                                    if slot < 20961 or slot > 20962 { return -1. }
                                                    return 1283.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 21159 {
                                if slot <= 21050 {
                                    if slot <= 21026 {
                                        if slot <= 20996 {
                                            if slot <= 20963 {
                                                if slot < 20963 or slot > 20963 { return -1. }
                                                return 1284.
                                            } else {
                                                if slot < 20995 or slot > 20996 { return -1. }
                                                return 1285.
                                            }
                                        } else {
                                            if slot <= 21019 {
                                                if slot < 20997 or slot > 21019 { return -1. }
                                                return 1286.
                                            } else {
                                                if slot <= 21023 {
                                                    if slot < 21020 or slot > 21023 { return -1. }
                                                    return 1287.
                                                } else {
                                                    if slot < 21024 or slot > 21026 { return -1. }
                                                    return 1288.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 21036 {
                                            if slot <= 21034 {
                                                if slot < 21027 or slot > 21034 { return -1. }
                                                return 1289.
                                            } else {
                                                if slot < 21035 or slot > 21036 { return -1. }
                                                return 1290.
                                            }
                                        } else {
                                            if slot <= 21038 {
                                                if slot < 21037 or slot > 21038 { return -1. }
                                                return 1291.
                                            } else {
                                                if slot <= 21040 {
                                                    if slot < 21039 or slot > 21040 { return -1. }
                                                    return 1292.
                                                } else {
                                                    if slot < 21041 or slot > 21050 { return -1. }
                                                    return 1293.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 21100 {
                                        if slot <= 21087 {
                                            if slot <= 21074 {
                                                if slot < 21051 or slot > 21074 { return -1. }
                                                return 1294.
                                            } else {
                                                if slot < 21075 or slot > 21087 { return -1. }
                                                return 1295.
                                            }
                                        } else {
                                            if slot <= 21089 {
                                                if slot < 21088 or slot > 21089 { return -1. }
                                                return 1296.
                                            } else {
                                                if slot <= 21097 {
                                                    if slot < 21090 or slot > 21097 { return -1. }
                                                    return 1297.
                                                } else {
                                                    if slot < 21098 or slot > 21100 { return -1. }
                                                    return 1298.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 21122 {
                                            if slot <= 21102 {
                                                if slot < 21101 or slot > 21102 { return -1. }
                                                return 1299.
                                            } else {
                                                if slot <= 21111 {
                                                    if slot < 21103 or slot > 21111 { return -1. }
                                                    return 1300.
                                                } else {
                                                    if slot < 21112 or slot > 21122 { return -1. }
                                                    return 1301.
                                                }
                                            }
                                        } else {
                                            if slot <= 21129 {
                                                if slot < 21123 or slot > 21129 { return -1. }
                                                return 1302.
                                            } else {
                                                if slot <= 21153 {
                                                    if slot < 21130 or slot > 21153 { return -1. }
                                                    return 1303.
                                                } else {
                                                    if slot < 21154 or slot > 21159 { return -1. }
                                                    return 1304.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 21268 {
                                    if slot <= 21194 {
                                        if slot <= 21173 {
                                            if slot <= 21166 {
                                                if slot < 21160 or slot > 21166 { return -1. }
                                                return 1305.
                                            } else {
                                                if slot < 21167 or slot > 21173 { return -1. }
                                                return 1306.
                                            }
                                        } else {
                                            if slot <= 21182 {
                                                if slot < 21174 or slot > 21182 { return -1. }
                                                return 1307.
                                            } else {
                                                if slot <= 21190 {
                                                    if slot < 21183 or slot > 21190 { return -1. }
                                                    return 1308.
                                                } else {
                                                    if slot < 21191 or slot > 21194 { return -1. }
                                                    return 1309.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 21206 {
                                            if slot <= 21200 {
                                                if slot < 21195 or slot > 21200 { return -1. }
                                                return 1310.
                                            } else {
                                                if slot < 21201 or slot > 21206 { return -1. }
                                                return 1311.
                                            }
                                        } else {
                                            if slot <= 21229 {
                                                if slot < 21207 or slot > 21229 { return -1. }
                                                return 1312.
                                            } else {
                                                if slot <= 21260 {
                                                    if slot < 21230 or slot > 21260 { return -1. }
                                                    return 1313.
                                                } else {
                                                    if slot < 21261 or slot > 21268 { return -1. }
                                                    return 1314.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 21305 {
                                        if slot <= 21284 {
                                            if slot <= 21279 {
                                                if slot < 21269 or slot > 21279 { return -1. }
                                                return 1315.
                                            } else {
                                                if slot < 21280 or slot > 21284 { return -1. }
                                                return 1316.
                                            }
                                        } else {
                                            if slot <= 21288 {
                                                if slot < 21285 or slot > 21288 { return -1. }
                                                return 1317.
                                            } else {
                                                if slot <= 21301 {
                                                    if slot < 21289 or slot > 21301 { return -1. }
                                                    return 1318.
                                                } else {
                                                    if slot < 21302 or slot > 21305 { return -1. }
                                                    return 1319.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 21351 {
                                            if slot <= 21311 {
                                                if slot < 21306 or slot > 21311 { return -1. }
                                                return 1320.
                                            } else {
                                                if slot <= 21344 {
                                                    if slot < 21312 or slot > 21344 { return -1. }
                                                    return 1321.
                                                } else {
                                                    if slot < 21345 or slot > 21351 { return -1. }
                                                    return 1322.
                                                }
                                            }
                                        } else {
                                            if slot <= 21352 {
                                                if slot < 21352 or slot > 21352 { return -1. }
                                                return 1323.
                                            } else {
                                                if slot <= 21428 {
                                                    if slot < 21425 or slot > 21428 { return -1. }
                                                    return 1324.
                                                } else {
                                                    if slot < 21429 or slot > 21430 { return -1. }
                                                    return 1325.
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
        if slot <= 31423 {
            if slot <= 25531 {
                if slot <= 23087 {
                    if slot <= 22575 {
                        if slot <= 22299 {
                            if slot <= 21643 {
                                if slot <= 21573 {
                                    if slot <= 21524 {
                                        if slot <= 21446 {
                                            if slot <= 21437 {
                                                if slot < 21431 or slot > 21437 { return -1. }
                                                return 1326.
                                            } else {
                                                if slot < 21438 or slot > 21446 { return -1. }
                                                return 1327.
                                            }
                                        } else {
                                            if slot <= 21448 {
                                                if slot < 21447 or slot > 21448 { return -1. }
                                                return 1328.
                                            } else {
                                                if slot <= 21512 {
                                                    if slot < 21504 or slot > 21512 { return -1. }
                                                    return 1329.
                                                } else {
                                                    if slot < 21513 or slot > 21524 { return -1. }
                                                    return 1330.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 21529 {
                                            if slot <= 21527 {
                                                if slot < 21525 or slot > 21527 { return -1. }
                                                return 1331.
                                            } else {
                                                if slot < 21528 or slot > 21529 { return -1. }
                                                return 1332.
                                            }
                                        } else {
                                            if slot <= 21531 {
                                                if slot < 21530 or slot > 21531 { return -1. }
                                                return 1333.
                                            } else {
                                                if slot <= 21534 {
                                                    if slot < 21532 or slot > 21534 { return -1. }
                                                    return 1334.
                                                } else {
                                                    if slot < 21571 or slot > 21573 { return -1. }
                                                    return 1335.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 21590 {
                                        if slot <= 21580 {
                                            if slot <= 21578 {
                                                if slot < 21574 or slot > 21578 { return -1. }
                                                return 1336.
                                            } else {
                                                if slot < 21579 or slot > 21580 { return -1. }
                                                return 1337.
                                            }
                                        } else {
                                            if slot <= 21581 {
                                                if slot < 21581 or slot > 21581 { return -1. }
                                                return 1338.
                                            } else {
                                                if slot <= 21585 {
                                                    if slot < 21582 or slot > 21585 { return -1. }
                                                    return 1339.
                                                } else {
                                                    if slot < 21586 or slot > 21590 { return -1. }
                                                    return 1340.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 21613 {
                                            if slot <= 21611 {
                                                if slot < 21591 or slot > 21611 { return -1. }
                                                return 1341.
                                            } else {
                                                if slot < 21612 or slot > 21613 { return -1. }
                                                return 1342.
                                            }
                                        } else {
                                            if slot <= 21619 {
                                                if slot < 21614 or slot > 21619 { return -1. }
                                                return 1343.
                                            } else {
                                                if slot <= 21630 {
                                                    if slot < 21620 or slot > 21630 { return -1. }
                                                    return 1344.
                                                } else {
                                                    if slot < 21631 or slot > 21643 { return -1. }
                                                    return 1345.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 21677 {
                                    if slot <= 21654 {
                                        if slot <= 21648 {
                                            if slot <= 21646 {
                                                if slot < 21644 or slot > 21646 { return -1. }
                                                return 1346.
                                            } else {
                                                if slot < 21647 or slot > 21648 { return -1. }
                                                return 1347.
                                            }
                                        } else {
                                            if slot <= 21650 {
                                                if slot < 21649 or slot > 21650 { return -1. }
                                                return 1348.
                                            } else {
                                                if slot <= 21652 {
                                                    if slot < 21651 or slot > 21652 { return -1. }
                                                    return 1349.
                                                } else {
                                                    if slot < 21653 or slot > 21654 { return -1. }
                                                    return 1350.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 21659 {
                                            if slot <= 21657 {
                                                if slot < 21655 or slot > 21657 { return -1. }
                                                return 1351.
                                            } else {
                                                if slot < 21658 or slot > 21659 { return -1. }
                                                return 1352.
                                            }
                                        } else {
                                            if slot <= 21661 {
                                                if slot < 21660 or slot > 21661 { return -1. }
                                                return 1353.
                                            } else {
                                                if slot <= 21672 {
                                                    if slot < 21662 or slot > 21672 { return -1. }
                                                    return 1354.
                                                } else {
                                                    if slot < 21673 or slot > 21677 { return -1. }
                                                    return 1355.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 21831 {
                                        if slot <= 21694 {
                                            if slot <= 21680 {
                                                if slot < 21678 or slot > 21680 { return -1. }
                                                return 1356.
                                            } else {
                                                if slot < 21681 or slot > 21694 { return -1. }
                                                return 1357.
                                            }
                                        } else {
                                            if slot <= 21707 {
                                                if slot < 21695 or slot > 21707 { return -1. }
                                                return 1358.
                                            } else {
                                                if slot <= 21827 {
                                                    if slot < 21809 or slot > 21827 { return -1. }
                                                    return 1359.
                                                } else {
                                                    if slot < 21828 or slot > 21831 { return -1. }
                                                    return 1360.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22074 {
                                            if slot <= 22010 {
                                                if slot < 22003 or slot > 22010 { return -1. }
                                                return 1361.
                                            } else {
                                                if slot <= 22012 {
                                                    if slot < 22011 or slot > 22012 { return -1. }
                                                    return 1362.
                                                } else {
                                                    if slot < 22013 or slot > 22074 { return -1. }
                                                    return 1363.
                                                }
                                            }
                                        } else {
                                            if slot <= 22169 {
                                                if slot < 22075 or slot > 22169 { return -1. }
                                                return 1364.
                                            } else {
                                                if slot <= 22170 {
                                                    if slot < 22170 or slot > 22170 { return -1. }
                                                    return 1365.
                                                } else {
                                                    if slot < 22298 or slot > 22299 { return -1. }
                                                    return 1366.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 22452 {
                                if slot <= 22403 {
                                    if slot <= 22387 {
                                        if slot <= 22302 {
                                            if slot <= 22301 {
                                                if slot < 22300 or slot > 22301 { return -1. }
                                                return 1367.
                                            } else {
                                                if slot < 22302 or slot > 22302 { return -1. }
                                                return 1368.
                                            }
                                        } else {
                                            if slot <= 22371 {
                                                if slot < 22368 or slot > 22371 { return -1. }
                                                return 1369.
                                            } else {
                                                if slot <= 22374 {
                                                    if slot < 22372 or slot > 22374 { return -1. }
                                                    return 1370.
                                                } else {
                                                    if slot < 22375 or slot > 22387 { return -1. }
                                                    return 1371.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22395 {
                                            if slot <= 22391 {
                                                if slot < 22388 or slot > 22391 { return -1. }
                                                return 1372.
                                            } else {
                                                if slot < 22392 or slot > 22395 { return -1. }
                                                return 1373.
                                            }
                                        } else {
                                            if slot <= 22397 {
                                                if slot < 22396 or slot > 22397 { return -1. }
                                                return 1374.
                                            } else {
                                                if slot <= 22400 {
                                                    if slot < 22398 or slot > 22400 { return -1. }
                                                    return 1375.
                                                } else {
                                                    if slot < 22401 or slot > 22403 { return -1. }
                                                    return 1376.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22427 {
                                        if slot <= 22409 {
                                            if slot <= 22405 {
                                                if slot < 22404 or slot > 22405 { return -1. }
                                                return 1377.
                                            } else {
                                                if slot < 22406 or slot > 22409 { return -1. }
                                                return 1378.
                                            }
                                        } else {
                                            if slot <= 22420 {
                                                if slot < 22410 or slot > 22420 { return -1. }
                                                return 1379.
                                            } else {
                                                if slot <= 22425 {
                                                    if slot < 22421 or slot > 22425 { return -1. }
                                                    return 1380.
                                                } else {
                                                    if slot < 22426 or slot > 22427 { return -1. }
                                                    return 1381.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22438 {
                                            if slot <= 22432 {
                                                if slot < 22428 or slot > 22432 { return -1. }
                                                return 1382.
                                            } else {
                                                if slot < 22433 or slot > 22438 { return -1. }
                                                return 1383.
                                            }
                                        } else {
                                            if slot <= 22441 {
                                                if slot < 22439 or slot > 22441 { return -1. }
                                                return 1384.
                                            } else {
                                                if slot <= 22449 {
                                                    if slot < 22442 or slot > 22449 { return -1. }
                                                    return 1385.
                                                } else {
                                                    if slot < 22450 or slot > 22452 { return -1. }
                                                    return 1386.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 22541 {
                                    if slot <= 22494 {
                                        if slot <= 22459 {
                                            if slot <= 22457 {
                                                if slot < 22453 or slot > 22457 { return -1. }
                                                return 1387.
                                            } else {
                                                if slot < 22458 or slot > 22459 { return -1. }
                                                return 1388.
                                            }
                                        } else {
                                            if slot <= 22469 {
                                                if slot < 22460 or slot > 22469 { return -1. }
                                                return 1389.
                                            } else {
                                                if slot <= 22475 {
                                                    if slot < 22470 or slot > 22475 { return -1. }
                                                    return 1390.
                                                } else {
                                                    if slot < 22476 or slot > 22494 { return -1. }
                                                    return 1391.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22513 {
                                            if slot <= 22503 {
                                                if slot < 22495 or slot > 22503 { return -1. }
                                                return 1392.
                                            } else {
                                                if slot < 22504 or slot > 22513 { return -1. }
                                                return 1393.
                                            }
                                        } else {
                                            if slot <= 22531 {
                                                if slot < 22528 or slot > 22531 { return -1. }
                                                return 1394.
                                            } else {
                                                if slot <= 22536 {
                                                    if slot < 22532 or slot > 22536 { return -1. }
                                                    return 1395.
                                                } else {
                                                    if slot < 22537 or slot > 22541 { return -1. }
                                                    return 1396.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22563 {
                                        if slot <= 22557 {
                                            if slot <= 22551 {
                                                if slot < 22542 or slot > 22551 { return -1. }
                                                return 1397.
                                            } else {
                                                if slot < 22552 or slot > 22557 { return -1. }
                                                return 1398.
                                            }
                                        } else {
                                            if slot <= 22559 {
                                                if slot < 22558 or slot > 22559 { return -1. }
                                                return 1399.
                                            } else {
                                                if slot <= 22561 {
                                                    if slot < 22560 or slot > 22561 { return -1. }
                                                    return 1400.
                                                } else {
                                                    if slot < 22562 or slot > 22563 { return -1. }
                                                    return 1401.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22569 {
                                            if slot <= 22565 {
                                                if slot < 22564 or slot > 22565 { return -1. }
                                                return 1402.
                                            } else {
                                                if slot <= 22567 {
                                                    if slot < 22566 or slot > 22567 { return -1. }
                                                    return 1403.
                                                } else {
                                                    if slot < 22568 or slot > 22569 { return -1. }
                                                    return 1404.
                                                }
                                            }
                                        } else {
                                            if slot <= 22571 {
                                                if slot < 22570 or slot > 22571 { return -1. }
                                                return 1405.
                                            } else {
                                                if slot <= 22573 {
                                                    if slot < 22572 or slot > 22573 { return -1. }
                                                    return 1406.
                                                } else {
                                                    if slot < 22574 or slot > 22575 { return -1. }
                                                    return 1407.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 22869 {
                            if slot <= 22706 {
                                if slot <= 22637 {
                                    if slot <= 22596 {
                                        if slot <= 22580 {
                                            if slot <= 22577 {
                                                if slot < 22576 or slot > 22577 { return -1. }
                                                return 1408.
                                            } else {
                                                if slot < 22578 or slot > 22580 { return -1. }
                                                return 1409.
                                            }
                                        } else {
                                            if slot <= 22590 {
                                                if slot < 22581 or slot > 22590 { return -1. }
                                                return 1410.
                                            } else {
                                                if slot <= 22592 {
                                                    if slot < 22591 or slot > 22592 { return -1. }
                                                    return 1411.
                                                } else {
                                                    if slot < 22593 or slot > 22596 { return -1. }
                                                    return 1412.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22606 {
                                            if slot <= 22602 {
                                                if slot < 22597 or slot > 22602 { return -1. }
                                                return 1413.
                                            } else {
                                                if slot < 22603 or slot > 22606 { return -1. }
                                                return 1414.
                                            }
                                        } else {
                                            if slot <= 22609 {
                                                if slot < 22607 or slot > 22609 { return -1. }
                                                return 1415.
                                            } else {
                                                if slot <= 22630 {
                                                    if slot < 22610 or slot > 22630 { return -1. }
                                                    return 1416.
                                                } else {
                                                    if slot < 22631 or slot > 22637 { return -1. }
                                                    return 1417.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22670 {
                                        if slot <= 22657 {
                                            if slot <= 22644 {
                                                if slot < 22638 or slot > 22644 { return -1. }
                                                return 1418.
                                            } else {
                                                if slot < 22645 or slot > 22657 { return -1. }
                                                return 1419.
                                            }
                                        } else {
                                            if slot <= 22659 {
                                                if slot < 22658 or slot > 22659 { return -1. }
                                                return 1420.
                                            } else {
                                                if slot <= 22663 {
                                                    if slot < 22660 or slot > 22663 { return -1. }
                                                    return 1421.
                                                } else {
                                                    if slot < 22664 or slot > 22670 { return -1. }
                                                    return 1422.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22684 {
                                            if slot <= 22672 {
                                                if slot < 22671 or slot > 22672 { return -1. }
                                                return 1423.
                                            } else {
                                                if slot < 22673 or slot > 22684 { return -1. }
                                                return 1424.
                                            }
                                        } else {
                                            if slot <= 22690 {
                                                if slot < 22685 or slot > 22690 { return -1. }
                                                return 1425.
                                            } else {
                                                if slot <= 22701 {
                                                    if slot < 22691 or slot > 22701 { return -1. }
                                                    return 1426.
                                                } else {
                                                    if slot < 22704 or slot > 22706 { return -1. }
                                                    return 1427.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 22811 {
                                    if slot <= 22791 {
                                        if slot <= 22717 {
                                            if slot <= 22710 {
                                                if slot < 22707 or slot > 22710 { return -1. }
                                                return 1428.
                                            } else {
                                                if slot < 22711 or slot > 22717 { return -1. }
                                                return 1429.
                                            }
                                        } else {
                                            if slot <= 22722 {
                                                if slot < 22718 or slot > 22722 { return -1. }
                                                return 1430.
                                            } else {
                                                if slot <= 22787 {
                                                    if slot < 22723 or slot > 22787 { return -1. }
                                                    return 1431.
                                                } else {
                                                    if slot < 22788 or slot > 22791 { return -1. }
                                                    return 1432.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22795 {
                                            if slot <= 22793 {
                                                if slot < 22792 or slot > 22793 { return -1. }
                                                return 1433.
                                            } else {
                                                if slot < 22794 or slot > 22795 { return -1. }
                                                return 1434.
                                            }
                                        } else {
                                            if slot <= 22797 {
                                                if slot < 22796 or slot > 22797 { return -1. }
                                                return 1435.
                                            } else {
                                                if slot <= 22799 {
                                                    if slot < 22798 or slot > 22799 { return -1. }
                                                    return 1436.
                                                } else {
                                                    if slot < 22800 or slot > 22811 { return -1. }
                                                    return 1437.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22826 {
                                        if slot <= 22817 {
                                            if slot <= 22814 {
                                                if slot < 22812 or slot > 22814 { return -1. }
                                                return 1438.
                                            } else {
                                                if slot < 22815 or slot > 22817 { return -1. }
                                                return 1439.
                                            }
                                        } else {
                                            if slot <= 22822 {
                                                if slot < 22818 or slot > 22822 { return -1. }
                                                return 1440.
                                            } else {
                                                if slot <= 22824 {
                                                    if slot < 22823 or slot > 22824 { return -1. }
                                                    return 1441.
                                                } else {
                                                    if slot < 22825 or slot > 22826 { return -1. }
                                                    return 1442.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22855 {
                                            if slot <= 22851 {
                                                if slot < 22827 or slot > 22851 { return -1. }
                                                return 1443.
                                            } else {
                                                if slot <= 22853 {
                                                    if slot < 22852 or slot > 22853 { return -1. }
                                                    return 1444.
                                                } else {
                                                    if slot < 22854 or slot > 22855 { return -1. }
                                                    return 1445.
                                                }
                                            }
                                        } else {
                                            if slot <= 22860 {
                                                if slot < 22856 or slot > 22860 { return -1. }
                                                return 1446.
                                            } else {
                                                if slot <= 22866 {
                                                    if slot < 22861 or slot > 22866 { return -1. }
                                                    return 1447.
                                                } else {
                                                    if slot < 22867 or slot > 22869 { return -1. }
                                                    return 1448.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 22992 {
                                if slot <= 22921 {
                                    if slot <= 22902 {
                                        if slot <= 22882 {
                                            if slot <= 22874 {
                                                if slot < 22870 or slot > 22874 { return -1. }
                                                return 1449.
                                            } else {
                                                if slot < 22875 or slot > 22882 { return -1. }
                                                return 1450.
                                            }
                                        } else {
                                            if slot <= 22884 {
                                                if slot < 22883 or slot > 22884 { return -1. }
                                                return 1451.
                                            } else {
                                                if slot <= 22887 {
                                                    if slot < 22885 or slot > 22887 { return -1. }
                                                    return 1452.
                                                } else {
                                                    if slot < 22888 or slot > 22902 { return -1. }
                                                    return 1453.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22906 {
                                            if slot <= 22904 {
                                                if slot < 22903 or slot > 22904 { return -1. }
                                                return 1454.
                                            } else {
                                                if slot < 22905 or slot > 22906 { return -1. }
                                                return 1455.
                                            }
                                        } else {
                                            if slot <= 22910 {
                                                if slot < 22907 or slot > 22910 { return -1. }
                                                return 1456.
                                            } else {
                                                if slot <= 22914 {
                                                    if slot < 22911 or slot > 22914 { return -1. }
                                                    return 1457.
                                                } else {
                                                    if slot < 22915 or slot > 22921 { return -1. }
                                                    return 1458.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22950 {
                                        if slot <= 22940 {
                                            if slot <= 22929 {
                                                if slot < 22922 or slot > 22929 { return -1. }
                                                return 1459.
                                            } else {
                                                if slot < 22930 or slot > 22940 { return -1. }
                                                return 1460.
                                            }
                                        } else {
                                            if slot <= 22943 {
                                                if slot < 22941 or slot > 22943 { return -1. }
                                                return 1461.
                                            } else {
                                                if slot <= 22946 {
                                                    if slot < 22944 or slot > 22946 { return -1. }
                                                    return 1462.
                                                } else {
                                                    if slot < 22947 or slot > 22950 { return -1. }
                                                    return 1463.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22960 {
                                            if slot <= 22956 {
                                                if slot < 22951 or slot > 22956 { return -1. }
                                                return 1464.
                                            } else {
                                                if slot <= 22958 {
                                                    if slot < 22957 or slot > 22958 { return -1. }
                                                    return 1465.
                                                } else {
                                                    if slot < 22959 or slot > 22960 { return -1. }
                                                    return 1466.
                                                }
                                            }
                                        } else {
                                            if slot <= 22966 {
                                                if slot < 22961 or slot > 22966 { return -1. }
                                                return 1467.
                                            } else {
                                                if slot <= 22990 {
                                                    if slot < 22967 or slot > 22990 { return -1. }
                                                    return 1468.
                                                } else {
                                                    if slot < 22991 or slot > 22992 { return -1. }
                                                    return 1469.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 23035 {
                                    if slot <= 23013 {
                                        if slot <= 22998 {
                                            if slot <= 22995 {
                                                if slot < 22993 or slot > 22995 { return -1. }
                                                return 1470.
                                            } else {
                                                if slot < 22996 or slot > 22998 { return -1. }
                                                return 1471.
                                            }
                                        } else {
                                            if slot <= 23009 {
                                                if slot < 22999 or slot > 23009 { return -1. }
                                                return 1472.
                                            } else {
                                                if slot <= 23011 {
                                                    if slot < 23010 or slot > 23011 { return -1. }
                                                    return 1473.
                                                } else {
                                                    if slot < 23012 or slot > 23013 { return -1. }
                                                    return 1474.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23021 {
                                            if slot <= 23017 {
                                                if slot < 23014 or slot > 23017 { return -1. }
                                                return 1475.
                                            } else {
                                                if slot < 23018 or slot > 23021 { return -1. }
                                                return 1476.
                                            }
                                        } else {
                                            if slot <= 23026 {
                                                if slot < 23022 or slot > 23026 { return -1. }
                                                return 1477.
                                            } else {
                                                if slot <= 23032 {
                                                    if slot < 23027 or slot > 23032 { return -1. }
                                                    return 1478.
                                                } else {
                                                    if slot < 23033 or slot > 23035 { return -1. }
                                                    return 1479.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23059 {
                                        if slot <= 23042 {
                                            if slot <= 23038 {
                                                if slot < 23036 or slot > 23038 { return -1. }
                                                return 1480.
                                            } else {
                                                if slot < 23039 or slot > 23042 { return -1. }
                                                return 1481.
                                            }
                                        } else {
                                            if slot <= 23044 {
                                                if slot < 23043 or slot > 23044 { return -1. }
                                                return 1482.
                                            } else {
                                                if slot <= 23055 {
                                                    if slot < 23045 or slot > 23055 { return -1. }
                                                    return 1483.
                                                } else {
                                                    if slot < 23056 or slot > 23059 { return -1. }
                                                    return 1484.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23081 {
                                            if slot <= 23066 {
                                                if slot < 23060 or slot > 23066 { return -1. }
                                                return 1485.
                                            } else {
                                                if slot <= 23079 {
                                                    if slot < 23067 or slot > 23079 { return -1. }
                                                    return 1486.
                                                } else {
                                                    if slot < 23080 or slot > 23081 { return -1. }
                                                    return 1487.
                                                }
                                            }
                                        } else {
                                            if slot <= 23083 {
                                                if slot < 23082 or slot > 23083 { return -1. }
                                                return 1488.
                                            } else {
                                                if slot <= 23085 {
                                                    if slot < 23084 or slot > 23085 { return -1. }
                                                    return 1489.
                                                } else {
                                                    if slot < 23086 or slot > 23087 { return -1. }
                                                    return 1490.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 23888 {
                        if slot <= 23316 {
                            if slot <= 23173 {
                                if slot <= 23134 {
                                    if slot <= 23111 {
                                        if slot <= 23099 {
                                            if slot <= 23094 {
                                                if slot < 23088 or slot > 23094 { return -1. }
                                                return 1491.
                                            } else {
                                                if slot < 23095 or slot > 23099 { return -1. }
                                                return 1492.
                                            }
                                        } else {
                                            if slot <= 23102 {
                                                if slot < 23100 or slot > 23102 { return -1. }
                                                return 1493.
                                            } else {
                                                if slot <= 23107 {
                                                    if slot < 23103 or slot > 23107 { return -1. }
                                                    return 1494.
                                                } else {
                                                    if slot < 23108 or slot > 23111 { return -1. }
                                                    return 1495.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23122 {
                                            if slot <= 23120 {
                                                if slot < 23112 or slot > 23120 { return -1. }
                                                return 1496.
                                            } else {
                                                if slot < 23121 or slot > 23122 { return -1. }
                                                return 1497.
                                            }
                                        } else {
                                            if slot <= 23125 {
                                                if slot < 23123 or slot > 23125 { return -1. }
                                                return 1498.
                                            } else {
                                                if slot <= 23132 {
                                                    if slot < 23126 or slot > 23132 { return -1. }
                                                    return 1499.
                                                } else {
                                                    if slot < 23133 or slot > 23134 { return -1. }
                                                    return 1500.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23156 {
                                        if slot <= 23144 {
                                            if slot <= 23137 {
                                                if slot < 23135 or slot > 23137 { return -1. }
                                                return 1501.
                                            } else {
                                                if slot < 23138 or slot > 23144 { return -1. }
                                                return 1502.
                                            }
                                        } else {
                                            if slot <= 23150 {
                                                if slot < 23145 or slot > 23150 { return -1. }
                                                return 1503.
                                            } else {
                                                if slot <= 23153 {
                                                    if slot < 23151 or slot > 23153 { return -1. }
                                                    return 1504.
                                                } else {
                                                    if slot < 23154 or slot > 23156 { return -1. }
                                                    return 1505.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23161 {
                                            if slot <= 23157 {
                                                if slot < 23157 or slot > 23157 { return -1. }
                                                return 1506.
                                            } else {
                                                if slot < 23158 or slot > 23161 { return -1. }
                                                return 1507.
                                            }
                                        } else {
                                            if slot <= 23167 {
                                                if slot < 23162 or slot > 23167 { return -1. }
                                                return 1508.
                                            } else {
                                                if slot <= 23170 {
                                                    if slot < 23168 or slot > 23170 { return -1. }
                                                    return 1509.
                                                } else {
                                                    if slot < 23171 or slot > 23173 { return -1. }
                                                    return 1510.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 23204 {
                                    if slot <= 23191 {
                                        if slot <= 23177 {
                                            if slot <= 23175 {
                                                if slot < 23174 or slot > 23175 { return -1. }
                                                return 1511.
                                            } else {
                                                if slot < 23176 or slot > 23177 { return -1. }
                                                return 1512.
                                            }
                                        } else {
                                            if slot <= 23183 {
                                                if slot < 23178 or slot > 23183 { return -1. }
                                                return 1513.
                                            } else {
                                                if slot <= 23186 {
                                                    if slot < 23184 or slot > 23186 { return -1. }
                                                    return 1514.
                                                } else {
                                                    if slot < 23187 or slot > 23191 { return -1. }
                                                    return 1515.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23195 {
                                            if slot <= 23193 {
                                                if slot < 23192 or slot > 23193 { return -1. }
                                                return 1516.
                                            } else {
                                                if slot < 23194 or slot > 23195 { return -1. }
                                                return 1517.
                                            }
                                        } else {
                                            if slot <= 23197 {
                                                if slot < 23196 or slot > 23197 { return -1. }
                                                return 1518.
                                            } else {
                                                if slot <= 23199 {
                                                    if slot < 23198 or slot > 23199 { return -1. }
                                                    return 1519.
                                                } else {
                                                    if slot < 23200 or slot > 23204 { return -1. }
                                                    return 1520.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23267 {
                                        if slot <= 23235 {
                                            if slot <= 23208 {
                                                if slot < 23205 or slot > 23208 { return -1. }
                                                return 1521.
                                            } else {
                                                if slot < 23209 or slot > 23235 { return -1. }
                                                return 1522.
                                            }
                                        } else {
                                            if slot <= 23237 {
                                                if slot < 23236 or slot > 23237 { return -1. }
                                                return 1523.
                                            } else {
                                                if slot <= 23258 {
                                                    if slot < 23238 or slot > 23258 { return -1. }
                                                    return 1524.
                                                } else {
                                                    if slot < 23259 or slot > 23267 { return -1. }
                                                    return 1525.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23281 {
                                            if slot <= 23271 {
                                                if slot < 23268 or slot > 23271 { return -1. }
                                                return 1526.
                                            } else {
                                                if slot <= 23277 {
                                                    if slot < 23272 or slot > 23277 { return -1. }
                                                    return 1527.
                                                } else {
                                                    if slot < 23278 or slot > 23281 { return -1. }
                                                    return 1528.
                                                }
                                            }
                                        } else {
                                            if slot <= 23295 {
                                                if slot < 23282 or slot > 23295 { return -1. }
                                                return 1529.
                                            } else {
                                                if slot <= 23299 {
                                                    if slot < 23296 or slot > 23299 { return -1. }
                                                    return 1530.
                                                } else {
                                                    if slot < 23300 or slot > 23316 { return -1. }
                                                    return 1531.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 23629 {
                                if slot <= 23464 {
                                    if slot <= 23360 {
                                        if slot <= 23332 {
                                            if slot <= 23318 {
                                                if slot < 23317 or slot > 23318 { return -1. }
                                                return 1532.
                                            } else {
                                                if slot < 23319 or slot > 23332 { return -1. }
                                                return 1533.
                                            }
                                        } else {
                                            if slot <= 23334 {
                                                if slot < 23333 or slot > 23334 { return -1. }
                                                return 1534.
                                            } else {
                                                if slot <= 23355 {
                                                    if slot < 23335 or slot > 23355 { return -1. }
                                                    return 1535.
                                                } else {
                                                    if slot < 23356 or slot > 23360 { return -1. }
                                                    return 1536.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23369 {
                                            if slot <= 23364 {
                                                if slot < 23361 or slot > 23364 { return -1. }
                                                return 1537.
                                            } else {
                                                if slot < 23365 or slot > 23369 { return -1. }
                                                return 1538.
                                            }
                                        } else {
                                            if slot <= 23375 {
                                                if slot < 23370 or slot > 23375 { return -1. }
                                                return 1539.
                                            } else {
                                                if slot <= 23461 {
                                                    if slot < 23376 or slot > 23461 { return -1. }
                                                    return 1540.
                                                } else {
                                                    if slot < 23462 or slot > 23464 { return -1. }
                                                    return 1541.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23582 {
                                        if slot <= 23560 {
                                            if slot <= 23467 {
                                                if slot < 23465 or slot > 23467 { return -1. }
                                                return 1542.
                                            } else {
                                                if slot < 23555 or slot > 23560 { return -1. }
                                                return 1543.
                                            }
                                        } else {
                                            if slot <= 23564 {
                                                if slot < 23561 or slot > 23564 { return -1. }
                                                return 1544.
                                            } else {
                                                if slot <= 23573 {
                                                    if slot < 23565 or slot > 23573 { return -1. }
                                                    return 1545.
                                                } else {
                                                    if slot < 23574 or slot > 23582 { return -1. }
                                                    return 1546.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23604 {
                                            if slot <= 23594 {
                                                if slot < 23583 or slot > 23594 { return -1. }
                                                return 1547.
                                            } else {
                                                if slot <= 23595 {
                                                    if slot < 23595 or slot > 23595 { return -1. }
                                                    return 1548.
                                                } else {
                                                    if slot < 23602 or slot > 23604 { return -1. }
                                                    return 1549.
                                                }
                                            }
                                        } else {
                                            if slot <= 23615 {
                                                if slot < 23605 or slot > 23615 { return -1. }
                                                return 1550.
                                            } else {
                                                if slot <= 23623 {
                                                    if slot < 23616 or slot > 23623 { return -1. }
                                                    return 1551.
                                                } else {
                                                    if slot < 23624 or slot > 23629 { return -1. }
                                                    return 1552.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 23761 {
                                    if slot <= 23738 {
                                        if slot <= 23706 {
                                            if slot <= 23641 {
                                                if slot < 23630 or slot > 23641 { return -1. }
                                                return 1553.
                                            } else {
                                                if slot < 23642 or slot > 23706 { return -1. }
                                                return 1554.
                                            }
                                        } else {
                                            if slot <= 23723 {
                                                if slot < 23707 or slot > 23723 { return -1. }
                                                return 1555.
                                            } else {
                                                if slot <= 23731 {
                                                    if slot < 23724 or slot > 23731 { return -1. }
                                                    return 1556.
                                                } else {
                                                    if slot < 23732 or slot > 23738 { return -1. }
                                                    return 1557.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23749 {
                                            if slot <= 23740 {
                                                if slot < 23739 or slot > 23740 { return -1. }
                                                return 1558.
                                            } else {
                                                if slot < 23741 or slot > 23749 { return -1. }
                                                return 1559.
                                            }
                                        } else {
                                            if slot <= 23754 {
                                                if slot < 23750 or slot > 23754 { return -1. }
                                                return 1560.
                                            } else {
                                                if slot <= 23757 {
                                                    if slot < 23755 or slot > 23757 { return -1. }
                                                    return 1561.
                                                } else {
                                                    if slot < 23758 or slot > 23761 { return -1. }
                                                    return 1562.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23816 {
                                        if slot <= 23791 {
                                            if slot <= 23766 {
                                                if slot < 23762 or slot > 23766 { return -1. }
                                                return 1563.
                                            } else {
                                                if slot < 23767 or slot > 23791 { return -1. }
                                                return 1564.
                                            }
                                        } else {
                                            if slot <= 23797 {
                                                if slot < 23792 or slot > 23797 { return -1. }
                                                return 1565.
                                            } else {
                                                if slot <= 23813 {
                                                    if slot < 23798 or slot > 23813 { return -1. }
                                                    return 1566.
                                                } else {
                                                    if slot < 23814 or slot > 23816 { return -1. }
                                                    return 1567.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23868 {
                                            if slot <= 23845 {
                                                if slot < 23817 or slot > 23845 { return -1. }
                                                return 1568.
                                            } else {
                                                if slot <= 23859 {
                                                    if slot < 23846 or slot > 23859 { return -1. }
                                                    return 1569.
                                                } else {
                                                    if slot < 23860 or slot > 23868 { return -1. }
                                                    return 1570.
                                                }
                                            }
                                        } else {
                                            if slot <= 23872 {
                                                if slot < 23869 or slot > 23872 { return -1. }
                                                return 1571.
                                            } else {
                                                if slot <= 23877 {
                                                    if slot < 23873 or slot > 23877 { return -1. }
                                                    return 1572.
                                                } else {
                                                    if slot < 23878 or slot > 23888 { return -1. }
                                                    return 1573.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 24431 {
                            if slot <= 24126 {
                                if slot <= 23965 {
                                    if slot <= 23918 {
                                        if slot <= 23900 {
                                            if slot <= 23893 {
                                                if slot < 23889 or slot > 23893 { return -1. }
                                                return 1574.
                                            } else {
                                                if slot < 23894 or slot > 23900 { return -1. }
                                                return 1575.
                                            }
                                        } else {
                                            if slot <= 23905 {
                                                if slot < 23902 or slot > 23905 { return -1. }
                                                return 1576.
                                            } else {
                                                if slot <= 23909 {
                                                    if slot < 23906 or slot > 23909 { return -1. }
                                                    return 1577.
                                                } else {
                                                    if slot < 23910 or slot > 23918 { return -1. }
                                                    return 1578.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23930 {
                                            if slot <= 23925 {
                                                if slot < 23919 or slot > 23925 { return -1. }
                                                return 1579.
                                            } else {
                                                if slot < 23926 or slot > 23930 { return -1. }
                                                return 1580.
                                            }
                                        } else {
                                            if slot <= 23937 {
                                                if slot < 23931 or slot > 23937 { return -1. }
                                                return 1581.
                                            } else {
                                                if slot <= 23963 {
                                                    if slot < 23938 or slot > 23963 { return -1. }
                                                    return 1582.
                                                } else {
                                                    if slot < 23964 or slot > 23965 { return -1. }
                                                    return 1583.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 24110 {
                                        if slot <= 24042 {
                                            if slot <= 24012 {
                                                if slot < 23966 or slot > 24012 { return -1. }
                                                return 1584.
                                            } else {
                                                if slot < 24013 or slot > 24042 { return -1. }
                                                return 1585.
                                            }
                                        } else {
                                            if slot <= 24074 {
                                                if slot < 24043 or slot > 24074 { return -1. }
                                                return 1586.
                                            } else {
                                                if slot <= 24096 {
                                                    if slot < 24075 or slot > 24096 { return -1. }
                                                    return 1587.
                                                } else {
                                                    if slot < 24097 or slot > 24110 { return -1. }
                                                    return 1588.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 24115 {
                                            if slot <= 24111 {
                                                if slot < 24111 or slot > 24111 { return -1. }
                                                return 1589.
                                            } else {
                                                if slot < 24112 or slot > 24115 { return -1. }
                                                return 1590.
                                            }
                                        } else {
                                            if slot <= 24122 {
                                                if slot < 24116 or slot > 24122 { return -1. }
                                                return 1591.
                                            } else {
                                                if slot <= 24124 {
                                                    if slot < 24123 or slot > 24124 { return -1. }
                                                    return 1592.
                                                } else {
                                                    if slot < 24125 or slot > 24126 { return -1. }
                                                    return 1593.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 24197 {
                                    if slot <= 24138 {
                                        if slot <= 24130 {
                                            if slot <= 24128 {
                                                if slot < 24127 or slot > 24128 { return -1. }
                                                return 1594.
                                            } else {
                                                if slot < 24129 or slot > 24130 { return -1. }
                                                return 1595.
                                            }
                                        } else {
                                            if slot <= 24132 {
                                                if slot < 24131 or slot > 24132 { return -1. }
                                                return 1596.
                                            } else {
                                                if slot <= 24134 {
                                                    if slot < 24133 or slot > 24134 { return -1. }
                                                    return 1597.
                                                } else {
                                                    if slot < 24135 or slot > 24138 { return -1. }
                                                    return 1598.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 24167 {
                                            if slot <= 24157 {
                                                if slot < 24139 or slot > 24157 { return -1. }
                                                return 1599.
                                            } else {
                                                if slot < 24158 or slot > 24167 { return -1. }
                                                return 1600.
                                            }
                                        } else {
                                            if slot <= 24181 {
                                                if slot < 24168 or slot > 24181 { return -1. }
                                                return 1601.
                                            } else {
                                                if slot <= 24186 {
                                                    if slot < 24182 or slot > 24186 { return -1. }
                                                    return 1602.
                                                } else {
                                                    if slot < 24187 or slot > 24197 { return -1. }
                                                    return 1603.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 24353 {
                                        if slot <= 24258 {
                                            if slot <= 24215 {
                                                if slot < 24198 or slot > 24215 { return -1. }
                                                return 1604.
                                            } else {
                                                if slot < 24216 or slot > 24258 { return -1. }
                                                return 1605.
                                            }
                                        } else {
                                            if slot <= 24306 {
                                                if slot < 24259 or slot > 24306 { return -1. }
                                                return 1606.
                                            } else {
                                                if slot <= 24321 {
                                                    if slot < 24307 or slot > 24321 { return -1. }
                                                    return 1607.
                                                } else {
                                                    if slot < 24322 or slot > 24353 { return -1. }
                                                    return 1608.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 24396 {
                                            if slot <= 24389 {
                                                if slot < 24354 or slot > 24389 { return -1. }
                                                return 1609.
                                            } else {
                                                if slot <= 24392 {
                                                    if slot < 24390 or slot > 24392 { return -1. }
                                                    return 1610.
                                                } else {
                                                    if slot < 24393 or slot > 24396 { return -1. }
                                                    return 1611.
                                                }
                                            }
                                        } else {
                                            if slot <= 24411 {
                                                if slot < 24397 or slot > 24411 { return -1. }
                                                return 1612.
                                            } else {
                                                if slot <= 24421 {
                                                    if slot < 24412 or slot > 24421 { return -1. }
                                                    return 1613.
                                                } else {
                                                    if slot < 24422 or slot > 24431 { return -1. }
                                                    return 1614.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 24699 {
                                if slot <= 24639 {
                                    if slot <= 24504 {
                                        if slot <= 24454 {
                                            if slot <= 24448 {
                                                if slot < 24432 or slot > 24448 { return -1. }
                                                return 1615.
                                            } else {
                                                if slot < 24449 or slot > 24454 { return -1. }
                                                return 1616.
                                            }
                                        } else {
                                            if slot <= 24485 {
                                                if slot < 24455 or slot > 24485 { return -1. }
                                                return 1617.
                                            } else {
                                                if slot <= 24495 {
                                                    if slot < 24486 or slot > 24495 { return -1. }
                                                    return 1618.
                                                } else {
                                                    if slot < 24496 or slot > 24504 { return -1. }
                                                    return 1619.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 24602 {
                                            if slot <= 24595 {
                                                if slot < 24594 or slot > 24595 { return -1. }
                                                return 1620.
                                            } else {
                                                if slot < 24596 or slot > 24602 { return -1. }
                                                return 1621.
                                            }
                                        } else {
                                            if slot <= 24626 {
                                                if slot < 24603 or slot > 24626 { return -1. }
                                                return 1622.
                                            } else {
                                                if slot <= 24637 {
                                                    if slot < 24627 or slot > 24637 { return -1. }
                                                    return 1623.
                                                } else {
                                                    if slot < 24638 or slot > 24639 { return -1. }
                                                    return 1624.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 24669 {
                                        if slot <= 24647 {
                                            if slot <= 24642 {
                                                if slot < 24640 or slot > 24642 { return -1. }
                                                return 1625.
                                            } else {
                                                if slot < 24643 or slot > 24647 { return -1. }
                                                return 1626.
                                            }
                                        } else {
                                            if slot <= 24649 {
                                                if slot < 24648 or slot > 24649 { return -1. }
                                                return 1627.
                                            } else {
                                                if slot <= 24651 {
                                                    if slot < 24650 or slot > 24651 { return -1. }
                                                    return 1628.
                                                } else {
                                                    if slot < 24659 or slot > 24669 { return -1. }
                                                    return 1629.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 24688 {
                                            if slot <= 24671 {
                                                if slot < 24670 or slot > 24671 { return -1. }
                                                return 1630.
                                            } else {
                                                if slot <= 24674 {
                                                    if slot < 24672 or slot > 24674 { return -1. }
                                                    return 1631.
                                                } else {
                                                    if slot < 24675 or slot > 24688 { return -1. }
                                                    return 1632.
                                                }
                                            }
                                        } else {
                                            if slot <= 24690 {
                                                if slot < 24689 or slot > 24690 { return -1. }
                                                return 1633.
                                            } else {
                                                if slot <= 24696 {
                                                    if slot < 24691 or slot > 24696 { return -1. }
                                                    return 1634.
                                                } else {
                                                    if slot < 24697 or slot > 24699 { return -1. }
                                                    return 1635.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 25070 {
                                    if slot <= 24736 {
                                        if slot <= 24715 {
                                            if slot <= 24702 {
                                                if slot < 24700 or slot > 24702 { return -1. }
                                                return 1636.
                                            } else {
                                                if slot < 24703 or slot > 24715 { return -1. }
                                                return 1637.
                                            }
                                        } else {
                                            if slot <= 24730 {
                                                if slot < 24716 or slot > 24730 { return -1. }
                                                return 1638.
                                            } else {
                                                if slot <= 24733 {
                                                    if slot < 24731 or slot > 24733 { return -1. }
                                                    return 1639.
                                                } else {
                                                    if slot < 24734 or slot > 24736 { return -1. }
                                                    return 1640.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 24805 {
                                            if slot <= 24748 {
                                                if slot < 24737 or slot > 24748 { return -1. }
                                                return 1641.
                                            } else {
                                                if slot < 24749 or slot > 24805 { return -1. }
                                                return 1642.
                                            }
                                        } else {
                                            if slot <= 24807 {
                                                if slot < 24806 or slot > 24807 { return -1. }
                                                return 1643.
                                            } else {
                                                if slot <= 24910 {
                                                    if slot < 24907 or slot > 24910 { return -1. }
                                                    return 1644.
                                                } else {
                                                    if slot < 24911 or slot > 25070 { return -1. }
                                                    return 1645.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 25466 {
                                        if slot <= 25264 {
                                            if slot <= 25257 {
                                                if slot < 25071 or slot > 25257 { return -1. }
                                                return 1646.
                                            } else {
                                                if slot < 25258 or slot > 25264 { return -1. }
                                                return 1647.
                                            }
                                        } else {
                                            if slot <= 25377 {
                                                if slot < 25265 or slot > 25377 { return -1. }
                                                return 1648.
                                            } else {
                                                if slot <= 25391 {
                                                    if slot < 25378 or slot > 25391 { return -1. }
                                                    return 1649.
                                                } else {
                                                    if slot < 25392 or slot > 25466 { return -1. }
                                                    return 1650.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 25489 {
                                            if slot <= 25469 {
                                                if slot < 25467 or slot > 25469 { return -1. }
                                                return 1651.
                                            } else {
                                                if slot <= 25477 {
                                                    if slot < 25470 or slot > 25477 { return -1. }
                                                    return 1652.
                                                } else {
                                                    if slot < 25478 or slot > 25489 { return -1. }
                                                    return 1653.
                                                }
                                            }
                                        } else {
                                            if slot <= 25506 {
                                                if slot < 25490 or slot > 25506 { return -1. }
                                                return 1654.
                                            } else {
                                                if slot <= 25514 {
                                                    if slot < 25507 or slot > 25514 { return -1. }
                                                    return 1655.
                                                } else {
                                                    if slot < 25515 or slot > 25531 { return -1. }
                                                    return 1656.
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
                if slot <= 28541 {
                    if slot <= 27562 {
                        if slot <= 26785 {
                            if slot <= 26264 {
                                if slot <= 25999 {
                                    if slot <= 25756 {
                                        if slot <= 25537 {
                                            if slot <= 25534 {
                                                if slot < 25532 or slot > 25534 { return -1. }
                                                return 1657.
                                            } else {
                                                if slot < 25535 or slot > 25537 { return -1. }
                                                return 1658.
                                            }
                                        } else {
                                            if slot <= 25538 {
                                                if slot < 25538 or slot > 25538 { return -1. }
                                                return 1659.
                                            } else {
                                                if slot <= 25741 {
                                                    if slot < 25728 or slot > 25741 { return -1. }
                                                    return 1660.
                                                } else {
                                                    if slot < 25742 or slot > 25756 { return -1. }
                                                    return 1661.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 25765 {
                                            if slot <= 25764 {
                                                if slot < 25757 or slot > 25764 { return -1. }
                                                return 1662.
                                            } else {
                                                if slot < 25765 or slot > 25765 { return -1. }
                                                return 1663.
                                            }
                                        } else {
                                            if slot <= 25944 {
                                                if slot < 25943 or slot > 25944 { return -1. }
                                                return 1664.
                                            } else {
                                                if slot <= 25951 {
                                                    if slot < 25945 or slot > 25951 { return -1. }
                                                    return 1665.
                                                } else {
                                                    if slot < 25952 or slot > 25999 { return -1. }
                                                    return 1666.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 26054 {
                                        if slot <= 26025 {
                                            if slot <= 26023 {
                                                if slot < 26000 or slot > 26023 { return -1. }
                                                return 1667.
                                            } else {
                                                if slot < 26024 or slot > 26025 { return -1. }
                                                return 1668.
                                            }
                                        } else {
                                            if slot <= 26031 {
                                                if slot < 26026 or slot > 26031 { return -1. }
                                                return 1669.
                                            } else {
                                                if slot <= 26039 {
                                                    if slot < 26032 or slot > 26039 { return -1. }
                                                    return 1670.
                                                } else {
                                                    if slot < 26040 or slot > 26054 { return -1. }
                                                    return 1671.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 26071 {
                                            if slot <= 26069 {
                                                if slot < 26055 or slot > 26069 { return -1. }
                                                return 1672.
                                            } else {
                                                if slot < 26070 or slot > 26071 { return -1. }
                                                return 1673.
                                            }
                                        } else {
                                            if slot <= 26254 {
                                                if slot < 26072 or slot > 26254 { return -1. }
                                                return 1674.
                                            } else {
                                                if slot <= 26256 {
                                                    if slot < 26255 or slot > 26256 { return -1. }
                                                    return 1675.
                                                } else {
                                                    if slot < 26257 or slot > 26264 { return -1. }
                                                    return 1676.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 26676 {
                                    if slot <= 26349 {
                                        if slot <= 26286 {
                                            if slot <= 26273 {
                                                if slot < 26265 or slot > 26273 { return -1. }
                                                return 1677.
                                            } else {
                                                if slot < 26274 or slot > 26286 { return -1. }
                                                return 1678.
                                            }
                                        } else {
                                            if slot <= 26293 {
                                                if slot < 26287 or slot > 26293 { return -1. }
                                                return 1679.
                                            } else {
                                                if slot <= 26294 {
                                                    if slot < 26294 or slot > 26294 { return -1. }
                                                    return 1680.
                                                } else {
                                                    if slot < 26321 or slot > 26349 { return -1. }
                                                    return 1681.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 26603 {
                                            if slot <= 26602 {
                                                if slot < 26589 or slot > 26602 { return -1. }
                                                return 1682.
                                            } else {
                                                if slot < 26603 or slot > 26603 { return -1. }
                                                return 1683.
                                            }
                                        } else {
                                            if slot <= 26669 {
                                                if slot < 26669 or slot > 26669 { return -1. }
                                                return 1684.
                                            } else {
                                                if slot <= 26674 {
                                                    if slot < 26673 or slot > 26674 { return -1. }
                                                    return 1685.
                                                } else {
                                                    if slot < 26675 or slot > 26676 { return -1. }
                                                    return 1686.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 26694 {
                                        if slot <= 26680 {
                                            if slot <= 26678 {
                                                if slot < 26677 or slot > 26678 { return -1. }
                                                return 1687.
                                            } else {
                                                if slot < 26679 or slot > 26680 { return -1. }
                                                return 1688.
                                            }
                                        } else {
                                            if slot <= 26682 {
                                                if slot < 26681 or slot > 26682 { return -1. }
                                                return 1689.
                                            } else {
                                                if slot <= 26685 {
                                                    if slot < 26683 or slot > 26685 { return -1. }
                                                    return 1690.
                                                } else {
                                                    if slot < 26686 or slot > 26694 { return -1. }
                                                    return 1691.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 26735 {
                                            if slot <= 26699 {
                                                if slot < 26695 or slot > 26699 { return -1. }
                                                return 1692.
                                            } else {
                                                if slot <= 26733 {
                                                    if slot < 26700 or slot > 26733 { return -1. }
                                                    return 1693.
                                                } else {
                                                    if slot < 26734 or slot > 26735 { return -1. }
                                                    return 1694.
                                                }
                                            }
                                        } else {
                                            if slot <= 26738 {
                                                if slot < 26736 or slot > 26738 { return -1. }
                                                return 1695.
                                            } else {
                                                if slot <= 26745 {
                                                    if slot < 26739 or slot > 26745 { return -1. }
                                                    return 1696.
                                                } else {
                                                    if slot < 26746 or slot > 26785 { return -1. }
                                                    return 1697.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 27338 {
                                if slot <= 27134 {
                                    if slot <= 27097 {
                                        if slot <= 26789 {
                                            if slot <= 26787 {
                                                if slot < 26786 or slot > 26787 { return -1. }
                                                return 1698.
                                            } else {
                                                if slot < 26788 or slot > 26789 { return -1. }
                                                return 1699.
                                            }
                                        } else {
                                            if slot <= 26792 {
                                                if slot < 26790 or slot > 26792 { return -1. }
                                                return 1700.
                                            } else {
                                                if slot <= 26794 {
                                                    if slot < 26793 or slot > 26794 { return -1. }
                                                    return 1701.
                                                } else {
                                                    if slot < 27090 or slot > 27097 { return -1. }
                                                    return 1702.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 27110 {
                                            if slot <= 27108 {
                                                if slot < 27098 or slot > 27108 { return -1. }
                                                return 1703.
                                            } else {
                                                if slot < 27109 or slot > 27110 { return -1. }
                                                return 1704.
                                            }
                                        } else {
                                            if slot <= 27112 {
                                                if slot < 27111 or slot > 27112 { return -1. }
                                                return 1705.
                                            } else {
                                                if slot <= 27115 {
                                                    if slot < 27113 or slot > 27115 { return -1. }
                                                    return 1706.
                                                } else {
                                                    if slot < 27116 or slot > 27134 { return -1. }
                                                    return 1707.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 27149 {
                                        if slot <= 27139 {
                                            if slot <= 27136 {
                                                if slot < 27135 or slot > 27136 { return -1. }
                                                return 1708.
                                            } else {
                                                if slot < 27137 or slot > 27139 { return -1. }
                                                return 1709.
                                            }
                                        } else {
                                            if slot <= 27144 {
                                                if slot < 27140 or slot > 27144 { return -1. }
                                                return 1710.
                                            } else {
                                                if slot <= 27147 {
                                                    if slot < 27145 or slot > 27147 { return -1. }
                                                    return 1711.
                                                } else {
                                                    if slot < 27148 or slot > 27149 { return -1. }
                                                    return 1712.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 27200 {
                                            if slot <= 27169 {
                                                if slot < 27150 or slot > 27169 { return -1. }
                                                return 1713.
                                            } else {
                                                if slot <= 27187 {
                                                    if slot < 27170 or slot > 27187 { return -1. }
                                                    return 1714.
                                                } else {
                                                    if slot < 27188 or slot > 27200 { return -1. }
                                                    return 1715.
                                                }
                                            }
                                        } else {
                                            if slot <= 27267 {
                                                if slot < 27216 or slot > 27267 { return -1. }
                                                return 1716.
                                            } else {
                                                if slot <= 27314 {
                                                    if slot < 27268 or slot > 27314 { return -1. }
                                                    return 1717.
                                                } else {
                                                    if slot < 27315 or slot > 27338 { return -1. }
                                                    return 1718.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 27434 {
                                    if slot <= 27366 {
                                        if slot <= 27343 {
                                            if slot <= 27340 {
                                                if slot < 27339 or slot > 27340 { return -1. }
                                                return 1719.
                                            } else {
                                                if slot < 27341 or slot > 27343 { return -1. }
                                                return 1720.
                                            }
                                        } else {
                                            if slot <= 27346 {
                                                if slot < 27344 or slot > 27346 { return -1. }
                                                return 1721.
                                            } else {
                                                if slot <= 27358 {
                                                    if slot < 27347 or slot > 27358 { return -1. }
                                                    return 1722.
                                                } else {
                                                    if slot < 27359 or slot > 27366 { return -1. }
                                                    return 1723.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 27403 {
                                            if slot <= 27379 {
                                                if slot < 27367 or slot > 27379 { return -1. }
                                                return 1724.
                                            } else {
                                                if slot < 27380 or slot > 27403 { return -1. }
                                                return 1725.
                                            }
                                        } else {
                                            if slot <= 27427 {
                                                if slot < 27404 or slot > 27427 { return -1. }
                                                return 1726.
                                            } else {
                                                if slot <= 27432 {
                                                    if slot < 27428 or slot > 27432 { return -1. }
                                                    return 1727.
                                                } else {
                                                    if slot < 27433 or slot > 27434 { return -1. }
                                                    return 1728.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 27466 {
                                        if slot <= 27445 {
                                            if slot <= 27440 {
                                                if slot < 27435 or slot > 27440 { return -1. }
                                                return 1729.
                                            } else {
                                                if slot < 27441 or slot > 27445 { return -1. }
                                                return 1730.
                                            }
                                        } else {
                                            if slot <= 27450 {
                                                if slot < 27446 or slot > 27450 { return -1. }
                                                return 1731.
                                            } else {
                                                if slot <= 27458 {
                                                    if slot < 27451 or slot > 27458 { return -1. }
                                                    return 1732.
                                                } else {
                                                    if slot < 27459 or slot > 27466 { return -1. }
                                                    return 1733.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 27519 {
                                            if slot <= 27490 {
                                                if slot < 27467 or slot > 27490 { return -1. }
                                                return 1734.
                                            } else {
                                                if slot <= 27499 {
                                                    if slot < 27491 or slot > 27499 { return -1. }
                                                    return 1735.
                                                } else {
                                                    if slot < 27500 or slot > 27519 { return -1. }
                                                    return 1736.
                                                }
                                            }
                                        } else {
                                            if slot <= 27523 {
                                                if slot < 27520 or slot > 27523 { return -1. }
                                                return 1737.
                                            } else {
                                                if slot <= 27532 {
                                                    if slot < 27524 or slot > 27532 { return -1. }
                                                    return 1738.
                                                } else {
                                                    if slot < 27533 or slot > 27562 { return -1. }
                                                    return 1739.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 28099 {
                            if slot <= 27787 {
                                if slot <= 27680 {
                                    if slot <= 27631 {
                                        if slot <= 27606 {
                                            if slot <= 27582 {
                                                if slot < 27563 or slot > 27582 { return -1. }
                                                return 1740.
                                            } else {
                                                if slot < 27583 or slot > 27606 { return -1. }
                                                return 1741.
                                            }
                                        } else {
                                            if slot <= 27625 {
                                                if slot < 27607 or slot > 27625 { return -1. }
                                                return 1742.
                                            } else {
                                                if slot <= 27628 {
                                                    if slot < 27626 or slot > 27628 { return -1. }
                                                    return 1743.
                                                } else {
                                                    if slot < 27629 or slot > 27631 { return -1. }
                                                    return 1744.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 27658 {
                                            if slot <= 27632 {
                                                if slot < 27632 or slot > 27632 { return -1. }
                                                return 1745.
                                            } else {
                                                if slot < 27655 or slot > 27658 { return -1. }
                                                return 1746.
                                            }
                                        } else {
                                            if slot <= 27670 {
                                                if slot < 27659 or slot > 27670 { return -1. }
                                                return 1747.
                                            } else {
                                                if slot <= 27678 {
                                                    if slot < 27671 or slot > 27678 { return -1. }
                                                    return 1748.
                                                } else {
                                                    if slot < 27679 or slot > 27680 { return -1. }
                                                    return 1749.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 27749 {
                                        if slot <= 27692 {
                                            if slot <= 27688 {
                                                if slot < 27681 or slot > 27688 { return -1. }
                                                return 1750.
                                            } else {
                                                if slot < 27689 or slot > 27692 { return -1. }
                                                return 1751.
                                            }
                                        } else {
                                            if slot <= 27726 {
                                                if slot < 27693 or slot > 27726 { return -1. }
                                                return 1752.
                                            } else {
                                                if slot <= 27727 {
                                                    if slot < 27727 or slot > 27727 { return -1. }
                                                    return 1753.
                                                } else {
                                                    if slot < 27748 or slot > 27749 { return -1. }
                                                    return 1754.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 27754 {
                                            if slot <= 27752 {
                                                if slot < 27750 or slot > 27752 { return -1. }
                                                return 1755.
                                            } else {
                                                if slot < 27753 or slot > 27754 { return -1. }
                                                return 1756.
                                            }
                                        } else {
                                            if slot <= 27775 {
                                                if slot < 27755 or slot > 27775 { return -1. }
                                                return 1757.
                                            } else {
                                                if slot <= 27778 {
                                                    if slot < 27776 or slot > 27778 { return -1. }
                                                    return 1758.
                                                } else {
                                                    if slot < 27779 or slot > 27787 { return -1. }
                                                    return 1759.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 27993 {
                                    if slot <= 27948 {
                                        if slot <= 27908 {
                                            if slot <= 27788 {
                                                if slot < 27788 or slot > 27788 { return -1. }
                                                return 1760.
                                            } else {
                                                if slot < 27790 or slot > 27908 { return -1. }
                                                return 1761.
                                            }
                                        } else {
                                            if slot <= 27910 {
                                                if slot < 27909 or slot > 27910 { return -1. }
                                                return 1762.
                                            } else {
                                                if slot <= 27918 {
                                                    if slot < 27911 or slot > 27918 { return -1. }
                                                    return 1763.
                                                } else {
                                                    if slot < 27920 or slot > 27948 { return -1. }
                                                    return 1764.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 27958 {
                                            if slot <= 27955 {
                                                if slot < 27949 or slot > 27955 { return -1. }
                                                return 1765.
                                            } else {
                                                if slot < 27956 or slot > 27958 { return -1. }
                                                return 1766.
                                            }
                                        } else {
                                            if slot <= 27965 {
                                                if slot < 27959 or slot > 27965 { return -1. }
                                                return 1767.
                                            } else {
                                                if slot <= 27969 {
                                                    if slot < 27966 or slot > 27969 { return -1. }
                                                    return 1768.
                                                } else {
                                                    if slot < 27970 or slot > 27993 { return -1. }
                                                    return 1769.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 28048 {
                                        if slot <= 28005 {
                                            if slot <= 28003 {
                                                if slot < 27994 or slot > 28003 { return -1. }
                                                return 1770.
                                            } else {
                                                if slot < 28004 or slot > 28005 { return -1. }
                                                return 1771.
                                            }
                                        } else {
                                            if slot <= 28007 {
                                                if slot < 28006 or slot > 28007 { return -1. }
                                                return 1772.
                                            } else {
                                                if slot <= 28010 {
                                                    if slot < 28008 or slot > 28010 { return -1. }
                                                    return 1773.
                                                } else {
                                                    if slot < 28011 or slot > 28048 { return -1. }
                                                    return 1774.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28057 {
                                            if slot <= 28050 {
                                                if slot < 28049 or slot > 28050 { return -1. }
                                                return 1775.
                                            } else {
                                                if slot <= 28054 {
                                                    if slot < 28051 or slot > 28054 { return -1. }
                                                    return 1776.
                                                } else {
                                                    if slot < 28055 or slot > 28057 { return -1. }
                                                    return 1777.
                                                }
                                            }
                                        } else {
                                            if slot <= 28064 {
                                                if slot < 28058 or slot > 28064 { return -1. }
                                                return 1778.
                                            } else {
                                                if slot <= 28080 {
                                                    if slot < 28065 or slot > 28080 { return -1. }
                                                    return 1779.
                                                } else {
                                                    if slot < 28081 or slot > 28099 { return -1. }
                                                    return 1780.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 28393 {
                                if slot <= 28263 {
                                    if slot <= 28202 {
                                        if slot <= 28151 {
                                            if slot <= 28101 {
                                                if slot < 28100 or slot > 28101 { return -1. }
                                                return 1781.
                                            } else {
                                                if slot < 28102 or slot > 28151 { return -1. }
                                                return 1782.
                                            }
                                        } else {
                                            if slot <= 28170 {
                                                if slot < 28152 or slot > 28170 { return -1. }
                                                return 1783.
                                            } else {
                                                if slot <= 28196 {
                                                    if slot < 28171 or slot > 28196 { return -1. }
                                                    return 1784.
                                                } else {
                                                    if slot < 28197 or slot > 28202 { return -1. }
                                                    return 1785.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28225 {
                                            if slot <= 28208 {
                                                if slot < 28203 or slot > 28208 { return -1. }
                                                return 1786.
                                            } else {
                                                if slot < 28209 or slot > 28225 { return -1. }
                                                return 1787.
                                            }
                                        } else {
                                            if slot <= 28236 {
                                                if slot < 28226 or slot > 28236 { return -1. }
                                                return 1788.
                                            } else {
                                                if slot <= 28260 {
                                                    if slot < 28237 or slot > 28260 { return -1. }
                                                    return 1789.
                                                } else {
                                                    if slot < 28261 or slot > 28263 { return -1. }
                                                    return 1790.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 28362 {
                                        if slot <= 28318 {
                                            if slot <= 28269 {
                                                if slot < 28264 or slot > 28269 { return -1. }
                                                return 1791.
                                            } else {
                                                if slot < 28270 or slot > 28318 { return -1. }
                                                return 1792.
                                            }
                                        } else {
                                            if slot <= 28324 {
                                                if slot < 28319 or slot > 28324 { return -1. }
                                                return 1793.
                                            } else {
                                                if slot <= 28330 {
                                                    if slot < 28325 or slot > 28330 { return -1. }
                                                    return 1794.
                                                } else {
                                                    if slot < 28331 or slot > 28362 { return -1. }
                                                    return 1795.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28376 {
                                            if slot <= 28364 {
                                                if slot < 28363 or slot > 28364 { return -1. }
                                                return 1796.
                                            } else {
                                                if slot <= 28368 {
                                                    if slot < 28365 or slot > 28368 { return -1. }
                                                    return 1797.
                                                } else {
                                                    if slot < 28369 or slot > 28376 { return -1. }
                                                    return 1798.
                                                }
                                            }
                                        } else {
                                            if slot <= 28385 {
                                                if slot < 28377 or slot > 28385 { return -1. }
                                                return 1799.
                                            } else {
                                                if slot <= 28391 {
                                                    if slot < 28386 or slot > 28391 { return -1. }
                                                    return 1800.
                                                } else {
                                                    if slot < 28392 or slot > 28393 { return -1. }
                                                    return 1801.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 28472 {
                                    if slot <= 28434 {
                                        if slot <= 28410 {
                                            if slot <= 28398 {
                                                if slot < 28394 or slot > 28398 { return -1. }
                                                return 1802.
                                            } else {
                                                if slot < 28399 or slot > 28410 { return -1. }
                                                return 1803.
                                            }
                                        } else {
                                            if slot <= 28411 {
                                                if slot < 28411 or slot > 28411 { return -1. }
                                                return 1804.
                                            } else {
                                                if slot <= 28431 {
                                                    if slot < 28412 or slot > 28431 { return -1. }
                                                    return 1805.
                                                } else {
                                                    if slot < 28432 or slot > 28434 { return -1. }
                                                    return 1806.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28450 {
                                            if slot <= 28438 {
                                                if slot < 28435 or slot > 28438 { return -1. }
                                                return 1807.
                                            } else {
                                                if slot < 28439 or slot > 28450 { return -1. }
                                                return 1808.
                                            }
                                        } else {
                                            if slot <= 28457 {
                                                if slot < 28451 or slot > 28457 { return -1. }
                                                return 1809.
                                            } else {
                                                if slot <= 28463 {
                                                    if slot < 28458 or slot > 28463 { return -1. }
                                                    return 1810.
                                                } else {
                                                    if slot < 28464 or slot > 28472 { return -1. }
                                                    return 1811.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 28500 {
                                        if slot <= 28477 {
                                            if slot <= 28474 {
                                                if slot < 28473 or slot > 28474 { return -1. }
                                                return 1812.
                                            } else {
                                                if slot < 28475 or slot > 28477 { return -1. }
                                                return 1813.
                                            }
                                        } else {
                                            if slot <= 28488 {
                                                if slot < 28478 or slot > 28488 { return -1. }
                                                return 1814.
                                            } else {
                                                if slot <= 28497 {
                                                    if slot < 28489 or slot > 28497 { return -1. }
                                                    return 1815.
                                                } else {
                                                    if slot < 28498 or slot > 28500 { return -1. }
                                                    return 1816.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28518 {
                                            if slot <= 28514 {
                                                if slot < 28501 or slot > 28514 { return -1. }
                                                return 1817.
                                            } else {
                                                if slot <= 28516 {
                                                    if slot < 28515 or slot > 28516 { return -1. }
                                                    return 1818.
                                                } else {
                                                    if slot < 28517 or slot > 28518 { return -1. }
                                                    return 1819.
                                                }
                                            }
                                        } else {
                                            if slot <= 28522 {
                                                if slot < 28519 or slot > 28522 { return -1. }
                                                return 1820.
                                            } else {
                                                if slot <= 28538 {
                                                    if slot < 28523 or slot > 28538 { return -1. }
                                                    return 1821.
                                                } else {
                                                    if slot < 28539 or slot > 28541 { return -1. }
                                                    return 1822.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 29675 {
                        if slot <= 29062 {
                            if slot <= 28750 {
                                if slot <= 28636 {
                                    if slot <= 28578 {
                                        if slot <= 28554 {
                                            if slot <= 28546 {
                                                if slot < 28542 or slot > 28546 { return -1. }
                                                return 1823.
                                            } else {
                                                if slot < 28547 or slot > 28554 { return -1. }
                                                return 1824.
                                            }
                                        } else {
                                            if slot <= 28557 {
                                                if slot < 28555 or slot > 28557 { return -1. }
                                                return 1825.
                                            } else {
                                                if slot <= 28569 {
                                                    if slot < 28558 or slot > 28569 { return -1. }
                                                    return 1826.
                                                } else {
                                                    if slot < 28570 or slot > 28578 { return -1. }
                                                    return 1827.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28606 {
                                            if slot <= 28583 {
                                                if slot < 28579 or slot > 28583 { return -1. }
                                                return 1828.
                                            } else {
                                                if slot < 28584 or slot > 28606 { return -1. }
                                                return 1829.
                                            }
                                        } else {
                                            if slot <= 28608 {
                                                if slot < 28607 or slot > 28608 { return -1. }
                                                return 1830.
                                            } else {
                                                if slot <= 28610 {
                                                    if slot < 28609 or slot > 28610 { return -1. }
                                                    return 1831.
                                                } else {
                                                    if slot < 28611 or slot > 28636 { return -1. }
                                                    return 1832.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 28706 {
                                        if slot <= 28645 {
                                            if slot <= 28638 {
                                                if slot < 28637 or slot > 28638 { return -1. }
                                                return 1833.
                                            } else {
                                                if slot < 28639 or slot > 28645 { return -1. }
                                                return 1834.
                                            }
                                        } else {
                                            if slot <= 28682 {
                                                if slot < 28677 or slot > 28682 { return -1. }
                                                return 1835.
                                            } else {
                                                if slot <= 28692 {
                                                    if slot < 28683 or slot > 28692 { return -1. }
                                                    return 1836.
                                                } else {
                                                    if slot < 28693 or slot > 28706 { return -1. }
                                                    return 1837.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28729 {
                                            if slot <= 28709 {
                                                if slot < 28707 or slot > 28709 { return -1. }
                                                return 1838.
                                            } else {
                                                if slot < 28710 or slot > 28729 { return -1. }
                                                return 1839.
                                            }
                                        } else {
                                            if slot <= 28734 {
                                                if slot < 28730 or slot > 28734 { return -1. }
                                                return 1840.
                                            } else {
                                                if slot <= 28747 {
                                                    if slot < 28735 or slot > 28747 { return -1. }
                                                    return 1841.
                                                } else {
                                                    if slot < 28748 or slot > 28750 { return -1. }
                                                    return 1842.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 28957 {
                                    if slot <= 28917 {
                                        if slot <= 28755 {
                                            if slot <= 28752 {
                                                if slot < 28751 or slot > 28752 { return -1. }
                                                return 1843.
                                            } else {
                                                if slot < 28753 or slot > 28755 { return -1. }
                                                return 1844.
                                            }
                                        } else {
                                            if slot <= 28758 {
                                                if slot < 28756 or slot > 28758 { return -1. }
                                                return 1845.
                                            } else {
                                                if slot <= 28761 {
                                                    if slot < 28759 or slot > 28761 { return -1. }
                                                    return 1846.
                                                } else {
                                                    if slot < 28916 or slot > 28917 { return -1. }
                                                    return 1847.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28933 {
                                            if slot <= 28921 {
                                                if slot < 28918 or slot > 28921 { return -1. }
                                                return 1848.
                                            } else {
                                                if slot < 28922 or slot > 28933 { return -1. }
                                                return 1849.
                                            }
                                        } else {
                                            if slot <= 28935 {
                                                if slot < 28934 or slot > 28935 { return -1. }
                                                return 1850.
                                            } else {
                                                if slot <= 28955 {
                                                    if slot < 28936 or slot > 28955 { return -1. }
                                                    return 1851.
                                                } else {
                                                    if slot < 28956 or slot > 28957 { return -1. }
                                                    return 1852.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 29040 {
                                        if slot <= 29013 {
                                            if slot <= 28995 {
                                                if slot < 28958 or slot > 28995 { return -1. }
                                                return 1853.
                                            } else {
                                                if slot < 28996 or slot > 29013 { return -1. }
                                                return 1854.
                                            }
                                        } else {
                                            if slot <= 29017 {
                                                if slot < 29014 or slot > 29017 { return -1. }
                                                return 1855.
                                            } else {
                                                if slot <= 29030 {
                                                    if slot < 29018 or slot > 29030 { return -1. }
                                                    return 1856.
                                                } else {
                                                    if slot < 29031 or slot > 29040 { return -1. }
                                                    return 1857.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29047 {
                                            if slot <= 29042 {
                                                if slot < 29041 or slot > 29042 { return -1. }
                                                return 1858.
                                            } else {
                                                if slot <= 29045 {
                                                    if slot < 29043 or slot > 29045 { return -1. }
                                                    return 1859.
                                                } else {
                                                    if slot < 29046 or slot > 29047 { return -1. }
                                                    return 1860.
                                                }
                                            }
                                        } else {
                                            if slot <= 29052 {
                                                if slot < 29048 or slot > 29052 { return -1. }
                                                return 1861.
                                            } else {
                                                if slot <= 29054 {
                                                    if slot < 29053 or slot > 29054 { return -1. }
                                                    return 1862.
                                                } else {
                                                    if slot < 29055 or slot > 29062 { return -1. }
                                                    return 1863.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 29369 {
                                if slot <= 29313 {
                                    if slot <= 29175 {
                                        if slot <= 29081 {
                                            if slot <= 29078 {
                                                if slot < 29063 or slot > 29078 { return -1. }
                                                return 1864.
                                            } else {
                                                if slot < 29079 or slot > 29081 { return -1. }
                                                return 1865.
                                            }
                                        } else {
                                            if slot <= 29096 {
                                                if slot < 29082 or slot > 29096 { return -1. }
                                                return 1866.
                                            } else {
                                                if slot <= 29160 {
                                                    if slot < 29097 or slot > 29160 { return -1. }
                                                    return 1867.
                                                } else {
                                                    if slot < 29161 or slot > 29175 { return -1. }
                                                    return 1868.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29183 {
                                            if slot <= 29179 {
                                                if slot < 29176 or slot > 29179 { return -1. }
                                                return 1869.
                                            } else {
                                                if slot < 29182 or slot > 29183 { return -1. }
                                                return 1870.
                                            }
                                        } else {
                                            if slot <= 29185 {
                                                if slot < 29184 or slot > 29185 { return -1. }
                                                return 1871.
                                            } else {
                                                if slot <= 29249 {
                                                    if slot < 29186 or slot > 29249 { return -1. }
                                                    return 1872.
                                                } else {
                                                    if slot < 29250 or slot > 29313 { return -1. }
                                                    return 1873.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 29338 {
                                        if slot <= 29318 {
                                            if slot <= 29315 {
                                                if slot < 29314 or slot > 29315 { return -1. }
                                                return 1874.
                                            } else {
                                                if slot < 29316 or slot > 29318 { return -1. }
                                                return 1875.
                                            }
                                        } else {
                                            if slot <= 29330 {
                                                if slot < 29319 or slot > 29330 { return -1. }
                                                return 1876.
                                            } else {
                                                if slot <= 29335 {
                                                    if slot < 29331 or slot > 29335 { return -1. }
                                                    return 1877.
                                                } else {
                                                    if slot < 29336 or slot > 29338 { return -1. }
                                                    return 1878.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29352 {
                                            if slot <= 29340 {
                                                if slot < 29339 or slot > 29340 { return -1. }
                                                return 1879.
                                            } else {
                                                if slot <= 29348 {
                                                    if slot < 29341 or slot > 29348 { return -1. }
                                                    return 1880.
                                                } else {
                                                    if slot < 29349 or slot > 29352 { return -1. }
                                                    return 1881.
                                                }
                                            }
                                        } else {
                                            if slot <= 29353 {
                                                if slot < 29353 or slot > 29353 { return -1. }
                                                return 1882.
                                            } else {
                                                if slot <= 29366 {
                                                    if slot < 29363 or slot > 29366 { return -1. }
                                                    return 1883.
                                                } else {
                                                    if slot < 29367 or slot > 29369 { return -1. }
                                                    return 1884.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 29551 {
                                    if slot <= 29529 {
                                        if slot <= 29512 {
                                            if slot <= 29372 {
                                                if slot < 29370 or slot > 29372 { return -1. }
                                                return 1885.
                                            } else {
                                                if slot < 29373 or slot > 29512 { return -1. }
                                                return 1886.
                                            }
                                        } else {
                                            if slot <= 29515 {
                                                if slot < 29513 or slot > 29515 { return -1. }
                                                return 1887.
                                            } else {
                                                if slot <= 29528 {
                                                    if slot < 29516 or slot > 29528 { return -1. }
                                                    return 1888.
                                                } else {
                                                    if slot < 29529 or slot > 29529 { return -1. }
                                                    return 1889.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29545 {
                                            if slot <= 29539 {
                                                if slot < 29536 or slot > 29539 { return -1. }
                                                return 1890.
                                            } else {
                                                if slot < 29540 or slot > 29545 { return -1. }
                                                return 1891.
                                            }
                                        } else {
                                            if slot <= 29547 {
                                                if slot < 29546 or slot > 29547 { return -1. }
                                                return 1892.
                                            } else {
                                                if slot <= 29549 {
                                                    if slot < 29548 or slot > 29549 { return -1. }
                                                    return 1893.
                                                } else {
                                                    if slot < 29550 or slot > 29551 { return -1. }
                                                    return 1894.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 29631 {
                                        if slot <= 29624 {
                                            if slot <= 29553 {
                                                if slot < 29552 or slot > 29553 { return -1. }
                                                return 1895.
                                            } else {
                                                if slot < 29554 or slot > 29624 { return -1. }
                                                return 1896.
                                            }
                                        } else {
                                            if slot <= 29626 {
                                                if slot < 29625 or slot > 29626 { return -1. }
                                                return 1897.
                                            } else {
                                                if slot <= 29629 {
                                                    if slot < 29627 or slot > 29629 { return -1. }
                                                    return 1898.
                                                } else {
                                                    if slot < 29630 or slot > 29631 { return -1. }
                                                    return 1899.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29656 {
                                            if slot <= 29637 {
                                                if slot < 29632 or slot > 29637 { return -1. }
                                                return 1900.
                                            } else {
                                                if slot <= 29640 {
                                                    if slot < 29638 or slot > 29640 { return -1. }
                                                    return 1901.
                                                } else {
                                                    if slot < 29641 or slot > 29656 { return -1. }
                                                    return 1902.
                                                }
                                            }
                                        } else {
                                            if slot <= 29658 {
                                                if slot < 29657 or slot > 29658 { return -1. }
                                                return 1903.
                                            } else {
                                                if slot <= 29669 {
                                                    if slot < 29659 or slot > 29669 { return -1. }
                                                    return 1904.
                                                } else {
                                                    if slot < 29670 or slot > 29675 { return -1. }
                                                    return 1905.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 30166 {
                            if slot <= 29940 {
                                if slot <= 29808 {
                                    if slot <= 29767 {
                                        if slot <= 29690 {
                                            if slot <= 29689 {
                                                if slot < 29688 or slot > 29689 { return -1. }
                                                return 1906.
                                            } else {
                                                if slot < 29690 or slot > 29690 { return -1. }
                                                return 1907.
                                            }
                                        } else {
                                            if slot <= 29749 {
                                                if slot < 29733 or slot > 29749 { return -1. }
                                                return 1908.
                                            } else {
                                                if slot <= 29757 {
                                                    if slot < 29750 or slot > 29757 { return -1. }
                                                    return 1909.
                                                } else {
                                                    if slot < 29758 or slot > 29767 { return -1. }
                                                    return 1910.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29776 {
                                            if slot <= 29774 {
                                                if slot < 29768 or slot > 29774 { return -1. }
                                                return 1911.
                                            } else {
                                                if slot < 29775 or slot > 29776 { return -1. }
                                                return 1912.
                                            }
                                        } else {
                                            if slot <= 29778 {
                                                if slot < 29777 or slot > 29778 { return -1. }
                                                return 1913.
                                            } else {
                                                if slot <= 29800 {
                                                    if slot < 29779 or slot > 29800 { return -1. }
                                                    return 1914.
                                                } else {
                                                    if slot < 29801 or slot > 29808 { return -1. }
                                                    return 1915.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 29842 {
                                        if slot <= 29821 {
                                            if slot <= 29820 {
                                                if slot < 29809 or slot > 29820 { return -1. }
                                                return 1916.
                                            } else {
                                                if slot < 29821 or slot > 29821 { return -1. }
                                                return 1917.
                                            }
                                        } else {
                                            if slot <= 29834 {
                                                if slot < 29830 or slot > 29834 { return -1. }
                                                return 1918.
                                            } else {
                                                if slot <= 29838 {
                                                    if slot < 29835 or slot > 29838 { return -1. }
                                                    return 1919.
                                                } else {
                                                    if slot < 29839 or slot > 29842 { return -1. }
                                                    return 1920.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29877 {
                                            if slot <= 29874 {
                                                if slot < 29843 or slot > 29874 { return -1. }
                                                return 1921.
                                            } else {
                                                if slot < 29875 or slot > 29877 { return -1. }
                                                return 1922.
                                            }
                                        } else {
                                            if slot <= 29883 {
                                                if slot < 29878 or slot > 29883 { return -1. }
                                                return 1923.
                                            } else {
                                                if slot <= 29936 {
                                                    if slot < 29884 or slot > 29936 { return -1. }
                                                    return 1924.
                                                } else {
                                                    if slot < 29937 or slot > 29940 { return -1. }
                                                    return 1925.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 30001 {
                                    if slot <= 29979 {
                                        if slot <= 29954 {
                                            if slot <= 29948 {
                                                if slot < 29941 or slot > 29948 { return -1. }
                                                return 1926.
                                            } else {
                                                if slot < 29949 or slot > 29954 { return -1. }
                                                return 1927.
                                            }
                                        } else {
                                            if slot <= 29967 {
                                                if slot < 29955 or slot > 29967 { return -1. }
                                                return 1928.
                                            } else {
                                                if slot <= 29977 {
                                                    if slot < 29968 or slot > 29977 { return -1. }
                                                    return 1929.
                                                } else {
                                                    if slot < 29978 or slot > 29979 { return -1. }
                                                    return 1930.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 29984 {
                                            if slot <= 29983 {
                                                if slot < 29980 or slot > 29983 { return -1. }
                                                return 1931.
                                            } else {
                                                if slot < 29984 or slot > 29984 { return -1. }
                                                return 1932.
                                            }
                                        } else {
                                            if slot <= 29990 {
                                                if slot < 29985 or slot > 29990 { return -1. }
                                                return 1933.
                                            } else {
                                                if slot <= 29999 {
                                                    if slot < 29991 or slot > 29999 { return -1. }
                                                    return 1934.
                                                } else {
                                                    if slot < 30000 or slot > 30001 { return -1. }
                                                    return 1935.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30151 {
                                        if slot <= 30053 {
                                            if slot <= 30047 {
                                                if slot < 30002 or slot > 30047 { return -1. }
                                                return 1936.
                                            } else {
                                                if slot < 30048 or slot > 30053 { return -1. }
                                                return 1937.
                                            }
                                        } else {
                                            if slot <= 30103 {
                                                if slot < 30054 or slot > 30103 { return -1. }
                                                return 1938.
                                            } else {
                                                if slot <= 30134 {
                                                    if slot < 30104 or slot > 30134 { return -1. }
                                                    return 1939.
                                                } else {
                                                    if slot < 30135 or slot > 30151 { return -1. }
                                                    return 1940.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 30159 {
                                            if slot <= 30154 {
                                                if slot < 30152 or slot > 30154 { return -1. }
                                                return 1941.
                                            } else {
                                                if slot <= 30157 {
                                                    if slot < 30155 or slot > 30157 { return -1. }
                                                    return 1942.
                                                } else {
                                                    if slot < 30158 or slot > 30159 { return -1. }
                                                    return 1943.
                                                }
                                            }
                                        } else {
                                            if slot <= 30161 {
                                                if slot < 30160 or slot > 30161 { return -1. }
                                                return 1944.
                                            } else {
                                                if slot <= 30163 {
                                                    if slot < 30162 or slot > 30163 { return -1. }
                                                    return 1945.
                                                } else {
                                                    if slot < 30164 or slot > 30166 { return -1. }
                                                    return 1946.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 30554 {
                                if slot <= 30419 {
                                    if slot <= 30354 {
                                        if slot <= 30259 {
                                            if slot <= 30249 {
                                                if slot < 30167 or slot > 30249 { return -1. }
                                                return 1947.
                                            } else {
                                                if slot < 30250 or slot > 30259 { return -1. }
                                                return 1948.
                                            }
                                        } else {
                                            if slot <= 30316 {
                                                if slot < 30260 or slot > 30316 { return -1. }
                                                return 1949.
                                            } else {
                                                if slot <= 30337 {
                                                    if slot < 30317 or slot > 30337 { return -1. }
                                                    return 1950.
                                                } else {
                                                    if slot < 30338 or slot > 30354 { return -1. }
                                                    return 1951.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 30370 {
                                            if slot <= 30364 {
                                                if slot < 30355 or slot > 30364 { return -1. }
                                                return 1952.
                                            } else {
                                                if slot < 30365 or slot > 30370 { return -1. }
                                                return 1953.
                                            }
                                        } else {
                                            if slot <= 30378 {
                                                if slot < 30371 or slot > 30378 { return -1. }
                                                return 1954.
                                            } else {
                                                if slot <= 30404 {
                                                    if slot < 30379 or slot > 30404 { return -1. }
                                                    return 1955.
                                                } else {
                                                    if slot < 30405 or slot > 30419 { return -1. }
                                                    return 1956.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30488 {
                                        if slot <= 30441 {
                                            if slot <= 30429 {
                                                if slot < 30420 or slot > 30429 { return -1. }
                                                return 1957.
                                            } else {
                                                if slot < 30430 or slot > 30441 { return -1. }
                                                return 1958.
                                            }
                                        } else {
                                            if slot <= 30476 {
                                                if slot < 30442 or slot > 30476 { return -1. }
                                                return 1959.
                                            } else {
                                                if slot <= 30482 {
                                                    if slot < 30477 or slot > 30482 { return -1. }
                                                    return 1960.
                                                } else {
                                                    if slot < 30483 or slot > 30488 { return -1. }
                                                    return 1961.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 30519 {
                                            if slot <= 30506 {
                                                if slot < 30489 or slot > 30506 { return -1. }
                                                return 1962.
                                            } else {
                                                if slot <= 30514 {
                                                    if slot < 30507 or slot > 30514 { return -1. }
                                                    return 1963.
                                                } else {
                                                    if slot < 30515 or slot > 30519 { return -1. }
                                                    return 1964.
                                                }
                                            }
                                        } else {
                                            if slot <= 30536 {
                                                if slot < 30520 or slot > 30536 { return -1. }
                                                return 1965.
                                            } else {
                                                if slot <= 30550 {
                                                    if slot < 30537 or slot > 30550 { return -1. }
                                                    return 1966.
                                                } else {
                                                    if slot < 30551 or slot > 30554 { return -1. }
                                                    return 1967.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 30647 {
                                    if slot <= 30598 {
                                        if slot <= 30564 {
                                            if slot <= 30560 {
                                                if slot < 30555 or slot > 30560 { return -1. }
                                                return 1968.
                                            } else {
                                                if slot < 30561 or slot > 30564 { return -1. }
                                                return 1969.
                                            }
                                        } else {
                                            if slot <= 30568 {
                                                if slot < 30565 or slot > 30568 { return -1. }
                                                return 1970.
                                            } else {
                                                if slot <= 30585 {
                                                    if slot < 30569 or slot > 30585 { return -1. }
                                                    return 1971.
                                                } else {
                                                    if slot < 30586 or slot > 30598 { return -1. }
                                                    return 1972.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 30609 {
                                            if slot <= 30604 {
                                                if slot < 30599 or slot > 30604 { return -1. }
                                                return 1973.
                                            } else {
                                                if slot < 30605 or slot > 30609 { return -1. }
                                                return 1974.
                                            }
                                        } else {
                                            if slot <= 30615 {
                                                if slot < 30610 or slot > 30615 { return -1. }
                                                return 1975.
                                            } else {
                                                if slot <= 30617 {
                                                    if slot < 30616 or slot > 30617 { return -1. }
                                                    return 1976.
                                                } else {
                                                    if slot < 30618 or slot > 30647 { return -1. }
                                                    return 1977.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30672 {
                                        if slot <= 30651 {
                                            if slot <= 30649 {
                                                if slot < 30648 or slot > 30649 { return -1. }
                                                return 1978.
                                            } else {
                                                if slot < 30650 or slot > 30651 { return -1. }
                                                return 1979.
                                            }
                                        } else {
                                            if slot <= 30656 {
                                                if slot < 30652 or slot > 30656 { return -1. }
                                                return 1980.
                                            } else {
                                                if slot <= 30661 {
                                                    if slot < 30658 or slot > 30661 { return -1. }
                                                    return 1981.
                                                } else {
                                                    if slot < 30662 or slot > 30672 { return -1. }
                                                    return 1982.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 30718 {
                                            if slot <= 30694 {
                                                if slot < 30673 or slot > 30694 { return -1. }
                                                return 1983.
                                            } else {
                                                if slot <= 30717 {
                                                    if slot < 30695 or slot > 30717 { return -1. }
                                                    return 1984.
                                                } else {
                                                    if slot < 30718 or slot > 30718 { return -1. }
                                                    return 1985.
                                                }
                                            }
                                        } else {
                                            if slot <= 31418 {
                                                if slot < 31417 or slot > 31418 { return -1. }
                                                return 1986.
                                            } else {
                                                if slot <= 31421 {
                                                    if slot < 31419 or slot > 31421 { return -1. }
                                                    return 1987.
                                                } else {
                                                    if slot < 31422 or slot > 31423 { return -1. }
                                                    return 1988.
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
            if slot <= 35086 {
                if slot <= 33322 {
                    if slot <= 32830 {
                        if slot <= 31990 {
                            if slot <= 31740 {
                                if slot <= 31580 {
                                    if slot <= 31534 {
                                        if slot <= 31443 {
                                            if slot <= 31430 {
                                                if slot < 31424 or slot > 31430 { return -1. }
                                                return 1989.
                                            } else {
                                                if slot < 31431 or slot > 31443 { return -1. }
                                                return 1990.
                                            }
                                        } else {
                                            if slot <= 31469 {
                                                if slot < 31444 or slot > 31469 { return -1. }
                                                return 1991.
                                            } else {
                                                if slot <= 31472 {
                                                    if slot < 31470 or slot > 31472 { return -1. }
                                                    return 1992.
                                                } else {
                                                    if slot < 31473 or slot > 31534 { return -1. }
                                                    return 1993.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 31568 {
                                            if slot <= 31554 {
                                                if slot < 31535 or slot > 31554 { return -1. }
                                                return 1994.
                                            } else {
                                                if slot < 31555 or slot > 31568 { return -1. }
                                                return 1995.
                                            }
                                        } else {
                                            if slot <= 31570 {
                                                if slot < 31569 or slot > 31570 { return -1. }
                                                return 1996.
                                            } else {
                                                if slot <= 31575 {
                                                    if slot < 31571 or slot > 31575 { return -1. }
                                                    return 1997.
                                                } else {
                                                    if slot < 31576 or slot > 31580 { return -1. }
                                                    return 1998.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 31666 {
                                        if slot <= 31638 {
                                            if slot <= 31632 {
                                                if slot < 31581 or slot > 31632 { return -1. }
                                                return 1999.
                                            } else {
                                                if slot < 31633 or slot > 31638 { return -1. }
                                                return 2000.
                                            }
                                        } else {
                                            if slot <= 31641 {
                                                if slot < 31639 or slot > 31641 { return -1. }
                                                return 2001.
                                            } else {
                                                if slot <= 31651 {
                                                    if slot < 31650 or slot > 31651 { return -1. }
                                                    return 2002.
                                                } else {
                                                    if slot < 31652 or slot > 31666 { return -1. }
                                                    return 2003.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 31695 {
                                            if slot <= 31672 {
                                                if slot < 31667 or slot > 31672 { return -1. }
                                                return 2004.
                                            } else {
                                                if slot < 31694 or slot > 31695 { return -1. }
                                                return 2005.
                                            }
                                        } else {
                                            if slot <= 31697 {
                                                if slot < 31696 or slot > 31697 { return -1. }
                                                return 2006.
                                            } else {
                                                if slot <= 31722 {
                                                    if slot < 31698 or slot > 31722 { return -1. }
                                                    return 2007.
                                                } else {
                                                    if slot < 31723 or slot > 31740 { return -1. }
                                                    return 2008.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 31822 {
                                    if slot <= 31761 {
                                        if slot <= 31747 {
                                            if slot <= 31745 {
                                                if slot < 31744 or slot > 31745 { return -1. }
                                                return 2009.
                                            } else {
                                                if slot < 31746 or slot > 31747 { return -1. }
                                                return 2010.
                                            }
                                        } else {
                                            if slot <= 31753 {
                                                if slot < 31748 or slot > 31753 { return -1. }
                                                return 2011.
                                            } else {
                                                if slot <= 31758 {
                                                    if slot < 31754 or slot > 31758 { return -1. }
                                                    return 2012.
                                                } else {
                                                    if slot < 31759 or slot > 31761 { return -1. }
                                                    return 2013.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 31784 {
                                            if slot <= 31779 {
                                                if slot < 31767 or slot > 31779 { return -1. }
                                                return 2014.
                                            } else {
                                                if slot < 31780 or slot > 31784 { return -1. }
                                                return 2015.
                                            }
                                        } else {
                                            if slot <= 31817 {
                                                if slot < 31785 or slot > 31817 { return -1. }
                                                return 2016.
                                            } else {
                                                if slot <= 31819 {
                                                    if slot < 31818 or slot > 31819 { return -1. }
                                                    return 2017.
                                                } else {
                                                    if slot < 31820 or slot > 31822 { return -1. }
                                                    return 2018.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 31930 {
                                        if slot <= 31885 {
                                            if slot <= 31866 {
                                                if slot < 31823 or slot > 31866 { return -1. }
                                                return 2019.
                                            } else {
                                                if slot < 31867 or slot > 31885 { return -1. }
                                                return 2020.
                                            }
                                        } else {
                                            if slot <= 31925 {
                                                if slot < 31886 or slot > 31925 { return -1. }
                                                return 2021.
                                            } else {
                                                if slot <= 31927 {
                                                    if slot < 31926 or slot > 31927 { return -1. }
                                                    return 2022.
                                                } else {
                                                    if slot < 31928 or slot > 31930 { return -1. }
                                                    return 2023.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 31978 {
                                            if slot <= 31964 {
                                                if slot < 31931 or slot > 31964 { return -1. }
                                                return 2024.
                                            } else {
                                                if slot <= 31974 {
                                                    if slot < 31965 or slot > 31974 { return -1. }
                                                    return 2025.
                                                } else {
                                                    if slot < 31975 or slot > 31978 { return -1. }
                                                    return 2026.
                                                }
                                            }
                                        } else {
                                            if slot <= 31983 {
                                                if slot < 31979 or slot > 31983 { return -1. }
                                                return 2027.
                                            } else {
                                                if slot <= 31988 {
                                                    if slot < 31984 or slot > 31988 { return -1. }
                                                    return 2028.
                                                } else {
                                                    if slot < 31989 or slot > 31990 { return -1. }
                                                    return 2029.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 32640 {
                                if slot <= 32145 {
                                    if slot <= 32039 {
                                        if slot <= 32025 {
                                            if slot <= 32002 {
                                                if slot < 31991 or slot > 32002 { return -1. }
                                                return 2030.
                                            } else {
                                                if slot < 32003 or slot > 32025 { return -1. }
                                                return 2031.
                                            }
                                        } else {
                                            if slot <= 32034 {
                                                if slot < 32026 or slot > 32034 { return -1. }
                                                return 2032.
                                            } else {
                                                if slot <= 32038 {
                                                    if slot < 32035 or slot > 32038 { return -1. }
                                                    return 2033.
                                                } else {
                                                    if slot < 32039 or slot > 32039 { return -1. }
                                                    return 2034.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 32095 {
                                            if slot <= 32090 {
                                                if slot < 32040 or slot > 32090 { return -1. }
                                                return 2035.
                                            } else {
                                                if slot < 32091 or slot > 32095 { return -1. }
                                                return 2036.
                                            }
                                        } else {
                                            if slot <= 32140 {
                                                if slot < 32101 or slot > 32140 { return -1. }
                                                return 2037.
                                            } else {
                                                if slot <= 32142 {
                                                    if slot < 32141 or slot > 32142 { return -1. }
                                                    return 2038.
                                                } else {
                                                    if slot < 32143 or slot > 32145 { return -1. }
                                                    return 2039.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 32605 {
                                        if slot <= 32157 {
                                            if slot <= 32154 {
                                                if slot < 32146 or slot > 32154 { return -1. }
                                                return 2040.
                                            } else {
                                                if slot < 32155 or slot > 32157 { return -1. }
                                                return 2041.
                                            }
                                        } else {
                                            if slot <= 32203 {
                                                if slot < 32158 or slot > 32203 { return -1. }
                                                return 2042.
                                            } else {
                                                if slot <= 32212 {
                                                    if slot < 32204 or slot > 32212 { return -1. }
                                                    return 2043.
                                                } else {
                                                    if slot < 32213 or slot > 32605 { return -1. }
                                                    return 2044.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 32618 {
                                            if slot <= 32608 {
                                                if slot < 32606 or slot > 32608 { return -1. }
                                                return 2045.
                                            } else {
                                                if slot < 32609 or slot > 32618 { return -1. }
                                                return 2046.
                                            }
                                        } else {
                                            if slot <= 32620 {
                                                if slot < 32619 or slot > 32620 { return -1. }
                                                return 2047.
                                            } else {
                                                if slot <= 32628 {
                                                    if slot < 32621 or slot > 32628 { return -1. }
                                                    return 2048.
                                                } else {
                                                    if slot < 32629 or slot > 32640 { return -1. }
                                                    return 2049.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 32719 {
                                    if slot <= 32689 {
                                        if slot <= 32668 {
                                            if slot <= 32659 {
                                                if slot < 32641 or slot > 32659 { return -1. }
                                                return 2050.
                                            } else {
                                                if slot < 32660 or slot > 32668 { return -1. }
                                                return 2051.
                                            }
                                        } else {
                                            if slot <= 32674 {
                                                if slot < 32669 or slot > 32674 { return -1. }
                                                return 2052.
                                            } else {
                                                if slot <= 32677 {
                                                    if slot < 32675 or slot > 32677 { return -1. }
                                                    return 2053.
                                                } else {
                                                    if slot < 32678 or slot > 32689 { return -1. }
                                                    return 2054.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 32695 {
                                            if slot <= 32691 {
                                                if slot < 32690 or slot > 32691 { return -1. }
                                                return 2055.
                                            } else {
                                                if slot < 32692 or slot > 32695 { return -1. }
                                                return 2056.
                                            }
                                        } else {
                                            if slot <= 32699 {
                                                if slot < 32696 or slot > 32699 { return -1. }
                                                return 2057.
                                            } else {
                                                if slot <= 32704 {
                                                    if slot < 32700 or slot > 32704 { return -1. }
                                                    return 2058.
                                                } else {
                                                    if slot < 32705 or slot > 32719 { return -1. }
                                                    return 2059.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 32794 {
                                        if slot <= 32746 {
                                            if slot <= 32722 {
                                                if slot < 32720 or slot > 32722 { return -1. }
                                                return 2060.
                                            } else {
                                                if slot < 32743 or slot > 32746 { return -1. }
                                                return 2061.
                                            }
                                        } else {
                                            if slot <= 32760 {
                                                if slot < 32747 or slot > 32760 { return -1. }
                                                return 2062.
                                            } else {
                                                if slot <= 32764 {
                                                    if slot < 32761 or slot > 32764 { return -1. }
                                                    return 2063.
                                                } else {
                                                    if slot < 32787 or slot > 32794 { return -1. }
                                                    return 2064.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 32814 {
                                            if slot <= 32798 {
                                                if slot < 32795 or slot > 32798 { return -1. }
                                                return 2065.
                                            } else {
                                                if slot <= 32806 {
                                                    if slot < 32799 or slot > 32806 { return -1. }
                                                    return 2066.
                                                } else {
                                                    if slot < 32807 or slot > 32814 { return -1. }
                                                    return 2067.
                                                }
                                            }
                                        } else {
                                            if slot <= 32817 {
                                                if slot < 32815 or slot > 32817 { return -1. }
                                                return 2068.
                                            } else {
                                                if slot <= 32825 {
                                                    if slot < 32818 or slot > 32825 { return -1. }
                                                    return 2069.
                                                } else {
                                                    if slot < 32826 or slot > 32830 { return -1. }
                                                    return 2070.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 33099 {
                            if slot <= 32957 {
                                if slot <= 32916 {
                                    if slot <= 32866 {
                                        if slot <= 32842 {
                                            if slot <= 32838 {
                                                if slot < 32831 or slot > 32838 { return -1. }
                                                return 2071.
                                            } else {
                                                if slot < 32839 or slot > 32842 { return -1. }
                                                return 2072.
                                            }
                                        } else {
                                            if slot <= 32855 {
                                                if slot < 32843 or slot > 32855 { return -1. }
                                                return 2073.
                                            } else {
                                                if slot <= 32860 {
                                                    if slot < 32856 or slot > 32860 { return -1. }
                                                    return 2074.
                                                } else {
                                                    if slot < 32861 or slot > 32866 { return -1. }
                                                    return 2075.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 32872 {
                                            if slot <= 32869 {
                                                if slot < 32867 or slot > 32869 { return -1. }
                                                return 2076.
                                            } else {
                                                if slot < 32870 or slot > 32872 { return -1. }
                                                return 2077.
                                            }
                                        } else {
                                            if slot <= 32897 {
                                                if slot < 32873 or slot > 32897 { return -1. }
                                                return 2078.
                                            } else {
                                                if slot <= 32914 {
                                                    if slot < 32898 or slot > 32914 { return -1. }
                                                    return 2079.
                                                } else {
                                                    if slot < 32915 or slot > 32916 { return -1. }
                                                    return 2080.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 32936 {
                                        if slot <= 32926 {
                                            if slot <= 32918 {
                                                if slot < 32917 or slot > 32918 { return -1. }
                                                return 2081.
                                            } else {
                                                if slot < 32919 or slot > 32926 { return -1. }
                                                return 2082.
                                            }
                                        } else {
                                            if slot <= 32930 {
                                                if slot < 32927 or slot > 32930 { return -1. }
                                                return 2083.
                                            } else {
                                                if slot <= 32932 {
                                                    if slot < 32931 or slot > 32932 { return -1. }
                                                    return 2084.
                                                } else {
                                                    if slot < 32933 or slot > 32936 { return -1. }
                                                    return 2085.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 32945 {
                                            if slot <= 32941 {
                                                if slot < 32937 or slot > 32941 { return -1. }
                                                return 2086.
                                            } else {
                                                if slot < 32942 or slot > 32945 { return -1. }
                                                return 2087.
                                            }
                                        } else {
                                            if slot <= 32948 {
                                                if slot < 32946 or slot > 32948 { return -1. }
                                                return 2088.
                                            } else {
                                                if slot <= 32953 {
                                                    if slot < 32949 or slot > 32953 { return -1. }
                                                    return 2089.
                                                } else {
                                                    if slot < 32954 or slot > 32957 { return -1. }
                                                    return 2090.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 33009 {
                                    if slot <= 32983 {
                                        if slot <= 32964 {
                                            if slot <= 32960 {
                                                if slot < 32958 or slot > 32960 { return -1. }
                                                return 2091.
                                            } else {
                                                if slot < 32961 or slot > 32964 { return -1. }
                                                return 2092.
                                            }
                                        } else {
                                            if slot <= 32969 {
                                                if slot < 32965 or slot > 32969 { return -1. }
                                                return 2093.
                                            } else {
                                                if slot <= 32977 {
                                                    if slot < 32970 or slot > 32977 { return -1. }
                                                    return 2094.
                                                } else {
                                                    if slot < 32978 or slot > 32983 { return -1. }
                                                    return 2095.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 32997 {
                                            if slot <= 32985 {
                                                if slot < 32984 or slot > 32985 { return -1. }
                                                return 2096.
                                            } else {
                                                if slot < 32986 or slot > 32997 { return -1. }
                                                return 2097.
                                            }
                                        } else {
                                            if slot <= 33000 {
                                                if slot < 32998 or slot > 33000 { return -1. }
                                                return 2098.
                                            } else {
                                                if slot <= 33007 {
                                                    if slot < 33001 or slot > 33007 { return -1. }
                                                    return 2099.
                                                } else {
                                                    if slot < 33008 or slot > 33009 { return -1. }
                                                    return 2100.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33025 {
                                        if slot <= 33013 {
                                            if slot <= 33011 {
                                                if slot < 33010 or slot > 33011 { return -1. }
                                                return 2101.
                                            } else {
                                                if slot < 33012 or slot > 33013 { return -1. }
                                                return 2102.
                                            }
                                        } else {
                                            if slot <= 33019 {
                                                if slot < 33014 or slot > 33019 { return -1. }
                                                return 2103.
                                            } else {
                                                if slot <= 33021 {
                                                    if slot < 33020 or slot > 33021 { return -1. }
                                                    return 2104.
                                                } else {
                                                    if slot < 33022 or slot > 33025 { return -1. }
                                                    return 2105.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33040 {
                                            if slot <= 33031 {
                                                if slot < 33026 or slot > 33031 { return -1. }
                                                return 2106.
                                            } else {
                                                if slot <= 33036 {
                                                    if slot < 33032 or slot > 33036 { return -1. }
                                                    return 2107.
                                                } else {
                                                    if slot < 33037 or slot > 33040 { return -1. }
                                                    return 2108.
                                                }
                                            }
                                        } else {
                                            if slot <= 33045 {
                                                if slot < 33041 or slot > 33045 { return -1. }
                                                return 2109.
                                            } else {
                                                if slot <= 33068 {
                                                    if slot < 33046 or slot > 33068 { return -1. }
                                                    return 2110.
                                                } else {
                                                    if slot < 33069 or slot > 33099 { return -1. }
                                                    return 2111.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 33183 {
                                if slot <= 33148 {
                                    if slot <= 33135 {
                                        if slot <= 33129 {
                                            if slot <= 33103 {
                                                if slot < 33100 or slot > 33103 { return -1. }
                                                return 2112.
                                            } else {
                                                if slot < 33104 or slot > 33129 { return -1. }
                                                return 2113.
                                            }
                                        } else {
                                            if slot <= 33131 {
                                                if slot < 33130 or slot > 33131 { return -1. }
                                                return 2114.
                                            } else {
                                                if slot <= 33133 {
                                                    if slot < 33132 or slot > 33133 { return -1. }
                                                    return 2115.
                                                } else {
                                                    if slot < 33134 or slot > 33135 { return -1. }
                                                    return 2116.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33141 {
                                            if slot <= 33137 {
                                                if slot < 33136 or slot > 33137 { return -1. }
                                                return 2117.
                                            } else {
                                                if slot < 33138 or slot > 33141 { return -1. }
                                                return 2118.
                                            }
                                        } else {
                                            if slot <= 33144 {
                                                if slot < 33142 or slot > 33144 { return -1. }
                                                return 2119.
                                            } else {
                                                if slot <= 33146 {
                                                    if slot < 33145 or slot > 33146 { return -1. }
                                                    return 2120.
                                                } else {
                                                    if slot < 33147 or slot > 33148 { return -1. }
                                                    return 2121.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33169 {
                                        if slot <= 33158 {
                                            if slot <= 33154 {
                                                if slot < 33149 or slot > 33154 { return -1. }
                                                return 2122.
                                            } else {
                                                if slot < 33155 or slot > 33158 { return -1. }
                                                return 2123.
                                            }
                                        } else {
                                            if slot <= 33161 {
                                                if slot < 33159 or slot > 33161 { return -1. }
                                                return 2124.
                                            } else {
                                                if slot <= 33167 {
                                                    if slot < 33162 or slot > 33167 { return -1. }
                                                    return 2125.
                                                } else {
                                                    if slot < 33168 or slot > 33169 { return -1. }
                                                    return 2126.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33177 {
                                            if slot <= 33172 {
                                                if slot < 33170 or slot > 33172 { return -1. }
                                                return 2127.
                                            } else {
                                                if slot <= 33175 {
                                                    if slot < 33173 or slot > 33175 { return -1. }
                                                    return 2128.
                                                } else {
                                                    if slot < 33176 or slot > 33177 { return -1. }
                                                    return 2129.
                                                }
                                            }
                                        } else {
                                            if slot <= 33179 {
                                                if slot < 33178 or slot > 33179 { return -1. }
                                                return 2130.
                                            } else {
                                                if slot <= 33181 {
                                                    if slot < 33180 or slot > 33181 { return -1. }
                                                    return 2131.
                                                } else {
                                                    if slot < 33182 or slot > 33183 { return -1. }
                                                    return 2132.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 33278 {
                                    if slot <= 33241 {
                                        if slot <= 33224 {
                                            if slot <= 33187 {
                                                if slot < 33184 or slot > 33187 { return -1. }
                                                return 2133.
                                            } else {
                                                if slot < 33188 or slot > 33224 { return -1. }
                                                return 2134.
                                            }
                                        } else {
                                            if slot <= 33228 {
                                                if slot < 33225 or slot > 33228 { return -1. }
                                                return 2135.
                                            } else {
                                                if slot <= 33239 {
                                                    if slot < 33229 or slot > 33239 { return -1. }
                                                    return 2136.
                                                } else {
                                                    if slot < 33240 or slot > 33241 { return -1. }
                                                    return 2137.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33265 {
                                            if slot <= 33260 {
                                                if slot < 33242 or slot > 33260 { return -1. }
                                                return 2138.
                                            } else {
                                                if slot < 33261 or slot > 33265 { return -1. }
                                                return 2139.
                                            }
                                        } else {
                                            if slot <= 33271 {
                                                if slot < 33266 or slot > 33271 { return -1. }
                                                return 2140.
                                            } else {
                                                if slot <= 33276 {
                                                    if slot < 33272 or slot > 33276 { return -1. }
                                                    return 2141.
                                                } else {
                                                    if slot < 33277 or slot > 33278 { return -1. }
                                                    return 2142.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33300 {
                                        if slot <= 33284 {
                                            if slot <= 33282 {
                                                if slot < 33279 or slot > 33282 { return -1. }
                                                return 2143.
                                            } else {
                                                if slot < 33283 or slot > 33284 { return -1. }
                                                return 2144.
                                            }
                                        } else {
                                            if slot <= 33289 {
                                                if slot < 33285 or slot > 33289 { return -1. }
                                                return 2145.
                                            } else {
                                                if slot <= 33298 {
                                                    if slot < 33290 or slot > 33298 { return -1. }
                                                    return 2146.
                                                } else {
                                                    if slot < 33299 or slot > 33300 { return -1. }
                                                    return 2147.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33311 {
                                            if slot <= 33301 {
                                                if slot < 33301 or slot > 33301 { return -1. }
                                                return 2148.
                                            } else {
                                                if slot <= 33305 {
                                                    if slot < 33302 or slot > 33305 { return -1. }
                                                    return 2149.
                                                } else {
                                                    if slot < 33306 or slot > 33311 { return -1. }
                                                    return 2150.
                                                }
                                            }
                                        } else {
                                            if slot <= 33314 {
                                                if slot < 33312 or slot > 33314 { return -1. }
                                                return 2151.
                                            } else {
                                                if slot <= 33318 {
                                                    if slot < 33315 or slot > 33318 { return -1. }
                                                    return 2152.
                                                } else {
                                                    if slot < 33319 or slot > 33322 { return -1. }
                                                    return 2153.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 33876 {
                        if slot <= 33570 {
                            if slot <= 33445 {
                                if slot <= 33369 {
                                    if slot <= 33338 {
                                        if slot <= 33328 {
                                            if slot <= 33325 {
                                                if slot < 33323 or slot > 33325 { return -1. }
                                                return 2154.
                                            } else {
                                                if slot < 33326 or slot > 33328 { return -1. }
                                                return 2155.
                                            }
                                        } else {
                                            if slot <= 33333 {
                                                if slot < 33329 or slot > 33333 { return -1. }
                                                return 2156.
                                            } else {
                                                if slot <= 33335 {
                                                    if slot < 33334 or slot > 33335 { return -1. }
                                                    return 2157.
                                                } else {
                                                    if slot < 33336 or slot > 33338 { return -1. }
                                                    return 2158.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33353 {
                                            if slot <= 33344 {
                                                if slot < 33339 or slot > 33344 { return -1. }
                                                return 2159.
                                            } else {
                                                if slot < 33345 or slot > 33353 { return -1. }
                                                return 2160.
                                            }
                                        } else {
                                            if slot <= 33362 {
                                                if slot < 33354 or slot > 33362 { return -1. }
                                                return 2161.
                                            } else {
                                                if slot <= 33365 {
                                                    if slot < 33363 or slot > 33365 { return -1. }
                                                    return 2162.
                                                } else {
                                                    if slot < 33366 or slot > 33369 { return -1. }
                                                    return 2163.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33423 {
                                        if slot <= 33392 {
                                            if slot <= 33384 {
                                                if slot < 33383 or slot > 33384 { return -1. }
                                                return 2164.
                                            } else {
                                                if slot < 33385 or slot > 33392 { return -1. }
                                                return 2165.
                                            }
                                        } else {
                                            if slot <= 33413 {
                                                if slot < 33393 or slot > 33413 { return -1. }
                                                return 2166.
                                            } else {
                                                if slot <= 33416 {
                                                    if slot < 33414 or slot > 33416 { return -1. }
                                                    return 2167.
                                                } else {
                                                    if slot < 33417 or slot > 33423 { return -1. }
                                                    return 2168.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33434 {
                                            if slot <= 33425 {
                                                if slot < 33424 or slot > 33425 { return -1. }
                                                return 2169.
                                            } else {
                                                if slot < 33426 or slot > 33434 { return -1. }
                                                return 2170.
                                            }
                                        } else {
                                            if slot <= 33439 {
                                                if slot < 33435 or slot > 33439 { return -1. }
                                                return 2171.
                                            } else {
                                                if slot <= 33443 {
                                                    if slot < 33440 or slot > 33443 { return -1. }
                                                    return 2172.
                                                } else {
                                                    if slot < 33444 or slot > 33445 { return -1. }
                                                    return 2173.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 33507 {
                                    if slot <= 33487 {
                                        if slot <= 33463 {
                                            if slot <= 33449 {
                                                if slot < 33446 or slot > 33449 { return -1. }
                                                return 2174.
                                            } else {
                                                if slot < 33450 or slot > 33463 { return -1. }
                                                return 2175.
                                            }
                                        } else {
                                            if slot <= 33469 {
                                                if slot < 33464 or slot > 33469 { return -1. }
                                                return 2176.
                                            } else {
                                                if slot <= 33484 {
                                                    if slot < 33470 or slot > 33484 { return -1. }
                                                    return 2177.
                                                } else {
                                                    if slot < 33485 or slot > 33487 { return -1. }
                                                    return 2178.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33496 {
                                            if slot <= 33489 {
                                                if slot < 33488 or slot > 33489 { return -1. }
                                                return 2179.
                                            } else {
                                                if slot < 33490 or slot > 33496 { return -1. }
                                                return 2180.
                                            }
                                        } else {
                                            if slot <= 33499 {
                                                if slot < 33497 or slot > 33499 { return -1. }
                                                return 2181.
                                            } else {
                                                if slot <= 33504 {
                                                    if slot < 33500 or slot > 33504 { return -1. }
                                                    return 2182.
                                                } else {
                                                    if slot < 33505 or slot > 33507 { return -1. }
                                                    return 2183.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33541 {
                                        if slot <= 33518 {
                                            if slot <= 33511 {
                                                if slot < 33508 or slot > 33511 { return -1. }
                                                return 2184.
                                            } else {
                                                if slot < 33512 or slot > 33518 { return -1. }
                                                return 2185.
                                            }
                                        } else {
                                            if slot <= 33529 {
                                                if slot < 33519 or slot > 33529 { return -1. }
                                                return 2186.
                                            } else {
                                                if slot <= 33532 {
                                                    if slot < 33530 or slot > 33532 { return -1. }
                                                    return 2187.
                                                } else {
                                                    if slot < 33533 or slot > 33541 { return -1. }
                                                    return 2188.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33553 {
                                            if slot <= 33543 {
                                                if slot < 33542 or slot > 33543 { return -1. }
                                                return 2189.
                                            } else {
                                                if slot <= 33545 {
                                                    if slot < 33544 or slot > 33545 { return -1. }
                                                    return 2190.
                                                } else {
                                                    if slot < 33546 or slot > 33553 { return -1. }
                                                    return 2191.
                                                }
                                            }
                                        } else {
                                            if slot <= 33565 {
                                                if slot < 33554 or slot > 33565 { return -1. }
                                                return 2192.
                                            } else {
                                                if slot <= 33567 {
                                                    if slot < 33566 or slot > 33567 { return -1. }
                                                    return 2193.
                                                } else {
                                                    if slot < 33568 or slot > 33570 { return -1. }
                                                    return 2194.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 33691 {
                                if slot <= 33616 {
                                    if slot <= 33596 {
                                        if slot <= 33577 {
                                            if slot <= 33573 {
                                                if slot < 33571 or slot > 33573 { return -1. }
                                                return 2195.
                                            } else {
                                                if slot < 33574 or slot > 33577 { return -1. }
                                                return 2196.
                                            }
                                        } else {
                                            if slot <= 33584 {
                                                if slot < 33578 or slot > 33584 { return -1. }
                                                return 2197.
                                            } else {
                                                if slot <= 33594 {
                                                    if slot < 33585 or slot > 33594 { return -1. }
                                                    return 2198.
                                                } else {
                                                    if slot < 33595 or slot > 33596 { return -1. }
                                                    return 2199.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33603 {
                                            if slot <= 33601 {
                                                if slot < 33597 or slot > 33601 { return -1. }
                                                return 2200.
                                            } else {
                                                if slot < 33602 or slot > 33603 { return -1. }
                                                return 2201.
                                            }
                                        } else {
                                            if slot <= 33606 {
                                                if slot < 33604 or slot > 33606 { return -1. }
                                                return 2202.
                                            } else {
                                                if slot <= 33608 {
                                                    if slot < 33607 or slot > 33608 { return -1. }
                                                    return 2203.
                                                } else {
                                                    if slot < 33609 or slot > 33616 { return -1. }
                                                    return 2204.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33629 {
                                        if slot <= 33623 {
                                            if slot <= 33621 {
                                                if slot < 33617 or slot > 33621 { return -1. }
                                                return 2205.
                                            } else {
                                                if slot < 33622 or slot > 33623 { return -1. }
                                                return 2206.
                                            }
                                        } else {
                                            if slot <= 33625 {
                                                if slot < 33624 or slot > 33625 { return -1. }
                                                return 2207.
                                            } else {
                                                if slot <= 33627 {
                                                    if slot < 33626 or slot > 33627 { return -1. }
                                                    return 2208.
                                                } else {
                                                    if slot < 33628 or slot > 33629 { return -1. }
                                                    return 2209.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33640 {
                                            if slot <= 33631 {
                                                if slot < 33630 or slot > 33631 { return -1. }
                                                return 2210.
                                            } else {
                                                if slot <= 33635 {
                                                    if slot < 33632 or slot > 33635 { return -1. }
                                                    return 2211.
                                                } else {
                                                    if slot < 33636 or slot > 33640 { return -1. }
                                                    return 2212.
                                                }
                                            }
                                        } else {
                                            if slot <= 33644 {
                                                if slot < 33641 or slot > 33644 { return -1. }
                                                return 2213.
                                            } else {
                                                if slot <= 33671 {
                                                    if slot < 33645 or slot > 33671 { return -1. }
                                                    return 2214.
                                                } else {
                                                    if slot < 33672 or slot > 33691 { return -1. }
                                                    return 2215.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 33752 {
                                    if slot <= 33721 {
                                        if slot <= 33701 {
                                            if slot <= 33698 {
                                                if slot < 33692 or slot > 33698 { return -1. }
                                                return 2216.
                                            } else {
                                                if slot < 33699 or slot > 33701 { return -1. }
                                                return 2217.
                                            }
                                        } else {
                                            if slot <= 33714 {
                                                if slot < 33702 or slot > 33714 { return -1. }
                                                return 2218.
                                            } else {
                                                if slot <= 33717 {
                                                    if slot < 33715 or slot > 33717 { return -1. }
                                                    return 2219.
                                                } else {
                                                    if slot < 33718 or slot > 33721 { return -1. }
                                                    return 2220.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33736 {
                                            if slot <= 33734 {
                                                if slot < 33722 or slot > 33734 { return -1. }
                                                return 2221.
                                            } else {
                                                if slot < 33735 or slot > 33736 { return -1. }
                                                return 2222.
                                            }
                                        } else {
                                            if slot <= 33738 {
                                                if slot < 33737 or slot > 33738 { return -1. }
                                                return 2223.
                                            } else {
                                                if slot <= 33740 {
                                                    if slot < 33739 or slot > 33740 { return -1. }
                                                    return 2224.
                                                } else {
                                                    if slot < 33741 or slot > 33752 { return -1. }
                                                    return 2225.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33819 {
                                        if slot <= 33766 {
                                            if slot <= 33755 {
                                                if slot < 33753 or slot > 33755 { return -1. }
                                                return 2226.
                                            } else {
                                                if slot < 33756 or slot > 33766 { return -1. }
                                                return 2227.
                                            }
                                        } else {
                                            if slot <= 33795 {
                                                if slot < 33794 or slot > 33795 { return -1. }
                                                return 2228.
                                            } else {
                                                if slot <= 33814 {
                                                    if slot < 33796 or slot > 33814 { return -1. }
                                                    return 2229.
                                                } else {
                                                    if slot < 33815 or slot > 33819 { return -1. }
                                                    return 2230.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33855 {
                                            if slot <= 33846 {
                                                if slot < 33820 or slot > 33846 { return -1. }
                                                return 2231.
                                            } else {
                                                if slot <= 33848 {
                                                    if slot < 33847 or slot > 33848 { return -1. }
                                                    return 2232.
                                                } else {
                                                    if slot < 33849 or slot > 33855 { return -1. }
                                                    return 2233.
                                                }
                                            }
                                        } else {
                                            if slot <= 33864 {
                                                if slot < 33856 or slot > 33864 { return -1. }
                                                return 2234.
                                            } else {
                                                if slot <= 33870 {
                                                    if slot < 33865 or slot > 33870 { return -1. }
                                                    return 2235.
                                                } else {
                                                    if slot < 33871 or slot > 33876 { return -1. }
                                                    return 2236.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 34531 {
                            if slot <= 34036 {
                                if slot <= 33980 {
                                    if slot <= 33908 {
                                        if slot <= 33889 {
                                            if slot <= 33879 {
                                                if slot < 33877 or slot > 33879 { return -1. }
                                                return 2237.
                                            } else {
                                                if slot < 33880 or slot > 33889 { return -1. }
                                                return 2238.
                                            }
                                        } else {
                                            if slot <= 33895 {
                                                if slot < 33890 or slot > 33895 { return -1. }
                                                return 2239.
                                            } else {
                                                if slot <= 33904 {
                                                    if slot < 33896 or slot > 33904 { return -1. }
                                                    return 2240.
                                                } else {
                                                    if slot < 33905 or slot > 33908 { return -1. }
                                                    return 2241.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33941 {
                                            if slot <= 33911 {
                                                if slot < 33909 or slot > 33911 { return -1. }
                                                return 2242.
                                            } else {
                                                if slot < 33912 or slot > 33941 { return -1. }
                                                return 2243.
                                            }
                                        } else {
                                            if slot <= 33948 {
                                                if slot < 33942 or slot > 33948 { return -1. }
                                                return 2244.
                                            } else {
                                                if slot <= 33977 {
                                                    if slot < 33949 or slot > 33977 { return -1. }
                                                    return 2245.
                                                } else {
                                                    if slot < 33978 or slot > 33980 { return -1. }
                                                    return 2246.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34020 {
                                        if slot <= 33994 {
                                            if slot <= 33992 {
                                                if slot < 33985 or slot > 33992 { return -1. }
                                                return 2247.
                                            } else {
                                                if slot < 33993 or slot > 33994 { return -1. }
                                                return 2248.
                                            }
                                        } else {
                                            if slot <= 34003 {
                                                if slot < 33995 or slot > 34003 { return -1. }
                                                return 2249.
                                            } else {
                                                if slot <= 34008 {
                                                    if slot < 34004 or slot > 34008 { return -1. }
                                                    return 2250.
                                                } else {
                                                    if slot < 34009 or slot > 34020 { return -1. }
                                                    return 2251.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 34029 {
                                            if slot <= 34024 {
                                                if slot < 34021 or slot > 34024 { return -1. }
                                                return 2252.
                                            } else {
                                                if slot < 34025 or slot > 34029 { return -1. }
                                                return 2253.
                                            }
                                        } else {
                                            if slot <= 34031 {
                                                if slot < 34030 or slot > 34031 { return -1. }
                                                return 2254.
                                            } else {
                                                if slot <= 34034 {
                                                    if slot < 34032 or slot > 34034 { return -1. }
                                                    return 2255.
                                                } else {
                                                    if slot < 34035 or slot > 34036 { return -1. }
                                                    return 2256.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 34179 {
                                    if slot <= 34104 {
                                        if slot <= 34086 {
                                            if slot <= 34044 {
                                                if slot < 34037 or slot > 34044 { return -1. }
                                                return 2257.
                                            } else {
                                                if slot < 34045 or slot > 34086 { return -1. }
                                                return 2258.
                                            }
                                        } else {
                                            if slot <= 34092 {
                                                if slot < 34087 or slot > 34092 { return -1. }
                                                return 2259.
                                            } else {
                                                if slot <= 34101 {
                                                    if slot < 34093 or slot > 34101 { return -1. }
                                                    return 2260.
                                                } else {
                                                    if slot < 34102 or slot > 34104 { return -1. }
                                                    return 2261.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 34140 {
                                            if slot <= 34115 {
                                                if slot < 34112 or slot > 34115 { return -1. }
                                                return 2262.
                                            } else {
                                                if slot < 34116 or slot > 34140 { return -1. }
                                                return 2263.
                                            }
                                        } else {
                                            if slot <= 34160 {
                                                if slot < 34141 or slot > 34160 { return -1. }
                                                return 2264.
                                            } else {
                                                if slot <= 34173 {
                                                    if slot < 34161 or slot > 34173 { return -1. }
                                                    return 2265.
                                                } else {
                                                    if slot < 34174 or slot > 34179 { return -1. }
                                                    return 2266.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34341 {
                                        if slot <= 34320 {
                                            if slot <= 34298 {
                                                if slot < 34180 or slot > 34298 { return -1. }
                                                return 2267.
                                            } else {
                                                if slot < 34299 or slot > 34320 { return -1. }
                                                return 2268.
                                            }
                                        } else {
                                            if slot <= 34323 {
                                                if slot < 34321 or slot > 34323 { return -1. }
                                                return 2269.
                                            } else {
                                                if slot <= 34330 {
                                                    if slot < 34324 or slot > 34330 { return -1. }
                                                    return 2270.
                                                } else {
                                                    if slot < 34331 or slot > 34341 { return -1. }
                                                    return 2271.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 34381 {
                                            if slot <= 34346 {
                                                if slot < 34342 or slot > 34346 { return -1. }
                                                return 2272.
                                            } else {
                                                if slot <= 34347 {
                                                    if slot < 34347 or slot > 34347 { return -1. }
                                                    return 2273.
                                                } else {
                                                    if slot < 34379 or slot > 34381 { return -1. }
                                                    return 2274.
                                                }
                                            }
                                        } else {
                                            if slot <= 34412 {
                                                if slot < 34382 or slot > 34412 { return -1. }
                                                return 2275.
                                            } else {
                                                if slot <= 34509 {
                                                    if slot < 34413 or slot > 34509 { return -1. }
                                                    return 2276.
                                                } else {
                                                    if slot < 34510 or slot > 34531 { return -1. }
                                                    return 2277.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 34869 {
                                if slot <= 34731 {
                                    if slot <= 34588 {
                                        if slot <= 34558 {
                                            if slot <= 34551 {
                                                if slot < 34532 or slot > 34551 { return -1. }
                                                return 2278.
                                            } else {
                                                if slot < 34552 or slot > 34558 { return -1. }
                                                return 2279.
                                            }
                                        } else {
                                            if slot <= 34563 {
                                                if slot < 34559 or slot > 34563 { return -1. }
                                                return 2280.
                                            } else {
                                                if slot <= 34573 {
                                                    if slot < 34568 or slot > 34573 { return -1. }
                                                    return 2281.
                                                } else {
                                                    if slot < 34574 or slot > 34588 { return -1. }
                                                    return 2282.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 34636 {
                                            if slot <= 34608 {
                                                if slot < 34589 or slot > 34608 { return -1. }
                                                return 2283.
                                            } else {
                                                if slot < 34609 or slot > 34636 { return -1. }
                                                return 2284.
                                            }
                                        } else {
                                            if slot <= 34656 {
                                                if slot < 34637 or slot > 34656 { return -1. }
                                                return 2285.
                                            } else {
                                                if slot <= 34707 {
                                                    if slot < 34657 or slot > 34707 { return -1. }
                                                    return 2286.
                                                } else {
                                                    if slot < 34708 or slot > 34731 { return -1. }
                                                    return 2287.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34757 {
                                        if slot <= 34745 {
                                            if slot <= 34734 {
                                                if slot < 34733 or slot > 34734 { return -1. }
                                                return 2288.
                                            } else {
                                                if slot < 34735 or slot > 34745 { return -1. }
                                                return 2289.
                                            }
                                        } else {
                                            if slot <= 34747 {
                                                if slot < 34746 or slot > 34747 { return -1. }
                                                return 2290.
                                            } else {
                                                if slot <= 34749 {
                                                    if slot < 34748 or slot > 34749 { return -1. }
                                                    return 2291.
                                                } else {
                                                    if slot < 34750 or slot > 34757 { return -1. }
                                                    return 2292.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 34811 {
                                            if slot <= 34760 {
                                                if slot < 34758 or slot > 34760 { return -1. }
                                                return 2293.
                                            } else {
                                                if slot <= 34810 {
                                                    if slot < 34761 or slot > 34810 { return -1. }
                                                    return 2294.
                                                } else {
                                                    if slot < 34811 or slot > 34811 { return -1. }
                                                    return 2295.
                                                }
                                            }
                                        } else {
                                            if slot <= 34819 {
                                                if slot < 34816 or slot > 34819 { return -1. }
                                                return 2296.
                                            } else {
                                                if slot <= 34824 {
                                                    if slot < 34820 or slot > 34824 { return -1. }
                                                    return 2297.
                                                } else {
                                                    if slot < 34825 or slot > 34869 { return -1. }
                                                    return 2298.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 34987 {
                                    if slot <= 34928 {
                                        if slot <= 34877 {
                                            if slot <= 34872 {
                                                if slot < 34870 or slot > 34872 { return -1. }
                                                return 2299.
                                            } else {
                                                if slot < 34873 or slot > 34877 { return -1. }
                                                return 2300.
                                            }
                                        } else {
                                            if slot <= 34893 {
                                                if slot < 34879 or slot > 34893 { return -1. }
                                                return 2301.
                                            } else {
                                                if slot <= 34926 {
                                                    if slot < 34894 or slot > 34926 { return -1. }
                                                    return 2302.
                                                } else {
                                                    if slot < 34927 or slot > 34928 { return -1. }
                                                    return 2303.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 34963 {
                                            if slot <= 34952 {
                                                if slot < 34929 or slot > 34952 { return -1. }
                                                return 2304.
                                            } else {
                                                if slot < 34953 or slot > 34963 { return -1. }
                                                return 2305.
                                            }
                                        } else {
                                            if slot <= 34971 {
                                                if slot < 34964 or slot > 34971 { return -1. }
                                                return 2306.
                                            } else {
                                                if slot <= 34984 {
                                                    if slot < 34972 or slot > 34984 { return -1. }
                                                    return 2307.
                                                } else {
                                                    if slot < 34985 or slot > 34987 { return -1. }
                                                    return 2308.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35018 {
                                        if slot <= 35006 {
                                            if slot <= 35002 {
                                                if slot < 34988 or slot > 35002 { return -1. }
                                                return 2309.
                                            } else {
                                                if slot < 35003 or slot > 35006 { return -1. }
                                                return 2310.
                                            }
                                        } else {
                                            if slot <= 35013 {
                                                if slot < 35007 or slot > 35013 { return -1. }
                                                return 2311.
                                            } else {
                                                if slot <= 35016 {
                                                    if slot < 35014 or slot > 35016 { return -1. }
                                                    return 2312.
                                                } else {
                                                    if slot < 35017 or slot > 35018 { return -1. }
                                                    return 2313.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35046 {
                                            if slot <= 35027 {
                                                if slot < 35019 or slot > 35027 { return -1. }
                                                return 2314.
                                            } else {
                                                if slot <= 35029 {
                                                    if slot < 35028 or slot > 35029 { return -1. }
                                                    return 2315.
                                                } else {
                                                    if slot < 35030 or slot > 35046 { return -1. }
                                                    return 2316.
                                                }
                                            }
                                        } else {
                                            if slot <= 35051 {
                                                if slot < 35047 or slot > 35051 { return -1. }
                                                return 2317.
                                            } else {
                                                if slot <= 35072 {
                                                    if slot < 35052 or slot > 35072 { return -1. }
                                                    return 2318.
                                                } else {
                                                    if slot < 35073 or slot > 35086 { return -1. }
                                                    return 2319.
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
                if slot <= 36820 {
                    if slot <= 36018 {
                        if slot <= 35421 {
                            if slot <= 35288 {
                                if slot <= 35186 {
                                    if slot <= 35170 {
                                        if slot <= 35109 {
                                            if slot <= 35102 {
                                                if slot < 35087 or slot > 35102 { return -1. }
                                                return 2320.
                                            } else {
                                                if slot < 35103 or slot > 35109 { return -1. }
                                                return 2321.
                                            }
                                        } else {
                                            if slot <= 35132 {
                                                if slot < 35110 or slot > 35132 { return -1. }
                                                return 2322.
                                            } else {
                                                if slot <= 35151 {
                                                    if slot < 35133 or slot > 35151 { return -1. }
                                                    return 2323.
                                                } else {
                                                    if slot < 35152 or slot > 35170 { return -1. }
                                                    return 2324.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35175 {
                                            if slot <= 35172 {
                                                if slot < 35171 or slot > 35172 { return -1. }
                                                return 2325.
                                            } else {
                                                if slot < 35173 or slot > 35175 { return -1. }
                                                return 2326.
                                            }
                                        } else {
                                            if slot <= 35180 {
                                                if slot < 35176 or slot > 35180 { return -1. }
                                                return 2327.
                                            } else {
                                                if slot <= 35184 {
                                                    if slot < 35181 or slot > 35184 { return -1. }
                                                    return 2328.
                                                } else {
                                                    if slot < 35185 or slot > 35186 { return -1. }
                                                    return 2329.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35239 {
                                        if slot <= 35200 {
                                            if slot <= 35191 {
                                                if slot < 35187 or slot > 35191 { return -1. }
                                                return 2330.
                                            } else {
                                                if slot < 35192 or slot > 35200 { return -1. }
                                                return 2331.
                                            }
                                        } else {
                                            if slot <= 35206 {
                                                if slot < 35201 or slot > 35206 { return -1. }
                                                return 2332.
                                            } else {
                                                if slot <= 35212 {
                                                    if slot < 35207 or slot > 35212 { return -1. }
                                                    return 2333.
                                                } else {
                                                    if slot < 35213 or slot > 35239 { return -1. }
                                                    return 2334.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35253 {
                                            if slot <= 35250 {
                                                if slot < 35240 or slot > 35250 { return -1. }
                                                return 2335.
                                            } else {
                                                if slot < 35251 or slot > 35253 { return -1. }
                                                return 2336.
                                            }
                                        } else {
                                            if slot <= 35262 {
                                                if slot < 35254 or slot > 35262 { return -1. }
                                                return 2337.
                                            } else {
                                                if slot <= 35267 {
                                                    if slot < 35263 or slot > 35267 { return -1. }
                                                    return 2338.
                                                } else {
                                                    if slot < 35268 or slot > 35288 { return -1. }
                                                    return 2339.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 35337 {
                                    if slot <= 35314 {
                                        if slot <= 35302 {
                                            if slot <= 35296 {
                                                if slot < 35289 or slot > 35296 { return -1. }
                                                return 2340.
                                            } else {
                                                if slot < 35297 or slot > 35302 { return -1. }
                                                return 2341.
                                            }
                                        } else {
                                            if slot <= 35306 {
                                                if slot < 35303 or slot > 35306 { return -1. }
                                                return 2342.
                                            } else {
                                                if slot <= 35309 {
                                                    if slot < 35307 or slot > 35309 { return -1. }
                                                    return 2343.
                                                } else {
                                                    if slot < 35310 or slot > 35314 { return -1. }
                                                    return 2344.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35322 {
                                            if slot <= 35320 {
                                                if slot < 35315 or slot > 35320 { return -1. }
                                                return 2345.
                                            } else {
                                                if slot < 35321 or slot > 35322 { return -1. }
                                                return 2346.
                                            }
                                        } else {
                                            if slot <= 35327 {
                                                if slot < 35323 or slot > 35327 { return -1. }
                                                return 2347.
                                            } else {
                                                if slot <= 35335 {
                                                    if slot < 35328 or slot > 35335 { return -1. }
                                                    return 2348.
                                                } else {
                                                    if slot < 35336 or slot > 35337 { return -1. }
                                                    return 2349.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35380 {
                                        if slot <= 35364 {
                                            if slot <= 35341 {
                                                if slot < 35338 or slot > 35341 { return -1. }
                                                return 2350.
                                            } else {
                                                if slot < 35342 or slot > 35364 { return -1. }
                                                return 2351.
                                            }
                                        } else {
                                            if slot <= 35375 {
                                                if slot < 35365 or slot > 35375 { return -1. }
                                                return 2352.
                                            } else {
                                                if slot <= 35377 {
                                                    if slot < 35376 or slot > 35377 { return -1. }
                                                    return 2353.
                                                } else {
                                                    if slot < 35378 or slot > 35380 { return -1. }
                                                    return 2354.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35402 {
                                            if slot <= 35389 {
                                                if slot < 35381 or slot > 35389 { return -1. }
                                                return 2355.
                                            } else {
                                                if slot <= 35391 {
                                                    if slot < 35390 or slot > 35391 { return -1. }
                                                    return 2356.
                                                } else {
                                                    if slot < 35392 or slot > 35402 { return -1. }
                                                    return 2357.
                                                }
                                            }
                                        } else {
                                            if slot <= 35405 {
                                                if slot < 35403 or slot > 35405 { return -1. }
                                                return 2358.
                                            } else {
                                                if slot <= 35414 {
                                                    if slot < 35406 or slot > 35414 { return -1. }
                                                    return 2359.
                                                } else {
                                                    if slot < 35415 or slot > 35421 { return -1. }
                                                    return 2360.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 35700 {
                                if slot <= 35567 {
                                    if slot <= 35487 {
                                        if slot <= 35431 {
                                            if slot <= 35426 {
                                                if slot < 35422 or slot > 35426 { return -1. }
                                                return 2361.
                                            } else {
                                                if slot < 35427 or slot > 35431 { return -1. }
                                                return 2362.
                                            }
                                        } else {
                                            if slot <= 35455 {
                                                if slot < 35432 or slot > 35455 { return -1. }
                                                return 2363.
                                            } else {
                                                if slot <= 35482 {
                                                    if slot < 35456 or slot > 35482 { return -1. }
                                                    return 2364.
                                                } else {
                                                    if slot < 35483 or slot > 35487 { return -1. }
                                                    return 2365.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35534 {
                                            if slot <= 35505 {
                                                if slot < 35488 or slot > 35505 { return -1. }
                                                return 2366.
                                            } else {
                                                if slot < 35506 or slot > 35534 { return -1. }
                                                return 2367.
                                            }
                                        } else {
                                            if slot <= 35537 {
                                                if slot < 35535 or slot > 35537 { return -1. }
                                                return 2368.
                                            } else {
                                                if slot <= 35561 {
                                                    if slot < 35538 or slot > 35561 { return -1. }
                                                    return 2369.
                                                } else {
                                                    if slot < 35562 or slot > 35567 { return -1. }
                                                    return 2370.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35616 {
                                        if slot <= 35578 {
                                            if slot <= 35573 {
                                                if slot < 35568 or slot > 35573 { return -1. }
                                                return 2371.
                                            } else {
                                                if slot < 35574 or slot > 35578 { return -1. }
                                                return 2372.
                                            }
                                        } else {
                                            if slot <= 35587 {
                                                if slot < 35579 or slot > 35587 { return -1. }
                                                return 2373.
                                            } else {
                                                if slot <= 35597 {
                                                    if slot < 35588 or slot > 35597 { return -1. }
                                                    return 2374.
                                                } else {
                                                    if slot < 35598 or slot > 35616 { return -1. }
                                                    return 2375.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35646 {
                                            if slot <= 35617 {
                                                if slot < 35617 or slot > 35617 { return -1. }
                                                return 2376.
                                            } else {
                                                if slot <= 35626 {
                                                    if slot < 35618 or slot > 35626 { return -1. }
                                                    return 2377.
                                                } else {
                                                    if slot < 35627 or slot > 35646 { return -1. }
                                                    return 2378.
                                                }
                                            }
                                        } else {
                                            if slot <= 35652 {
                                                if slot < 35647 or slot > 35652 { return -1. }
                                                return 2379.
                                            } else {
                                                if slot <= 35675 {
                                                    if slot < 35653 or slot > 35675 { return -1. }
                                                    return 2380.
                                                } else {
                                                    if slot < 35676 or slot > 35700 { return -1. }
                                                    return 2381.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 35785 {
                                    if slot <= 35758 {
                                        if slot <= 35707 {
                                            if slot <= 35702 {
                                                if slot < 35701 or slot > 35702 { return -1. }
                                                return 2382.
                                            } else {
                                                if slot < 35703 or slot > 35707 { return -1. }
                                                return 2383.
                                            }
                                        } else {
                                            if slot <= 35714 {
                                                if slot < 35708 or slot > 35714 { return -1. }
                                                return 2384.
                                            } else {
                                                if slot <= 35747 {
                                                    if slot < 35715 or slot > 35747 { return -1. }
                                                    return 2385.
                                                } else {
                                                    if slot < 35748 or slot > 35758 { return -1. }
                                                    return 2386.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35767 {
                                            if slot <= 35761 {
                                                if slot < 35759 or slot > 35761 { return -1. }
                                                return 2387.
                                            } else {
                                                if slot < 35762 or slot > 35767 { return -1. }
                                                return 2388.
                                            }
                                        } else {
                                            if slot <= 35775 {
                                                if slot < 35772 or slot > 35775 { return -1. }
                                                return 2389.
                                            } else {
                                                if slot <= 35777 {
                                                    if slot < 35776 or slot > 35777 { return -1. }
                                                    return 2390.
                                                } else {
                                                    if slot < 35778 or slot > 35785 { return -1. }
                                                    return 2391.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35941 {
                                        if slot <= 35868 {
                                            if slot <= 35786 {
                                                if slot < 35786 or slot > 35786 { return -1. }
                                                return 2392.
                                            } else {
                                                if slot < 35840 or slot > 35868 { return -1. }
                                                return 2393.
                                            }
                                        } else {
                                            if slot <= 35882 {
                                                if slot < 35869 or slot > 35882 { return -1. }
                                                return 2394.
                                            } else {
                                                if slot <= 35917 {
                                                    if slot < 35883 or slot > 35917 { return -1. }
                                                    return 2395.
                                                } else {
                                                    if slot < 35918 or slot > 35941 { return -1. }
                                                    return 2396.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36000 {
                                            if slot <= 35943 {
                                                if slot < 35942 or slot > 35943 { return -1. }
                                                return 2397.
                                            } else {
                                                if slot <= 35984 {
                                                    if slot < 35944 or slot > 35984 { return -1. }
                                                    return 2398.
                                                } else {
                                                    if slot < 35985 or slot > 36000 { return -1. }
                                                    return 2399.
                                                }
                                            }
                                        } else {
                                            if slot <= 36010 {
                                                if slot < 36001 or slot > 36010 { return -1. }
                                                return 2400.
                                            } else {
                                                if slot <= 36012 {
                                                    if slot < 36011 or slot > 36012 { return -1. }
                                                    return 2401.
                                                } else {
                                                    if slot < 36013 or slot > 36018 { return -1. }
                                                    return 2402.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 36360 {
                            if slot <= 36188 {
                                if slot <= 36099 {
                                    if slot <= 36074 {
                                        if slot <= 36034 {
                                            if slot <= 36020 {
                                                if slot < 36019 or slot > 36020 { return -1. }
                                                return 2403.
                                            } else {
                                                if slot < 36021 or slot > 36034 { return -1. }
                                                return 2404.
                                            }
                                        } else {
                                            if slot <= 36044 {
                                                if slot < 36035 or slot > 36044 { return -1. }
                                                return 2405.
                                            } else {
                                                if slot <= 36070 {
                                                    if slot < 36045 or slot > 36070 { return -1. }
                                                    return 2406.
                                                } else {
                                                    if slot < 36071 or slot > 36074 { return -1. }
                                                    return 2407.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36083 {
                                            if slot <= 36078 {
                                                if slot < 36075 or slot > 36078 { return -1. }
                                                return 2408.
                                            } else {
                                                if slot < 36079 or slot > 36083 { return -1. }
                                                return 2409.
                                            }
                                        } else {
                                            if slot <= 36088 {
                                                if slot < 36084 or slot > 36088 { return -1. }
                                                return 2410.
                                            } else {
                                                if slot <= 36094 {
                                                    if slot < 36089 or slot > 36094 { return -1. }
                                                    return 2411.
                                                } else {
                                                    if slot < 36095 or slot > 36099 { return -1. }
                                                    return 2412.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36168 {
                                        if slot <= 36112 {
                                            if slot <= 36109 {
                                                if slot < 36100 or slot > 36109 { return -1. }
                                                return 2413.
                                            } else {
                                                if slot < 36110 or slot > 36112 { return -1. }
                                                return 2414.
                                            }
                                        } else {
                                            if slot <= 36156 {
                                                if slot < 36113 or slot > 36156 { return -1. }
                                                return 2415.
                                            } else {
                                                if slot <= 36160 {
                                                    if slot < 36157 or slot > 36160 { return -1. }
                                                    return 2416.
                                                } else {
                                                    if slot < 36161 or slot > 36168 { return -1. }
                                                    return 2417.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36174 {
                                            if slot <= 36172 {
                                                if slot < 36169 or slot > 36172 { return -1. }
                                                return 2418.
                                            } else {
                                                if slot < 36173 or slot > 36174 { return -1. }
                                                return 2419.
                                            }
                                        } else {
                                            if slot <= 36176 {
                                                if slot < 36175 or slot > 36176 { return -1. }
                                                return 2420.
                                            } else {
                                                if slot <= 36186 {
                                                    if slot < 36177 or slot > 36186 { return -1. }
                                                    return 2421.
                                                } else {
                                                    if slot < 36187 or slot > 36188 { return -1. }
                                                    return 2422.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 36266 {
                                    if slot <= 36215 {
                                        if slot <= 36198 {
                                            if slot <= 36195 {
                                                if slot < 36189 or slot > 36195 { return -1. }
                                                return 2423.
                                            } else {
                                                if slot < 36196 or slot > 36198 { return -1. }
                                                return 2424.
                                            }
                                        } else {
                                            if slot <= 36206 {
                                                if slot < 36199 or slot > 36206 { return -1. }
                                                return 2425.
                                            } else {
                                                if slot <= 36213 {
                                                    if slot < 36207 or slot > 36213 { return -1. }
                                                    return 2426.
                                                } else {
                                                    if slot < 36214 or slot > 36215 { return -1. }
                                                    return 2427.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36237 {
                                            if slot <= 36222 {
                                                if slot < 36216 or slot > 36222 { return -1. }
                                                return 2428.
                                            } else {
                                                if slot < 36223 or slot > 36237 { return -1. }
                                                return 2429.
                                            }
                                        } else {
                                            if slot <= 36258 {
                                                if slot < 36238 or slot > 36258 { return -1. }
                                                return 2430.
                                            } else {
                                                if slot <= 36262 {
                                                    if slot < 36259 or slot > 36262 { return -1. }
                                                    return 2431.
                                                } else {
                                                    if slot < 36263 or slot > 36266 { return -1. }
                                                    return 2432.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36308 {
                                        if slot <= 36282 {
                                            if slot <= 36279 {
                                                if slot < 36267 or slot > 36279 { return -1. }
                                                return 2433.
                                            } else {
                                                if slot < 36280 or slot > 36282 { return -1. }
                                                return 2434.
                                            }
                                        } else {
                                            if slot <= 36286 {
                                                if slot < 36283 or slot > 36286 { return -1. }
                                                return 2435.
                                            } else {
                                                if slot <= 36288 {
                                                    if slot < 36287 or slot > 36288 { return -1. }
                                                    return 2436.
                                                } else {
                                                    if slot < 36289 or slot > 36308 { return -1. }
                                                    return 2437.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36326 {
                                            if slot <= 36312 {
                                                if slot < 36309 or slot > 36312 { return -1. }
                                                return 2438.
                                            } else {
                                                if slot <= 36321 {
                                                    if slot < 36313 or slot > 36321 { return -1. }
                                                    return 2439.
                                                } else {
                                                    if slot < 36322 or slot > 36326 { return -1. }
                                                    return 2440.
                                                }
                                            }
                                        } else {
                                            if slot <= 36334 {
                                                if slot < 36327 or slot > 36334 { return -1. }
                                                return 2441.
                                            } else {
                                                if slot <= 36347 {
                                                    if slot < 36335 or slot > 36347 { return -1. }
                                                    return 2442.
                                                } else {
                                                    if slot < 36348 or slot > 36360 { return -1. }
                                                    return 2443.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 36550 {
                                if slot <= 36425 {
                                    if slot <= 36397 {
                                        if slot <= 36386 {
                                            if slot <= 36383 {
                                                if slot < 36361 or slot > 36383 { return -1. }
                                                return 2444.
                                            } else {
                                                if slot < 36384 or slot > 36386 { return -1. }
                                                return 2445.
                                            }
                                        } else {
                                            if slot <= 36389 {
                                                if slot < 36387 or slot > 36389 { return -1. }
                                                return 2446.
                                            } else {
                                                if slot <= 36394 {
                                                    if slot < 36390 or slot > 36394 { return -1. }
                                                    return 2447.
                                                } else {
                                                    if slot < 36395 or slot > 36397 { return -1. }
                                                    return 2448.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36403 {
                                            if slot <= 36400 {
                                                if slot < 36398 or slot > 36400 { return -1. }
                                                return 2449.
                                            } else {
                                                if slot < 36401 or slot > 36403 { return -1. }
                                                return 2450.
                                            }
                                        } else {
                                            if slot <= 36419 {
                                                if slot < 36404 or slot > 36419 { return -1. }
                                                return 2451.
                                            } else {
                                                if slot <= 36422 {
                                                    if slot < 36420 or slot > 36422 { return -1. }
                                                    return 2452.
                                                } else {
                                                    if slot < 36423 or slot > 36425 { return -1. }
                                                    return 2453.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36475 {
                                        if slot <= 36445 {
                                            if slot <= 36428 {
                                                if slot < 36426 or slot > 36428 { return -1. }
                                                return 2454.
                                            } else {
                                                if slot < 36429 or slot > 36445 { return -1. }
                                                return 2455.
                                            }
                                        } else {
                                            if slot <= 36464 {
                                                if slot < 36446 or slot > 36464 { return -1. }
                                                return 2456.
                                            } else {
                                                if slot <= 36474 {
                                                    if slot < 36465 or slot > 36474 { return -1. }
                                                    return 2457.
                                                } else {
                                                    if slot < 36475 or slot > 36475 { return -1. }
                                                    return 2458.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36503 {
                                            if slot <= 36482 {
                                                if slot < 36476 or slot > 36482 { return -1. }
                                                return 2459.
                                            } else {
                                                if slot <= 36488 {
                                                    if slot < 36483 or slot > 36488 { return -1. }
                                                    return 2460.
                                                } else {
                                                    if slot < 36489 or slot > 36503 { return -1. }
                                                    return 2461.
                                                }
                                            }
                                        } else {
                                            if slot <= 36511 {
                                                if slot < 36504 or slot > 36511 { return -1. }
                                                return 2462.
                                            } else {
                                                if slot <= 36536 {
                                                    if slot < 36512 or slot > 36536 { return -1. }
                                                    return 2463.
                                                } else {
                                                    if slot < 36537 or slot > 36550 { return -1. }
                                                    return 2464.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 36657 {
                                    if slot <= 36608 {
                                        if slot <= 36560 {
                                            if slot <= 36554 {
                                                if slot < 36551 or slot > 36554 { return -1. }
                                                return 2465.
                                            } else {
                                                if slot < 36555 or slot > 36560 { return -1. }
                                                return 2466.
                                            }
                                        } else {
                                            if slot <= 36584 {
                                                if slot < 36561 or slot > 36584 { return -1. }
                                                return 2467.
                                            } else {
                                                if slot <= 36594 {
                                                    if slot < 36585 or slot > 36594 { return -1. }
                                                    return 2468.
                                                } else {
                                                    if slot < 36595 or slot > 36608 { return -1. }
                                                    return 2469.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36631 {
                                            if slot <= 36616 {
                                                if slot < 36609 or slot > 36616 { return -1. }
                                                return 2470.
                                            } else {
                                                if slot < 36617 or slot > 36631 { return -1. }
                                                return 2471.
                                            }
                                        } else {
                                            if slot <= 36644 {
                                                if slot < 36632 or slot > 36644 { return -1. }
                                                return 2472.
                                            } else {
                                                if slot <= 36649 {
                                                    if slot < 36645 or slot > 36649 { return -1. }
                                                    return 2473.
                                                } else {
                                                    if slot < 36650 or slot > 36657 { return -1. }
                                                    return 2474.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36764 {
                                        if slot <= 36691 {
                                            if slot <= 36685 {
                                                if slot < 36658 or slot > 36685 { return -1. }
                                                return 2475.
                                            } else {
                                                if slot < 36686 or slot > 36691 { return -1. }
                                                return 2476.
                                            }
                                        } else {
                                            if slot <= 36699 {
                                                if slot < 36692 or slot > 36699 { return -1. }
                                                return 2477.
                                            } else {
                                                if slot <= 36746 {
                                                    if slot < 36700 or slot > 36746 { return -1. }
                                                    return 2478.
                                                } else {
                                                    if slot < 36747 or slot > 36764 { return -1. }
                                                    return 2479.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36785 {
                                            if slot <= 36765 {
                                                if slot < 36765 or slot > 36765 { return -1. }
                                                return 2480.
                                            } else {
                                                if slot <= 36778 {
                                                    if slot < 36766 or slot > 36778 { return -1. }
                                                    return 2481.
                                                } else {
                                                    if slot < 36779 or slot > 36785 { return -1. }
                                                    return 2482.
                                                }
                                            }
                                        } else {
                                            if slot <= 36789 {
                                                if slot < 36786 or slot > 36789 { return -1. }
                                                return 2483.
                                            } else {
                                                if slot <= 36817 {
                                                    if slot < 36790 or slot > 36817 { return -1. }
                                                    return 2484.
                                                } else {
                                                    if slot < 36818 or slot > 36820 { return -1. }
                                                    return 2485.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 38113 {
                        if slot <= 37707 {
                            if slot <= 36970 {
                                if slot <= 36919 {
                                    if slot <= 36907 {
                                        if slot <= 36892 {
                                            if slot <= 36870 {
                                                if slot < 36866 or slot > 36870 { return -1. }
                                                return 2486.
                                            } else {
                                                if slot < 36871 or slot > 36892 { return -1. }
                                                return 2487.
                                            }
                                        } else {
                                            if slot <= 36896 {
                                                if slot < 36893 or slot > 36896 { return -1. }
                                                return 2488.
                                            } else {
                                                if slot <= 36900 {
                                                    if slot < 36897 or slot > 36900 { return -1. }
                                                    return 2489.
                                                } else {
                                                    if slot < 36901 or slot > 36907 { return -1. }
                                                    return 2490.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36911 {
                                            if slot <= 36909 {
                                                if slot < 36908 or slot > 36909 { return -1. }
                                                return 2491.
                                            } else {
                                                if slot < 36910 or slot > 36911 { return -1. }
                                                return 2492.
                                            }
                                        } else {
                                            if slot <= 36913 {
                                                if slot < 36912 or slot > 36913 { return -1. }
                                                return 2493.
                                            } else {
                                                if slot <= 36917 {
                                                    if slot < 36914 or slot > 36917 { return -1. }
                                                    return 2494.
                                                } else {
                                                    if slot < 36918 or slot > 36919 { return -1. }
                                                    return 2495.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36936 {
                                        if slot <= 36924 {
                                            if slot <= 36922 {
                                                if slot < 36920 or slot > 36922 { return -1. }
                                                return 2496.
                                            } else {
                                                if slot < 36923 or slot > 36924 { return -1. }
                                                return 2497.
                                            }
                                        } else {
                                            if slot <= 36929 {
                                                if slot < 36925 or slot > 36929 { return -1. }
                                                return 2498.
                                            } else {
                                                if slot <= 36933 {
                                                    if slot < 36931 or slot > 36933 { return -1. }
                                                    return 2499.
                                                } else {
                                                    if slot < 36934 or slot > 36936 { return -1. }
                                                    return 2500.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36954 {
                                            if slot <= 36948 {
                                                if slot < 36937 or slot > 36948 { return -1. }
                                                return 2501.
                                            } else {
                                                if slot < 36949 or slot > 36954 { return -1. }
                                                return 2502.
                                            }
                                        } else {
                                            if slot <= 36958 {
                                                if slot < 36955 or slot > 36958 { return -1. }
                                                return 2503.
                                            } else {
                                                if slot <= 36964 {
                                                    if slot < 36959 or slot > 36964 { return -1. }
                                                    return 2504.
                                                } else {
                                                    if slot < 36965 or slot > 36970 { return -1. }
                                                    return 2505.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 37613 {
                                    if slot <= 37548 {
                                        if slot <= 37529 {
                                            if slot <= 36971 {
                                                if slot < 36971 or slot > 36971 { return -1. }
                                                return 2506.
                                            } else {
                                                if slot < 37528 or slot > 37529 { return -1. }
                                                return 2507.
                                            }
                                        } else {
                                            if slot <= 37533 {
                                                if slot < 37530 or slot > 37533 { return -1. }
                                                return 2508.
                                            } else {
                                                if slot <= 37537 {
                                                    if slot < 37534 or slot > 37537 { return -1. }
                                                    return 2509.
                                                } else {
                                                    if slot < 37538 or slot > 37548 { return -1. }
                                                    return 2510.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 37570 {
                                            if slot <= 37557 {
                                                if slot < 37549 or slot > 37557 { return -1. }
                                                return 2511.
                                            } else {
                                                if slot < 37558 or slot > 37570 { return -1. }
                                                return 2512.
                                            }
                                        } else {
                                            if slot <= 37572 {
                                                if slot < 37571 or slot > 37572 { return -1. }
                                                return 2513.
                                            } else {
                                                if slot <= 37608 {
                                                    if slot < 37573 or slot > 37608 { return -1. }
                                                    return 2514.
                                                } else {
                                                    if slot < 37609 or slot > 37613 { return -1. }
                                                    return 2515.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 37650 {
                                        if slot <= 37623 {
                                            if slot <= 37616 {
                                                if slot < 37614 or slot > 37616 { return -1. }
                                                return 2516.
                                            } else {
                                                if slot < 37617 or slot > 37623 { return -1. }
                                                return 2517.
                                            }
                                        } else {
                                            if slot <= 37626 {
                                                if slot < 37624 or slot > 37626 { return -1. }
                                                return 2518.
                                            } else {
                                                if slot <= 37635 {
                                                    if slot < 37627 or slot > 37635 { return -1. }
                                                    return 2519.
                                                } else {
                                                    if slot < 37636 or slot > 37650 { return -1. }
                                                    return 2520.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 37676 {
                                            if slot <= 37672 {
                                                if slot < 37651 or slot > 37672 { return -1. }
                                                return 2521.
                                            } else {
                                                if slot <= 37673 {
                                                    if slot < 37673 or slot > 37673 { return -1. }
                                                    return 2522.
                                                } else {
                                                    if slot < 37674 or slot > 37676 { return -1. }
                                                    return 2523.
                                                }
                                            }
                                        } else {
                                            if slot <= 37689 {
                                                if slot < 37677 or slot > 37689 { return -1. }
                                                return 2524.
                                            } else {
                                                if slot <= 37692 {
                                                    if slot < 37690 or slot > 37692 { return -1. }
                                                    return 2525.
                                                } else {
                                                    if slot < 37693 or slot > 37707 { return -1. }
                                                    return 2526.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 38020 {
                                if slot <= 37970 {
                                    if slot <= 37767 {
                                        if slot <= 37730 {
                                            if slot <= 37721 {
                                                if slot < 37708 or slot > 37721 { return -1. }
                                                return 2527.
                                            } else {
                                                if slot < 37722 or slot > 37730 { return -1. }
                                                return 2528.
                                            }
                                        } else {
                                            if slot <= 37760 {
                                                if slot < 37731 or slot > 37760 { return -1. }
                                                return 2529.
                                            } else {
                                                if slot <= 37765 {
                                                    if slot < 37761 or slot > 37765 { return -1. }
                                                    return 2530.
                                                } else {
                                                    if slot < 37766 or slot > 37767 { return -1. }
                                                    return 2531.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 37870 {
                                            if slot <= 37861 {
                                                if slot < 37768 or slot > 37861 { return -1. }
                                                return 2532.
                                            } else {
                                                if slot < 37862 or slot > 37870 { return -1. }
                                                return 2533.
                                            }
                                        } else {
                                            if slot <= 37878 {
                                                if slot < 37871 or slot > 37878 { return -1. }
                                                return 2534.
                                            } else {
                                                if slot <= 37889 {
                                                    if slot < 37888 or slot > 37889 { return -1. }
                                                    return 2535.
                                                } else {
                                                    if slot < 37890 or slot > 37970 { return -1. }
                                                    return 2536.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 37990 {
                                        if slot <= 37981 {
                                            if slot <= 37975 {
                                                if slot < 37971 or slot > 37975 { return -1. }
                                                return 2537.
                                            } else {
                                                if slot < 37976 or slot > 37981 { return -1. }
                                                return 2538.
                                            }
                                        } else {
                                            if slot <= 37983 {
                                                if slot < 37982 or slot > 37983 { return -1. }
                                                return 2539.
                                            } else {
                                                if slot <= 37988 {
                                                    if slot < 37984 or slot > 37988 { return -1. }
                                                    return 2540.
                                                } else {
                                                    if slot < 37989 or slot > 37990 { return -1. }
                                                    return 2541.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38001 {
                                            if slot <= 37995 {
                                                if slot < 37991 or slot > 37995 { return -1. }
                                                return 2542.
                                            } else {
                                                if slot <= 37997 {
                                                    if slot < 37996 or slot > 37997 { return -1. }
                                                    return 2543.
                                                } else {
                                                    if slot < 37998 or slot > 38001 { return -1. }
                                                    return 2544.
                                                }
                                            }
                                        } else {
                                            if slot <= 38004 {
                                                if slot < 38002 or slot > 38004 { return -1. }
                                                return 2545.
                                            } else {
                                                if slot <= 38007 {
                                                    if slot < 38005 or slot > 38007 { return -1. }
                                                    return 2546.
                                                } else {
                                                    if slot < 38008 or slot > 38020 { return -1. }
                                                    return 2547.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 38064 {
                                    if slot <= 38038 {
                                        if slot <= 38029 {
                                            if slot <= 38025 {
                                                if slot < 38021 or slot > 38025 { return -1. }
                                                return 2548.
                                            } else {
                                                if slot < 38026 or slot > 38029 { return -1. }
                                                return 2549.
                                            }
                                        } else {
                                            if slot <= 38032 {
                                                if slot < 38031 or slot > 38032 { return -1. }
                                                return 2550.
                                            } else {
                                                if slot <= 38034 {
                                                    if slot < 38033 or slot > 38034 { return -1. }
                                                    return 2551.
                                                } else {
                                                    if slot < 38035 or slot > 38038 { return -1. }
                                                    return 2552.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38055 {
                                            if slot <= 38051 {
                                                if slot < 38039 or slot > 38051 { return -1. }
                                                return 2553.
                                            } else {
                                                if slot < 38052 or slot > 38055 { return -1. }
                                                return 2554.
                                            }
                                        } else {
                                            if slot <= 38058 {
                                                if slot < 38056 or slot > 38058 { return -1. }
                                                return 2555.
                                            } else {
                                                if slot <= 38062 {
                                                    if slot < 38059 or slot > 38062 { return -1. }
                                                    return 2556.
                                                } else {
                                                    if slot < 38063 or slot > 38064 { return -1. }
                                                    return 2557.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38093 {
                                        if slot <= 38072 {
                                            if slot <= 38066 {
                                                if slot < 38065 or slot > 38066 { return -1. }
                                                return 2558.
                                            } else {
                                                if slot < 38067 or slot > 38072 { return -1. }
                                                return 2559.
                                            }
                                        } else {
                                            if slot <= 38076 {
                                                if slot < 38073 or slot > 38076 { return -1. }
                                                return 2560.
                                            } else {
                                                if slot <= 38080 {
                                                    if slot < 38077 or slot > 38080 { return -1. }
                                                    return 2561.
                                                } else {
                                                    if slot < 38081 or slot > 38093 { return -1. }
                                                    return 2562.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38099 {
                                            if slot <= 38095 {
                                                if slot < 38094 or slot > 38095 { return -1. }
                                                return 2563.
                                            } else {
                                                if slot <= 38097 {
                                                    if slot < 38096 or slot > 38097 { return -1. }
                                                    return 2564.
                                                } else {
                                                    if slot < 38098 or slot > 38099 { return -1. }
                                                    return 2565.
                                                }
                                            }
                                        } else {
                                            if slot <= 38102 {
                                                if slot < 38100 or slot > 38102 { return -1. }
                                                return 2566.
                                            } else {
                                                if slot <= 38108 {
                                                    if slot < 38103 or slot > 38108 { return -1. }
                                                    return 2567.
                                                } else {
                                                    if slot < 38109 or slot > 38113 { return -1. }
                                                    return 2568.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 38436 {
                            if slot <= 38279 {
                                if slot <= 38159 {
                                    if slot <= 38128 {
                                        if slot <= 38117 {
                                            if slot <= 38115 {
                                                if slot < 38114 or slot > 38115 { return -1. }
                                                return 2569.
                                            } else {
                                                if slot < 38116 or slot > 38117 { return -1. }
                                                return 2570.
                                            }
                                        } else {
                                            if slot <= 38121 {
                                                if slot < 38118 or slot > 38121 { return -1. }
                                                return 2571.
                                            } else {
                                                if slot <= 38123 {
                                                    if slot < 38122 or slot > 38123 { return -1. }
                                                    return 2572.
                                                } else {
                                                    if slot < 38124 or slot > 38128 { return -1. }
                                                    return 2573.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38139 {
                                            if slot <= 38134 {
                                                if slot < 38129 or slot > 38134 { return -1. }
                                                return 2574.
                                            } else {
                                                if slot < 38135 or slot > 38139 { return -1. }
                                                return 2575.
                                            }
                                        } else {
                                            if slot <= 38147 {
                                                if slot < 38140 or slot > 38147 { return -1. }
                                                return 2576.
                                            } else {
                                                if slot <= 38154 {
                                                    if slot < 38148 or slot > 38154 { return -1. }
                                                    return 2577.
                                                } else {
                                                    if slot < 38155 or slot > 38159 { return -1. }
                                                    return 2578.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38232 {
                                        if slot <= 38193 {
                                            if slot <= 38186 {
                                                if slot < 38160 or slot > 38186 { return -1. }
                                                return 2579.
                                            } else {
                                                if slot < 38187 or slot > 38193 { return -1. }
                                                return 2580.
                                            }
                                        } else {
                                            if slot <= 38209 {
                                                if slot < 38194 or slot > 38209 { return -1. }
                                                return 2581.
                                            } else {
                                                if slot <= 38220 {
                                                    if slot < 38210 or slot > 38220 { return -1. }
                                                    return 2582.
                                                } else {
                                                    if slot < 38221 or slot > 38232 { return -1. }
                                                    return 2583.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38244 {
                                            if slot <= 38238 {
                                                if slot < 38233 or slot > 38238 { return -1. }
                                                return 2584.
                                            } else {
                                                if slot < 38239 or slot > 38244 { return -1. }
                                                return 2585.
                                            }
                                        } else {
                                            if slot <= 38250 {
                                                if slot < 38245 or slot > 38250 { return -1. }
                                                return 2586.
                                            } else {
                                                if slot <= 38258 {
                                                    if slot < 38251 or slot > 38258 { return -1. }
                                                    return 2587.
                                                } else {
                                                    if slot < 38259 or slot > 38279 { return -1. }
                                                    return 2588.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 38371 {
                                    if slot <= 38335 {
                                        if slot <= 38293 {
                                            if slot <= 38285 {
                                                if slot < 38280 or slot > 38285 { return -1. }
                                                return 2589.
                                            } else {
                                                if slot < 38286 or slot > 38293 { return -1. }
                                                return 2590.
                                            }
                                        } else {
                                            if slot <= 38295 {
                                                if slot < 38294 or slot > 38295 { return -1. }
                                                return 2591.
                                            } else {
                                                if slot <= 38305 {
                                                    if slot < 38296 or slot > 38305 { return -1. }
                                                    return 2592.
                                                } else {
                                                    if slot < 38306 or slot > 38335 { return -1. }
                                                    return 2593.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38345 {
                                            if slot <= 38341 {
                                                if slot < 38336 or slot > 38341 { return -1. }
                                                return 2594.
                                            } else {
                                                if slot < 38342 or slot > 38345 { return -1. }
                                                return 2595.
                                            }
                                        } else {
                                            if slot <= 38359 {
                                                if slot < 38346 or slot > 38359 { return -1. }
                                                return 2596.
                                            } else {
                                                if slot <= 38364 {
                                                    if slot < 38360 or slot > 38364 { return -1. }
                                                    return 2597.
                                                } else {
                                                    if slot < 38365 or slot > 38371 { return -1. }
                                                    return 2598.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38399 {
                                        if slot <= 38381 {
                                            if slot <= 38373 {
                                                if slot < 38372 or slot > 38373 { return -1. }
                                                return 2599.
                                            } else {
                                                if slot < 38374 or slot > 38381 { return -1. }
                                                return 2600.
                                            }
                                        } else {
                                            if slot <= 38386 {
                                                if slot < 38382 or slot > 38386 { return -1. }
                                                return 2601.
                                            } else {
                                                if slot <= 38393 {
                                                    if slot < 38387 or slot > 38393 { return -1. }
                                                    return 2602.
                                                } else {
                                                    if slot < 38394 or slot > 38399 { return -1. }
                                                    return 2603.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38425 {
                                            if slot <= 38411 {
                                                if slot < 38400 or slot > 38411 { return -1. }
                                                return 2604.
                                            } else {
                                                if slot <= 38418 {
                                                    if slot < 38412 or slot > 38418 { return -1. }
                                                    return 2605.
                                                } else {
                                                    if slot < 38419 or slot > 38425 { return -1. }
                                                    return 2606.
                                                }
                                            }
                                        } else {
                                            if slot <= 38427 {
                                                if slot < 38426 or slot > 38427 { return -1. }
                                                return 2607.
                                            } else {
                                                if slot <= 38429 {
                                                    if slot < 38428 or slot > 38429 { return -1. }
                                                    return 2608.
                                                } else {
                                                    if slot < 38430 or slot > 38436 { return -1. }
                                                    return 2609.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 38549 {
                                if slot <= 38501 {
                                    if slot <= 38450 {
                                        if slot <= 38442 {
                                            if slot <= 38440 {
                                                if slot < 38437 or slot > 38440 { return -1. }
                                                return 2610.
                                            } else {
                                                if slot < 38441 or slot > 38442 { return -1. }
                                                return 2611.
                                            }
                                        } else {
                                            if slot <= 38445 {
                                                if slot < 38443 or slot > 38445 { return -1. }
                                                return 2612.
                                            } else {
                                                if slot <= 38447 {
                                                    if slot < 38446 or slot > 38447 { return -1. }
                                                    return 2613.
                                                } else {
                                                    if slot < 38448 or slot > 38450 { return -1. }
                                                    return 2614.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38481 {
                                            if slot <= 38457 {
                                                if slot < 38451 or slot > 38457 { return -1. }
                                                return 2615.
                                            } else {
                                                if slot < 38458 or slot > 38481 { return -1. }
                                                return 2616.
                                            }
                                        } else {
                                            if slot <= 38488 {
                                                if slot < 38482 or slot > 38488 { return -1. }
                                                return 2617.
                                            } else {
                                                if slot <= 38497 {
                                                    if slot < 38489 or slot > 38497 { return -1. }
                                                    return 2618.
                                                } else {
                                                    if slot < 38498 or slot > 38501 { return -1. }
                                                    return 2619.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38527 {
                                        if slot <= 38516 {
                                            if slot <= 38512 {
                                                if slot < 38502 or slot > 38512 { return -1. }
                                                return 2620.
                                            } else {
                                                if slot < 38513 or slot > 38516 { return -1. }
                                                return 2621.
                                            }
                                        } else {
                                            if slot <= 38517 {
                                                if slot < 38517 or slot > 38517 { return -1. }
                                                return 2622.
                                            } else {
                                                if slot <= 38524 {
                                                    if slot < 38518 or slot > 38524 { return -1. }
                                                    return 2623.
                                                } else {
                                                    if slot < 38525 or slot > 38527 { return -1. }
                                                    return 2624.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38538 {
                                            if slot <= 38533 {
                                                if slot < 38528 or slot > 38533 { return -1. }
                                                return 2625.
                                            } else {
                                                if slot <= 38535 {
                                                    if slot < 38534 or slot > 38535 { return -1. }
                                                    return 2626.
                                                } else {
                                                    if slot < 38536 or slot > 38538 { return -1. }
                                                    return 2627.
                                                }
                                            }
                                        } else {
                                            if slot <= 38543 {
                                                if slot < 38539 or slot > 38543 { return -1. }
                                                return 2628.
                                            } else {
                                                if slot <= 38546 {
                                                    if slot < 38544 or slot > 38546 { return -1. }
                                                    return 2629.
                                                } else {
                                                    if slot < 38547 or slot > 38549 { return -1. }
                                                    return 2630.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 38670 {
                                    if slot <= 38621 {
                                        if slot <= 38572 {
                                            if slot <= 38552 {
                                                if slot < 38550 or slot > 38552 { return -1. }
                                                return 2631.
                                            } else {
                                                if slot < 38566 or slot > 38572 { return -1. }
                                                return 2632.
                                            }
                                        } else {
                                            if slot <= 38581 {
                                                if slot < 38573 or slot > 38581 { return -1. }
                                                return 2633.
                                            } else {
                                                if slot <= 38609 {
                                                    if slot < 38582 or slot > 38609 { return -1. }
                                                    return 2634.
                                                } else {
                                                    if slot < 38610 or slot > 38621 { return -1. }
                                                    return 2635.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38659 {
                                            if slot <= 38652 {
                                                if slot < 38622 or slot > 38652 { return -1. }
                                                return 2636.
                                            } else {
                                                if slot < 38653 or slot > 38659 { return -1. }
                                                return 2637.
                                            }
                                        } else {
                                            if slot <= 38661 {
                                                if slot < 38660 or slot > 38661 { return -1. }
                                                return 2638.
                                            } else {
                                                if slot <= 38663 {
                                                    if slot < 38662 or slot > 38663 { return -1. }
                                                    return 2639.
                                                } else {
                                                    if slot < 38664 or slot > 38670 { return -1. }
                                                    return 2640.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38706 {
                                        if slot <= 38674 {
                                            if slot <= 38672 {
                                                if slot < 38671 or slot > 38672 { return -1. }
                                                return 2641.
                                            } else {
                                                if slot < 38673 or slot > 38674 { return -1. }
                                                return 2642.
                                            }
                                        } else {
                                            if slot <= 38676 {
                                                if slot < 38675 or slot > 38676 { return -1. }
                                                return 2643.
                                            } else {
                                                if slot <= 38684 {
                                                    if slot < 38677 or slot > 38684 { return -1. }
                                                    return 2644.
                                                } else {
                                                    if slot < 38685 or slot > 38706 { return -1. }
                                                    return 2645.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38836 {
                                            if slot <= 38714 {
                                                if slot < 38707 or slot > 38714 { return -1. }
                                                return 2646.
                                            } else {
                                                if slot <= 38768 {
                                                    if slot < 38715 or slot > 38768 { return -1. }
                                                    return 2647.
                                                } else {
                                                    if slot < 38769 or slot > 38836 { return -1. }
                                                    return 2648.
                                                }
                                            }
                                        } else {
                                            if slot <= 38866 {
                                                if slot < 38837 or slot > 38866 { return -1. }
                                                return 2649.
                                            } else {
                                                if slot <= 38881 {
                                                    if slot < 38868 or slot > 38881 { return -1. }
                                                    return 2650.
                                                } else {
                                                    if slot < 38882 or slot > 38888 { return -1. }
                                                    return 2651.
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
