// PORT: Original source unit RESTART_TABLES.agc.
// PORT: Physical bank 01. Shared continuation entries, slots 3074–3085.
function agcAotUnit50 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3079 {
        if slot <= 3076 {
            if slot <= 3074 {
// PORT: SOURCE RESTART_TABLES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE RESTART_TABLES.agc:2
//# Filename:	RESTART_TABLES.agc
// PORT: SOURCE RESTART_TABLES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE RESTART_TABLES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE RESTART_TABLES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE RESTART_TABLES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE RESTART_TABLES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE RESTART_TABLES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE RESTART_TABLES.agc:9
//# Pages:	238-243
// PORT: SOURCE RESTART_TABLES.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE RESTART_TABLES.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE RESTART_TABLES.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE RESTART_TABLES.agc:13
//#
// PORT: SOURCE RESTART_TABLES.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE RESTART_TABLES.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE RESTART_TABLES.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE RESTART_TABLES.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE RESTART_TABLES.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE RESTART_TABLES.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE RESTART_TABLES.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE RESTART_TABLES.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE RESTART_TABLES.agc:22
//# actually created.
// PORT: SOURCE RESTART_TABLES.agc:23
//#
// PORT: SOURCE RESTART_TABLES.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE RESTART_TABLES.agc:25
//#
// PORT: SOURCE RESTART_TABLES.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE RESTART_TABLES.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE RESTART_TABLES.agc:28
//
// PORT: SOURCE RESTART_TABLES.agc:29
//# Page 238
// PORT: SOURCE RESTART_TABLES.agc:30
//# RESTART TABLES
// PORT: SOURCE RESTART_TABLES.agc:31
//# ------------------
// PORT: SOURCE RESTART_TABLES.agc:32
//#
// PORT: SOURCE RESTART_TABLES.agc:33
//# THERE ARE TWO FORMS OF RESTART TABLES FOR EACH GROUP.  THEY ARE KNOWN AS THE EVEN RESTART TABLES AND THE ODD
// PORT: SOURCE RESTART_TABLES.agc:34
//# RESTART TABLES.  THE ODD TABLES HAVE ONLY ONE ENTRY OF THREE LOCATIONS WHILE THE EVEN TABLES HAVE TWO ENTRIES
// PORT: SOURCE RESTART_TABLES.agc:35
//# EACH USING THREE LOCATIONS. THE INFORMATION AS TO WHETHER IT IS A JOB, WAITLIST, OR A LONGCALL IS GIVEN BY THE
// PORT: SOURCE RESTART_TABLES.agc:36
//# WAY THINGS ARE PUT INTO THE TABLES.
// PORT: SOURCE RESTART_TABLES.agc:37
//#      A JOB HAS ITS PRIORITY STORED IN PRDTTAB OF THE CORRECT PHASE SPOT - A POSITIVE PRIORITY INDICATES A
// PORT: SOURCE RESTART_TABLES.agc:38
//# FINDVAC JOB, A NEGATIVE PRIORITY A NOVAC.  THE 2CADR OF THE JOB IS STORED IN THE CADRTAB.
// PORT: SOURCE RESTART_TABLES.agc:39
//# FOR EXAMPLE,
// PORT: SOURCE RESTART_TABLES.agc:40
//#
// PORT: SOURCE RESTART_TABLES.agc:41
//# 5.7SPOT	OCT	23000
// PORT: SOURCE RESTART_TABLES.agc:42
//#		2CADR	SOMEJOB
// PORT: SOURCE RESTART_TABLES.agc:43
//#
// PORT: SOURCE RESTART_TABLES.agc:44
//# A RESTART OF GROUP 5 WITH PHASE SEVEN WOULD THEN CAUSE SOMEJOB TO BE RESTARTED AS A FINDVAC WITH PRIORITY 23.
// PORT: SOURCE RESTART_TABLES.agc:45
//#
// PORT: SOURCE RESTART_TABLES.agc:46
//# 5.5SPOT	OCT	-23000
// PORT: SOURCE RESTART_TABLES.agc:47
//#		2CADR	ANYJOB
// PORT: SOURCE RESTART_TABLES.agc:48
//#
// PORT: SOURCE RESTART_TABLES.agc:49
//# HERE A RESTART OF GROUP 5 WITH PHASE 7 WOULD CAUSE ANYJOB TO BE RESTARTED AS A NOVAC WITH PRIORITY 23.
// PORT: SOURCE RESTART_TABLES.agc:50
//# A LONGCALL HAS ITS GENADR OF ITS 2CADR STORED NEGATIVELY AND ITS BBCON STORED POSITIVELY.  IN ITS PRDTTAB IS
// PORT: SOURCE RESTART_TABLES.agc:51
//# PLACED THE LOCATION OF A DP REGISTER THAT CONTAINS THE DELTA TIME THAT LONGCALL HAD BEEN ORIGINALLY STARTED
// PORT: SOURCE RESTART_TABLES.agc:52
//# WITH.  EXAMPLE,
// PORT: SOURCE RESTART_TABLES.agc:53
//#
// PORT: SOURCE RESTART_TABLES.agc:54
//# 3.6SPOT	GENADR	DELTAT
// PORT: SOURCE RESTART_TABLES.agc:55
//#	       -GENADR	LONGTASK
// PORT: SOURCE RESTART_TABLES.agc:56
//#		BBCON	LONGTASK
// PORT: SOURCE RESTART_TABLES.agc:57
//#
// PORT: SOURCE RESTART_TABLES.agc:58
//#		OCT	31000
// PORT: SOURCE RESTART_TABLES.agc:59
//#		2CADR	JOBAGAIN
// PORT: SOURCE RESTART_TABLES.agc:60
//#
// PORT: SOURCE RESTART_TABLES.agc:61
//# THIS WOULD START UP LONGTASK AT THE APPROPRIATE TIME, OR IMMEDIATELY IF THE TIME HAD ALREADY PASSED. IT SHOULD
// PORT: SOURCE RESTART_TABLES.agc:62
//# BE NOTED THAT IF DELTAT IS IN A SWITCHED E BANK, THIS INFORMATOIN SHOULD BE IN THE BBCON OFTHE 2CADR OF THE
// PORT: SOURCE RESTART_TABLES.agc:63
//# TASK.  FROM ABOVE, WE SEE THAT THE SECOND PART OF THIS PHASE WOULD BE STARTED AS A JOB WITH A PRIORITY OF 31.
// PORT: SOURCE RESTART_TABLES.agc:64
//#
// PORT: SOURCE RESTART_TABLES.agc:65
//# WAITLIST CALLS ARE IDENTIFIED BY THE FACT THAT THEIR 2CADR IS STORED NEGATIVELY. IF PRDTTAB OF THE PHASE SPOT
// PORT: SOURCE RESTART_TABLES.agc:66
//# IS POSITIVE, THEN IT CONTAINS THE DELTA TIME, IF PRDTTAB IS NEGATIVE THEN IT IS THE -GENADR OF AN ERASABLE
// PORT: SOURCE RESTART_TABLES.agc:67
//# LOCATION CONTAINING THE DELTA TIME, THAT IS, THE TIME IS STORED INDIRECTLY.  IT SHOULD BE NOTED AS ABOVE, THAT
// PORT: SOURCE RESTART_TABLES.agc:68
//# IF THE TIME IS STORED INDIRECTLY, THE BBCON MUST CONTAIN THE NECESSARY E BANK INFORMATION IF APPLICABLE.  WITH
// PORT: SOURCE RESTART_TABLES.agc:69
//# WAITLIST WE HAVE ONE FURTHER OPTION, IF -0 IS STORED IN PRDTTAB, IT WILL CAUSE AN IMMEDIATE RESTART OF THE
// PORT: SOURCE RESTART_TABLES.agc:70
//# TASK.  EXAMPLES,
// PORT: SOURCE RESTART_TABLES.agc:71
//#
// PORT: SOURCE RESTART_TABLES.agc:72
//#		OCT	77777		# THIS WILL CAUSE AN IMMEDIATE RESTART
// PORT: SOURCE RESTART_TABLES.agc:73
//#	       -2CADR	ATASK		# OF THE TASK :ATASK:
// PORT: SOURCE RESTART_TABLES.agc:74
//#
// PORT: SOURCE RESTART_TABLES.agc:75
//#		DEC	200		# IF THE TIME OF THE 2 SECONDS SINCE DUMMY
// PORT: SOURCE RESTART_TABLES.agc:76
//#	       -2CADR	DUMMY		# WAS PUT ON THE WAITLIST IS UP, IT WILL BEGIN
// PORT: SOURCE RESTART_TABLES.agc:77
//#					# IN 10 MS, OTHERWISE IT WILL BEGIN WHEN
// PORT: SOURCE RESTART_TABLES.agc:78
//#					# IT NORMALLY WOULD HAVE BEGUN.
// PORT: SOURCE RESTART_TABLES.agc:79
//# Page 239
// PORT: SOURCE RESTART_TABLES.agc:80
//#	       -GENADR	DTIME		# WHERE DTIME CONTAINS THE DELTA TIME
// PORT: SOURCE RESTART_TABLES.agc:81
//#	       -2CADR	TASKTASK	# OTHERWISE THIS IS AS ABOVE
// PORT: SOURCE RESTART_TABLES.agc:82
//#
// PORT: SOURCE RESTART_TABLES.agc:83
//# ***** NOW THE TABLES THEMSELVES *****
// PORT: SOURCE RESTART_TABLES.agc:84
//
// PORT: SOURCE RESTART_TABLES.agc:85
//		BANK	01
// PORT: SOURCE RESTART_TABLES.agc:86
//		SETLOC	RESTART
// PORT: SOURCE RESTART_TABLES.agc:87
//		BANK
// PORT: SOURCE RESTART_TABLES.agc:88
//
// PORT: SOURCE RESTART_TABLES.agc:89
//PRDTTAB		EQUALS	12000		# USED TO FIND THE PRIORITY OR DELTATIME
// PORT: SOURCE RESTART_TABLES.agc:90
//CADRTAB		EQUALS	12001		# THIS AND THE NEXT RELATIVE LOC CONTAIN
// PORT: SOURCE RESTART_TABLES.agc:91
//					# RESTART 2CADR
// PORT: SOURCE RESTART_TABLES.agc:92
//
// PORT: SOURCE RESTART_TABLES.agc:93
//		COUNT*	$$/RSTAB	# TABLES IN BANK 1.
// PORT: SOURCE RESTART_TABLES.agc:94
//SIZETAB		TC	1.2SPOT -12006
// PORT: Fixed ROM slots 3074.
                if slot <> 3074 or instruction <> 8 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 8, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3075 {
// PORT: SOURCE RESTART_TABLES.agc:95
//		TC	1.3SPOT -12004
// PORT: Fixed ROM slots 3075.
                    if slot <> 3075 or instruction <> 16 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 16, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTART_TABLES.agc:96
//		TC	2.2SPOT -12006
// PORT: Fixed ROM slots 3076.
                    if slot <> 3076 or instruction <> 8 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 8, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3077 {
// PORT: SOURCE RESTART_TABLES.agc:97
//		TC	2.3SPOT	-12004
// PORT: Fixed ROM slots 3077.
                if slot <> 3077 or instruction <> 19 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 19, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3078 {
// PORT: SOURCE RESTART_TABLES.agc:98
//		TC	3.2SPOT -12006
// PORT: Fixed ROM slots 3078.
                    if slot <> 3078 or instruction <> 8 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 8, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTART_TABLES.agc:99
//		TC	3.3SPOT -12004
// PORT: Fixed ROM slots 3079.
                    if slot <> 3079 or instruction <> 43 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 43, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3082 {
            if slot <= 3080 {
// PORT: SOURCE RESTART_TABLES.agc:100
//		TC	4.2SPOT -12006
// PORT: Fixed ROM slots 3080.
                if slot <> 3080 or instruction <> 47 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 47, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3081 {
// PORT: SOURCE RESTART_TABLES.agc:101
//		TC	4.3SPOT -12004
// PORT: Fixed ROM slots 3081.
                    if slot <> 3081 or instruction <> 55 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 55, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTART_TABLES.agc:102
//		TC	5.2SPOT -12006
// PORT: Fixed ROM slots 3082.
                    if slot <> 3082 or instruction <> 98 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 98, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3083 {
// PORT: SOURCE RESTART_TABLES.agc:103
//		TC	5.3SPOT -12004
// PORT: Fixed ROM slots 3083.
                if slot <> 3083 or instruction <> 112 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 112, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3084 {
// PORT: SOURCE RESTART_TABLES.agc:104
//		TC	6.2SPOT -12006
// PORT: Fixed ROM slots 3084.
                    if slot <> 3084 or instruction <> 8 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 8, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RESTART_TABLES.agc:105
//		TC	6.3SPOT -12004
// PORT: Fixed ROM slots 3085.
                    if slot <> 3085 or instruction <> 121 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 121, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[50] to agcAotUnit50@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTART_TABLES.agc:106
//1.2SPOT		OCT	21000		# A DUMMY EXAMPLE TO BE REPLACED AS SOON
// PORT: Fixed ROM slots 3086.
    3086, 17408,
// PORT: SOURCE RESTART_TABLES.agc:107
//		EBANK=	STATE
// PORT: SOURCE RESTART_TABLES.agc:108
//		2CADR	ENDOFJOB	# AS THERE IS A LEGITIMATE 1.2SPOT
// PORT: Fixed ROM slots 3087 3088.
    3087, 5338, 3088, 4192,
// PORT: SOURCE RESTART_TABLES.agc:109
//
// PORT: SOURCE RESTART_TABLES.agc:110
//		DEC	100
// PORT: Fixed ROM slots 3089.
    3089, 200,
// PORT: SOURCE RESTART_TABLES.agc:111
//		EBANK=	STATE
// PORT: SOURCE RESTART_TABLES.agc:112
//		2CADR	TASKOVER
// PORT: Fixed ROM slots 3090 3091.
    3090, 5474, 3091, 4192,
// PORT: SOURCE RESTART_TABLES.agc:113
//
// PORT: SOURCE RESTART_TABLES.agc:114
//# ANY MORE GROUP 1.EVEN RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:115
//
// PORT: SOURCE RESTART_TABLES.agc:116
//1.3SPOT	       -GENADR	SAVET-30
// PORT: Fixed ROM slots 3092.
    3092, 63872,
// PORT: SOURCE RESTART_TABLES.agc:117
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:118
//	       -2CADR	ULLGTASK
// PORT: Fixed ROM slots 3093 3094.
    3093, 63026, 3094, 3984,
// PORT: SOURCE RESTART_TABLES.agc:119
//
// PORT: SOURCE RESTART_TABLES.agc:120
//# ANY MORE GROUP 1.ODD RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:121
//
// PORT: SOURCE RESTART_TABLES.agc:122
//2.2SPOT		EQUALS	1.2SPOT
// PORT: SOURCE RESTART_TABLES.agc:123
//# ANY MORE GROUP 2.EVEN RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:124
//
// PORT: SOURCE RESTART_TABLES.agc:125
//2.3SPOT		GENADR	600SECS
// PORT: Fixed ROM slots 3095.
    3095, 2864,
// PORT: SOURCE RESTART_TABLES.agc:126
//	       -GENADR	STATEINT
// PORT: Fixed ROM slots 3096.
    3096, 62710,
// PORT: SOURCE RESTART_TABLES.agc:127
//		EBANK=	RRECTCSM
// PORT: SOURCE RESTART_TABLES.agc:128
//		BBCON	STATEINT
// PORT: Fixed ROM slots 3097.
    3097, 22630,
// PORT: SOURCE RESTART_TABLES.agc:129
//
// PORT: SOURCE RESTART_TABLES.agc:130
//# Page 240
// PORT: SOURCE RESTART_TABLES.agc:131
//2.5SPOT		OCT	05000
// PORT: Fixed ROM slots 3098.
    3098, 5120,
// PORT: SOURCE RESTART_TABLES.agc:132
//		EBANK=	RRECTCSM
// PORT: SOURCE RESTART_TABLES.agc:133
//		2CADR	STATINT1
// PORT: Fixed ROM slots 3099 3100.
    3099, 2838, 3100, 22630,
// PORT: SOURCE RESTART_TABLES.agc:134
//
// PORT: SOURCE RESTART_TABLES.agc:135
//2.7SPOT		DEC	1500
// PORT: Fixed ROM slots 3101.
    3101, 3000,
// PORT: SOURCE RESTART_TABLES.agc:136
//		EBANK=	LOSCOUNT
// PORT: SOURCE RESTART_TABLES.agc:137
//	       -2CADR	P20LEMC1
// PORT: Fixed ROM slots 3102 3103.
    3102, 63158, 3103, 24464,
// PORT: SOURCE RESTART_TABLES.agc:138
//
// PORT: SOURCE RESTART_TABLES.agc:139
//2.11SPOT	OCT	14000
// PORT: Fixed ROM slots 3104.
    3104, 12288,
// PORT: SOURCE RESTART_TABLES.agc:140
//		EBANK=	P21TIME
// PORT: SOURCE RESTART_TABLES.agc:141
//		2CADR	P25LEM1
// PORT: Fixed ROM slots 3105 3106.
    3105, 2588, 3106, 41070,
// PORT: SOURCE RESTART_TABLES.agc:142
//
// PORT: SOURCE RESTART_TABLES.agc:143
//2.13SPOT	OCT	10000
// PORT: Fixed ROM slots 3107.
    3107, 8192,
// PORT: SOURCE RESTART_TABLES.agc:144
//		EBANK=	LOSCOUNT
// PORT: SOURCE RESTART_TABLES.agc:145
//		2CADR	RELINUS
// PORT: Fixed ROM slots 3108 3109.
    3108, 2334, 3109, 45166,
// PORT: SOURCE RESTART_TABLES.agc:146
//
// PORT: SOURCE RESTART_TABLES.agc:147
//2.15SPOT	OCT	26000
// PORT: Fixed ROM slots 3110.
    3110, 22528,
// PORT: SOURCE RESTART_TABLES.agc:148
//		EBANK=	LOSCOUNT
// PORT: SOURCE RESTART_TABLES.agc:149
//		2CADR	R22RSTRT
// PORT: Fixed ROM slots 3111 3112.
    3111, 2902, 3112, 41070,
// PORT: SOURCE RESTART_TABLES.agc:150
//
// PORT: SOURCE RESTART_TABLES.agc:151
//2.17SPOT	OCT	77777
// PORT: Fixed ROM slots 3113.
    3113, 65534,
// PORT: SOURCE RESTART_TABLES.agc:152
//		EBANK=	VGPREV
// PORT: SOURCE RESTART_TABLES.agc:153
//	       -2CADR	REDO2.17
// PORT: Fixed ROM slots 3114 3115.
    3114, 63040, 3115, 3984,
// PORT: SOURCE RESTART_TABLES.agc:154
//
// PORT: SOURCE RESTART_TABLES.agc:155
//2.21SPOT	DEC	25
// PORT: Fixed ROM slots 3116.
    3116, 50,
// PORT: SOURCE RESTART_TABLES.agc:156
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:157
//	       -2CADR	R10,R11
// PORT: Fixed ROM slots 3117 3118.
    3117, 63474, 3118, 30608,
// PORT: SOURCE RESTART_TABLES.agc:158
//
// PORT: SOURCE RESTART_TABLES.agc:159
//# ANY MORE GROUP 2.ODD RESTART VALUES SHOULD GO HERE.
// PORT: SOURCE RESTART_TABLES.agc:160
//
// PORT: SOURCE RESTART_TABLES.agc:161
//3.2SPOT		EQUALS	1.2SPOT
// PORT: SOURCE RESTART_TABLES.agc:162
//# ANY MORE GROUP 3.EVEN RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:163
//
// PORT: SOURCE RESTART_TABLES.agc:164
//3.3SPOT	       -GENADR	ZOOMTIME
// PORT: Fixed ROM slots 3119.
    3119, 63962,
// PORT: SOURCE RESTART_TABLES.agc:165
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:166
//	       -2CADR	ZOOM
// PORT: Fixed ROM slots 3120 3121.
    3120, 63450, 3121, 34704,
// PORT: SOURCE RESTART_TABLES.agc:167
//
// PORT: SOURCE RESTART_TABLES.agc:168
//3.5SPOT		OCT	20000
// PORT: Fixed ROM slots 3122.
    3122, 16384,
// PORT: SOURCE RESTART_TABLES.agc:169
//		EBANK=	TTOGO
// PORT: SOURCE RESTART_TABLES.agc:170
//		2CADR	S40.13
// PORT: Fixed ROM slots 3123 3124.
    3123, 2752, 3124, 47214,
// PORT: SOURCE RESTART_TABLES.agc:171
//
// PORT: SOURCE RESTART_TABLES.agc:172
//# ANY MORE GROUP 3.ODD RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:173
//
// PORT: SOURCE RESTART_TABLES.agc:174
//4.2SPOT		DEC	2500
// PORT: Fixed ROM slots 3125.
    3125, 5000,
// PORT: SOURCE RESTART_TABLES.agc:175
//		EBANK=	TTOGO
// PORT: SOURCE RESTART_TABLES.agc:176
//	       -2CADR	TIG-5
// PORT: Fixed ROM slots 3126 3127.
    3126, 63018, 3127, 3984,
// PORT: SOURCE RESTART_TABLES.agc:177
//
// PORT: SOURCE RESTART_TABLES.agc:178
//		OCT	77777
// PORT: Fixed ROM slots 3128.
    3128, 65534,
// PORT: SOURCE RESTART_TABLES.agc:179
//		EBANK=	TTOGO
// PORT: SOURCE RESTART_TABLES.agc:180
//# Page 241
// PORT: SOURCE RESTART_TABLES.agc:181
//	       -2CADR	REDO4.2
// PORT: Fixed ROM slots 3129 3130.
    3129, 63034, 3130, 3984,
// PORT: SOURCE RESTART_TABLES.agc:182
//
// PORT: SOURCE RESTART_TABLES.agc:183
//# ANY MORE GROUP 4.EVEN RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:184
//
// PORT: SOURCE RESTART_TABLES.agc:185
//4.3SPOT		OCT	25000
// PORT: Fixed ROM slots 3131.
    3131, 21504,
// PORT: SOURCE RESTART_TABLES.agc:186
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:187
//		2CADR	GOABORT
// PORT: Fixed ROM slots 3132 3133.
    3132, 3776, 3133, 53358,
// PORT: SOURCE RESTART_TABLES.agc:188
//
// PORT: SOURCE RESTART_TABLES.agc:189
//4.5SPOT		DEC	50
// PORT: Fixed ROM slots 3134.
    3134, 100,
// PORT: SOURCE RESTART_TABLES.agc:190
//		EBANK=	TTOGO
// PORT: SOURCE RESTART_TABLES.agc:191
//	       -2CADR	ULLAGOFF
// PORT: Fixed ROM slots 3135 3136.
    3135, 62746, 3136, 3984,
// PORT: SOURCE RESTART_TABLES.agc:192
//
// PORT: SOURCE RESTART_TABLES.agc:193
//4.7SPOT		DEC	500
// PORT: Fixed ROM slots 3137.
    3137, 1000,
// PORT: SOURCE RESTART_TABLES.agc:194
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:195
//	       -2CADR	TIG-0
// PORT: Fixed ROM slots 3138 3139.
    3138, 62968, 3139, 3984,
// PORT: SOURCE RESTART_TABLES.agc:196
//
// PORT: SOURCE RESTART_TABLES.agc:197
//4.11SPOT       -GENADR	TGO +1
// PORT: Fixed ROM slots 3140.
    3140, 63840,
// PORT: SOURCE RESTART_TABLES.agc:198
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:199
//	       -2CADR	ENGOFTSK
// PORT: Fixed ROM slots 3141 3142.
    3141, 61754, 3142, 3984,
// PORT: SOURCE RESTART_TABLES.agc:200
//
// PORT: SOURCE RESTART_TABLES.agc:201
//4.13SPOT	OCT	12000
// PORT: Fixed ROM slots 3143.
    3143, 10240,
// PORT: SOURCE RESTART_TABLES.agc:202
//		EBANK=	TRKMKCNT
// PORT: SOURCE RESTART_TABLES.agc:203
//		2CADR	POSTBURN
// PORT: Fixed ROM slots 3144 3145.
    3144, 3366, 3145, 61550,
// PORT: SOURCE RESTART_TABLES.agc:204
//
// PORT: SOURCE RESTART_TABLES.agc:205
//4.15SPOT	DEC	500
// PORT: Fixed ROM slots 3146.
    3146, 1000,
// PORT: SOURCE RESTART_TABLES.agc:206
//		EBANK=	TTOGO
// PORT: SOURCE RESTART_TABLES.agc:207
//	       -2CADR	TIG-30
// PORT: Fixed ROM slots 3147 3148.
    3147, 63106, 3148, 3984,
// PORT: SOURCE RESTART_TABLES.agc:208
//
// PORT: SOURCE RESTART_TABLES.agc:209
//4.17SPOT	OCT	77777
// PORT: Fixed ROM slots 3149.
    3149, 65534,
// PORT: SOURCE RESTART_TABLES.agc:210
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:211
//	       -2CADR	TIG-5
// PORT: Fixed ROM slots 3150 3151.
    3150, 63018, 3151, 3984,
// PORT: SOURCE RESTART_TABLES.agc:212
//
// PORT: SOURCE RESTART_TABLES.agc:213
//4.21SPOT	OCT	13000
// PORT: Fixed ROM slots 3152.
    3152, 11264,
// PORT: SOURCE RESTART_TABLES.agc:214
//		EBANK=	STAR
// PORT: SOURCE RESTART_TABLES.agc:215
//		2CADR	R51.1 +1
// PORT: Fixed ROM slots 3153 3154.
    3153, 3104, 3154, 24682,
// PORT: SOURCE RESTART_TABLES.agc:216
//
// PORT: SOURCE RESTART_TABLES.agc:217
//4.23SPOT	OCT	77777
// PORT: Fixed ROM slots 3155.
    3155, 65534,
// PORT: SOURCE RESTART_TABLES.agc:218
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:219
//	       -2CADR	IGNITION
// PORT: Fixed ROM slots 3156 3157.
    3156, 62930, 3157, 3984,
// PORT: SOURCE RESTART_TABLES.agc:220
//
// PORT: SOURCE RESTART_TABLES.agc:221
//4.25SPOT	GENADR	SAVET-30
// PORT: Fixed ROM slots 3158.
    3158, 1662,
// PORT: SOURCE RESTART_TABLES.agc:222
//	       -GENADR	TIG-35
// PORT: Fixed ROM slots 3159.
    3159, 63166,
// PORT: SOURCE RESTART_TABLES.agc:223
//		EBANK=	SAVET-30
// PORT: SOURCE RESTART_TABLES.agc:224
//		BBCON	TIG-35
// PORT: Fixed ROM slots 3160.
    3160, 61550,
// PORT: SOURCE RESTART_TABLES.agc:225
//
// PORT: SOURCE RESTART_TABLES.agc:226
//4.27SPOT	OCT	52777
// PORT: Fixed ROM slots 3161.
    3161, 44030,
// PORT: SOURCE RESTART_TABLES.agc:227
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:228
//		2CADR	P70A
// PORT: Fixed ROM slots 3162 3163.
    3162, 2166, 3163, 34926,
// PORT: SOURCE RESTART_TABLES.agc:229
//
// PORT: SOURCE RESTART_TABLES.agc:230
//# Page 242
// PORT: SOURCE RESTART_TABLES.agc:231
//4.31SPOT	OCT	52777
// PORT: Fixed ROM slots 3164.
    3164, 44030,
// PORT: SOURCE RESTART_TABLES.agc:232
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:233
//		2CADR	P71A
// PORT: Fixed ROM slots 3165 3166.
    3165, 2172, 3166, 34926
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE RESTART_TABLES.agc:234
//
// PORT: SOURCE RESTART_TABLES.agc:235
//4.33SPOT	OCT	46777
// PORT: Fixed ROM slots 3167.
    3167, 39934,
// PORT: SOURCE RESTART_TABLES.agc:236
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:237
//		2CADR	GOP00FIX
// PORT: Fixed ROM slots 3168 3169.
    3168, 2088, 3169, 8302,
// PORT: SOURCE RESTART_TABLES.agc:238
//
// PORT: SOURCE RESTART_TABLES.agc:239
//4.35SPOT	OCT	46777
// PORT: Fixed ROM slots 3170.
    3170, 39934,
// PORT: SOURCE RESTART_TABLES.agc:240
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:241
//		2CADR	GOPOODOO
// PORT: Fixed ROM slots 3171 3172.
    3171, 5994, 3172, 4206,
// PORT: SOURCE RESTART_TABLES.agc:242
//
// PORT: SOURCE RESTART_TABLES.agc:243
//4.37SPOT	OCT	52777
// PORT: Fixed ROM slots 3173.
    3173, 44030,
// PORT: SOURCE RESTART_TABLES.agc:244
//		EBANK=	WHICH
// PORT: SOURCE RESTART_TABLES.agc:245
//		2CADR	COMFAIL
// PORT: Fixed ROM slots 3174 3175.
    3174, 2802, 3175, 61550,
// PORT: SOURCE RESTART_TABLES.agc:246
//
// PORT: SOURCE RESTART_TABLES.agc:247
//# ANY MORE 4.ODD RESTART VALUES SHOULD GO HERE.
// PORT: SOURCE RESTART_TABLES.agc:248
//
// PORT: SOURCE RESTART_TABLES.agc:249
//5.2SPOT		OCT	22000
// PORT: Fixed ROM slots 3176.
    3176, 18432,
// PORT: SOURCE RESTART_TABLES.agc:250
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:251
//		2CADR	NORMLIZE
// PORT: Fixed ROM slots 3177 3178.
    3177, 2658, 3178, 39022,
// PORT: SOURCE RESTART_TABLES.agc:252
//
// PORT: SOURCE RESTART_TABLES.agc:253
//		DEC	200
// PORT: Fixed ROM slots 3179.
    3179, 400,
// PORT: SOURCE RESTART_TABLES.agc:254
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:255
//	       -2CADR	REREADAC
// PORT: Fixed ROM slots 3180 3181.
    3180, 61670, 3181, 1936,
// PORT: SOURCE RESTART_TABLES.agc:256
//
// PORT: SOURCE RESTART_TABLES.agc:257
//5.4SPOT		DEC	200
// PORT: Fixed ROM slots 3182.
    3182, 400,
// PORT: SOURCE RESTART_TABLES.agc:258
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:259
//	       -2CADR	REREADAC
// PORT: Fixed ROM slots 3183 3184.
    3183, 61670, 3184, 1936,
// PORT: SOURCE RESTART_TABLES.agc:260
//
// PORT: SOURCE RESTART_TABLES.agc:261
//		OCT	20000
// PORT: Fixed ROM slots 3185.
    3185, 16384,
// PORT: SOURCE RESTART_TABLES.agc:262
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:263
//		2CADR	SERVICER
// PORT: Fixed ROM slots 3186 3187.
    3186, 2316, 3187, 55406,
// PORT: SOURCE RESTART_TABLES.agc:264
//
// PORT: SOURCE RESTART_TABLES.agc:265
//# ANY MORE GROUP 5.EVEN RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:266
//
// PORT: SOURCE RESTART_TABLES.agc:267
//5.3SPOT		DEC	200
// PORT: Fixed ROM slots 3188.
    3188, 400,
// PORT: SOURCE RESTART_TABLES.agc:268
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:269
//	       -2CADR	REREADAC
// PORT: Fixed ROM slots 3189 3190.
    3189, 61670, 3190, 1936,
// PORT: SOURCE RESTART_TABLES.agc:270
//
// PORT: SOURCE RESTART_TABLES.agc:271
//5.5SPOT		OCT	77777
// PORT: Fixed ROM slots 3191.
    3191, 65534,
// PORT: SOURCE RESTART_TABLES.agc:272
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:273
//	       -2CADR	REDO5.5
// PORT: Fixed ROM slots 3192 3193.
    3192, 61864, 3193, 1936,
// PORT: SOURCE RESTART_TABLES.agc:274
//
// PORT: SOURCE RESTART_TABLES.agc:275
//5.7SPOT		OCT	77777
// PORT: Fixed ROM slots 3194.
    3194, 65534,
// PORT: SOURCE RESTART_TABLES.agc:276
//		EBANK=	DVCNTR
// PORT: SOURCE RESTART_TABLES.agc:277
//# Page 243
// PORT: SOURCE RESTART_TABLES.agc:278
//	       -2CADR	BIBIBIAS
// PORT: Fixed ROM slots 3195 3196.
    3195, 61922, 3196, 1936,
// PORT: SOURCE RESTART_TABLES.agc:279
//
// PORT: SOURCE RESTART_TABLES.agc:280
//# ANY MORE GROUP 5.ODD RESTART VALUES SHOULD GO HERE
// PORT: SOURCE RESTART_TABLES.agc:281
//
// PORT: SOURCE RESTART_TABLES.agc:282
//6.2SPOT		EQUALS	1.2SPOT
// PORT: SOURCE RESTART_TABLES.agc:283
//6.3SPOT		DEC	100
// PORT: Fixed ROM slots 3197.
    3197, 200,
// PORT: SOURCE RESTART_TABLES.agc:284
//		EBANK=	TIG
// PORT: SOURCE RESTART_TABLES.agc:285
//	       -2CADR	CLOKTASK
// PORT: Fixed ROM slots 3198 3199.
    3198, 62560, 3199, 3984,
// PORT: SOURCE RESTART_TABLES.agc:286
//
// PORT: SOURCE RESTART_TABLES.agc:287
//6.5SPOT		OCT	30000		# PROTECT INCREMENTING OF TIME2,TIME1 BY
// PORT: Fixed ROM slots 3200.
    3200, 24576,
// PORT: SOURCE RESTART_TABLES.agc:288
//		EBANK=	TEPHEM		# P27(UPDATE PROGRAM) VIA V70 OR V73.
// PORT: SOURCE RESTART_TABLES.agc:289
//		2CADR	TIMEDIDR
// PORT: Fixed ROM slots 3201 3202.
    3201, 3842, 3202, 8294,
// PORT: SOURCE RESTART_TABLES.agc:290
//
// PORT: SOURCE RESTART_TABLES.agc:291
//6.7SPOT		OCT	17000
// PORT: Fixed ROM slots 3203.
    3203, 15360,
// PORT: SOURCE RESTART_TABLES.agc:292
//		EBANK=	VGPREV
// PORT: SOURCE RESTART_TABLES.agc:293
//		2CADR	REDO6.7
// PORT: Fixed ROM slots 3204 3205.
    3204, 3536, 3205, 61550
)).

