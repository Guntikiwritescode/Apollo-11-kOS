// RESTART_TABLES.agc
// bank 01, slots 3074-3085
function agcAotUnit50 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3079 {
        if slot <= 3076 {
            if slot <= 3074 {
// RESTART_TABLES.agc:1
//# Copyright:	Public domain.
// RESTART_TABLES.agc:2
//# Filename:	RESTART_TABLES.agc
// RESTART_TABLES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// RESTART_TABLES.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// RESTART_TABLES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// RESTART_TABLES.agc:6
//# Assembler:	yaYUL
// RESTART_TABLES.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// RESTART_TABLES.agc:8
//# Website:	www.ibiblio.org/apollo.
// RESTART_TABLES.agc:9
//# Pages:	238-243
// RESTART_TABLES.agc:10
//# Mod history:  2009-05-10 SN   (Navarro Kerman).  Started adapting
// RESTART_TABLES.agc:11
//#				from the Luminary131/ file of the same
// RESTART_TABLES.agc:12
//#				name, using Luminary099 page images.
// RESTART_TABLES.agc:13
//#
// RESTART_TABLES.agc:14
//# This source code has been transcribed or otherwise adapted from
// RESTART_TABLES.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// RESTART_TABLES.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// RESTART_TABLES.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// RESTART_TABLES.agc:18
//# in storage size and consequent reduction in image quality as well) are
// RESTART_TABLES.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// RESTART_TABLES.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// RESTART_TABLES.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// RESTART_TABLES.agc:22
//# actually created.
// RESTART_TABLES.agc:23
//#
// RESTART_TABLES.agc:24
//# Notations on the hardcopy document read, in part:
// RESTART_TABLES.agc:25
//#
// RESTART_TABLES.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// RESTART_TABLES.agc:27
//#	16:27 JULY 14, 1969
// RESTART_TABLES.agc:28
//
// RESTART_TABLES.agc:29
//# Page 238
// RESTART_TABLES.agc:30
//# RESTART TABLES
// RESTART_TABLES.agc:31
//# ------------------
// RESTART_TABLES.agc:32
//#
// RESTART_TABLES.agc:33
//# THERE ARE TWO FORMS OF RESTART TABLES FOR EACH GROUP.  THEY ARE KNOWN AS THE EVEN RESTART TABLES AND THE ODD
// RESTART_TABLES.agc:34
//# RESTART TABLES.  THE ODD TABLES HAVE ONLY ONE ENTRY OF THREE LOCATIONS WHILE THE EVEN TABLES HAVE TWO ENTRIES
// RESTART_TABLES.agc:35
//# EACH USING THREE LOCATIONS. THE INFORMATION AS TO WHETHER IT IS A JOB, WAITLIST, OR A LONGCALL IS GIVEN BY THE
// RESTART_TABLES.agc:36
//# WAY THINGS ARE PUT INTO THE TABLES.
// RESTART_TABLES.agc:37
//#      A JOB HAS ITS PRIORITY STORED IN PRDTTAB OF THE CORRECT PHASE SPOT - A POSITIVE PRIORITY INDICATES A
// RESTART_TABLES.agc:38
//# FINDVAC JOB, A NEGATIVE PRIORITY A NOVAC.  THE 2CADR OF THE JOB IS STORED IN THE CADRTAB.
// RESTART_TABLES.agc:39
//# FOR EXAMPLE,
// RESTART_TABLES.agc:40
//#
// RESTART_TABLES.agc:41
//# 5.7SPOT	OCT	23000
// RESTART_TABLES.agc:42
//#		2CADR	SOMEJOB
// RESTART_TABLES.agc:43
//#
// RESTART_TABLES.agc:44
//# A RESTART OF GROUP 5 WITH PHASE SEVEN WOULD THEN CAUSE SOMEJOB TO BE RESTARTED AS A FINDVAC WITH PRIORITY 23.
// RESTART_TABLES.agc:45
//#
// RESTART_TABLES.agc:46
//# 5.5SPOT	OCT	-23000
// RESTART_TABLES.agc:47
//#		2CADR	ANYJOB
// RESTART_TABLES.agc:48
//#
// RESTART_TABLES.agc:49
//# HERE A RESTART OF GROUP 5 WITH PHASE 7 WOULD CAUSE ANYJOB TO BE RESTARTED AS A NOVAC WITH PRIORITY 23.
// RESTART_TABLES.agc:50
//# A LONGCALL HAS ITS GENADR OF ITS 2CADR STORED NEGATIVELY AND ITS BBCON STORED POSITIVELY.  IN ITS PRDTTAB IS
// RESTART_TABLES.agc:51
//# PLACED THE LOCATION OF A DP REGISTER THAT CONTAINS THE DELTA TIME THAT LONGCALL HAD BEEN ORIGINALLY STARTED
// RESTART_TABLES.agc:52
//# WITH.  EXAMPLE,
// RESTART_TABLES.agc:53
//#
// RESTART_TABLES.agc:54
//# 3.6SPOT	GENADR	DELTAT
// RESTART_TABLES.agc:55
//#	       -GENADR	LONGTASK
// RESTART_TABLES.agc:56
//#		BBCON	LONGTASK
// RESTART_TABLES.agc:57
//#
// RESTART_TABLES.agc:58
//#		OCT	31000
// RESTART_TABLES.agc:59
//#		2CADR	JOBAGAIN
// RESTART_TABLES.agc:60
//#
// RESTART_TABLES.agc:61
//# THIS WOULD START UP LONGTASK AT THE APPROPRIATE TIME, OR IMMEDIATELY IF THE TIME HAD ALREADY PASSED. IT SHOULD
// RESTART_TABLES.agc:62
//# BE NOTED THAT IF DELTAT IS IN A SWITCHED E BANK, THIS INFORMATOIN SHOULD BE IN THE BBCON OFTHE 2CADR OF THE
// RESTART_TABLES.agc:63
//# TASK.  FROM ABOVE, WE SEE THAT THE SECOND PART OF THIS PHASE WOULD BE STARTED AS A JOB WITH A PRIORITY OF 31.
// RESTART_TABLES.agc:64
//#
// RESTART_TABLES.agc:65
//# WAITLIST CALLS ARE IDENTIFIED BY THE FACT THAT THEIR 2CADR IS STORED NEGATIVELY. IF PRDTTAB OF THE PHASE SPOT
// RESTART_TABLES.agc:66
//# IS POSITIVE, THEN IT CONTAINS THE DELTA TIME, IF PRDTTAB IS NEGATIVE THEN IT IS THE -GENADR OF AN ERASABLE
// RESTART_TABLES.agc:67
//# LOCATION CONTAINING THE DELTA TIME, THAT IS, THE TIME IS STORED INDIRECTLY.  IT SHOULD BE NOTED AS ABOVE, THAT
// RESTART_TABLES.agc:68
//# IF THE TIME IS STORED INDIRECTLY, THE BBCON MUST CONTAIN THE NECESSARY E BANK INFORMATION IF APPLICABLE.  WITH
// RESTART_TABLES.agc:69
//# WAITLIST WE HAVE ONE FURTHER OPTION, IF -0 IS STORED IN PRDTTAB, IT WILL CAUSE AN IMMEDIATE RESTART OF THE
// RESTART_TABLES.agc:70
//# TASK.  EXAMPLES,
// RESTART_TABLES.agc:71
//#
// RESTART_TABLES.agc:72
//#		OCT	77777		# THIS WILL CAUSE AN IMMEDIATE RESTART
// RESTART_TABLES.agc:73
//#	       -2CADR	ATASK		# OF THE TASK :ATASK:
// RESTART_TABLES.agc:74
//#
// RESTART_TABLES.agc:75
//#		DEC	200		# IF THE TIME OF THE 2 SECONDS SINCE DUMMY
// RESTART_TABLES.agc:76
//#	       -2CADR	DUMMY		# WAS PUT ON THE WAITLIST IS UP, IT WILL BEGIN
// RESTART_TABLES.agc:77
//#					# IN 10 MS, OTHERWISE IT WILL BEGIN WHEN
// RESTART_TABLES.agc:78
//#					# IT NORMALLY WOULD HAVE BEGUN.
// RESTART_TABLES.agc:79
//# Page 239
// RESTART_TABLES.agc:80
//#	       -GENADR	DTIME		# WHERE DTIME CONTAINS THE DELTA TIME
// RESTART_TABLES.agc:81
//#	       -2CADR	TASKTASK	# OTHERWISE THIS IS AS ABOVE
// RESTART_TABLES.agc:82
//#
// RESTART_TABLES.agc:83
//# ***** NOW THE TABLES THEMSELVES *****
// RESTART_TABLES.agc:84
//
// RESTART_TABLES.agc:85
//		BANK	01
// RESTART_TABLES.agc:86
//		SETLOC	RESTART
// RESTART_TABLES.agc:87
//		BANK
// RESTART_TABLES.agc:88
//
// RESTART_TABLES.agc:89
//PRDTTAB		EQUALS	12000		# USED TO FIND THE PRIORITY OR DELTATIME
// RESTART_TABLES.agc:90
//CADRTAB		EQUALS	12001		# THIS AND THE NEXT RELATIVE LOC CONTAIN
// RESTART_TABLES.agc:91
//					# RESTART 2CADR
// RESTART_TABLES.agc:92
//
// RESTART_TABLES.agc:93
//		COUNT*	$$/RSTAB	# TABLES IN BANK 1.
// RESTART_TABLES.agc:94
//SIZETAB		TC	1.2SPOT -12006
// slot 3074
                if slot <> 3074 or instruction <> 8 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 8, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3075 {
// RESTART_TABLES.agc:95
//		TC	1.3SPOT -12004
// slot 3075
                    if slot <> 3075 or instruction <> 16 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 16, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:96
//		TC	2.2SPOT -12006
// slot 3076
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
// RESTART_TABLES.agc:97
//		TC	2.3SPOT	-12004
// slot 3077
                if slot <> 3077 or instruction <> 19 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 19, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3078 {
// RESTART_TABLES.agc:98
//		TC	3.2SPOT -12006
// slot 3078
                    if slot <> 3078 or instruction <> 8 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 8, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:99
//		TC	3.3SPOT -12004
// slot 3079
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
// RESTART_TABLES.agc:100
//		TC	4.2SPOT -12006
// slot 3080
                if slot <> 3080 or instruction <> 47 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 47, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3081 {
// RESTART_TABLES.agc:101
//		TC	4.3SPOT -12004
// slot 3081
                    if slot <> 3081 or instruction <> 55 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 55, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:102
//		TC	5.2SPOT -12006
// slot 3082
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
// RESTART_TABLES.agc:103
//		TC	5.3SPOT -12004
// slot 3083
                if slot <> 3083 or instruction <> 112 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 112, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3084 {
// RESTART_TABLES.agc:104
//		TC	6.2SPOT -12006
// slot 3084
                    if slot <> 3084 or instruction <> 8 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 8, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:105
//		TC	6.3SPOT -12004
// slot 3085
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
// RESTART_TABLES.agc:106
//1.2SPOT		OCT	21000		# A DUMMY EXAMPLE TO BE REPLACED AS SOON
// slot 3086
    3086, 17408,
// RESTART_TABLES.agc:107
//		EBANK=	STATE
// RESTART_TABLES.agc:108
//		2CADR	ENDOFJOB	# AS THERE IS A LEGITIMATE 1.2SPOT
// slot 3087 3088
    3087, 5338, 3088, 4192,
// RESTART_TABLES.agc:109
//
// RESTART_TABLES.agc:110
//		DEC	100
// slot 3089
    3089, 200,
// RESTART_TABLES.agc:111
//		EBANK=	STATE
// RESTART_TABLES.agc:112
//		2CADR	TASKOVER
// slot 3090 3091
    3090, 5474, 3091, 4192,
// RESTART_TABLES.agc:113
//
// RESTART_TABLES.agc:114
//# ANY MORE GROUP 1.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:115
//
// RESTART_TABLES.agc:116
//1.3SPOT	       -GENADR	SAVET-30
// slot 3092
    3092, 63872,
// RESTART_TABLES.agc:117
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:118
//	       -2CADR	ULLGTASK
// slot 3093 3094
    3093, 63026, 3094, 3984,
// RESTART_TABLES.agc:119
//
// RESTART_TABLES.agc:120
//# ANY MORE GROUP 1.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:121
//
// RESTART_TABLES.agc:122
//2.2SPOT		EQUALS	1.2SPOT
// RESTART_TABLES.agc:123
//# ANY MORE GROUP 2.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:124
//
// RESTART_TABLES.agc:125
//2.3SPOT		GENADR	600SECS
// slot 3095
    3095, 2864,
// RESTART_TABLES.agc:126
//	       -GENADR	STATEINT
// slot 3096
    3096, 62710,
// RESTART_TABLES.agc:127
//		EBANK=	RRECTCSM
// RESTART_TABLES.agc:128
//		BBCON	STATEINT
// slot 3097
    3097, 22630,
// RESTART_TABLES.agc:129
//
// RESTART_TABLES.agc:130
//# Page 240
// RESTART_TABLES.agc:131
//2.5SPOT		OCT	05000
// slot 3098
    3098, 5120,
// RESTART_TABLES.agc:132
//		EBANK=	RRECTCSM
// RESTART_TABLES.agc:133
//		2CADR	STATINT1
// slot 3099 3100
    3099, 2838, 3100, 22630,
// RESTART_TABLES.agc:134
//
// RESTART_TABLES.agc:135
//2.7SPOT		DEC	1500
// slot 3101
    3101, 3000,
// RESTART_TABLES.agc:136
//		EBANK=	LOSCOUNT
// RESTART_TABLES.agc:137
//	       -2CADR	P20LEMC1
// slot 3102 3103
    3102, 63158, 3103, 24464,
// RESTART_TABLES.agc:138
//
// RESTART_TABLES.agc:139
//2.11SPOT	OCT	14000
// slot 3104
    3104, 12288,
// RESTART_TABLES.agc:140
//		EBANK=	P21TIME
// RESTART_TABLES.agc:141
//		2CADR	P25LEM1
// slot 3105 3106
    3105, 2588, 3106, 41070,
// RESTART_TABLES.agc:142
//
// RESTART_TABLES.agc:143
//2.13SPOT	OCT	10000
// slot 3107
    3107, 8192,
// RESTART_TABLES.agc:144
//		EBANK=	LOSCOUNT
// RESTART_TABLES.agc:145
//		2CADR	RELINUS
// slot 3108 3109
    3108, 2334, 3109, 45166,
// RESTART_TABLES.agc:146
//
// RESTART_TABLES.agc:147
//2.15SPOT	OCT	26000
// slot 3110
    3110, 22528,
// RESTART_TABLES.agc:148
//		EBANK=	LOSCOUNT
// RESTART_TABLES.agc:149
//		2CADR	R22RSTRT
// slot 3111 3112
    3111, 2902, 3112, 41070,
// RESTART_TABLES.agc:150
//
// RESTART_TABLES.agc:151
//2.17SPOT	OCT	77777
// slot 3113
    3113, 65534,
// RESTART_TABLES.agc:152
//		EBANK=	VGPREV
// RESTART_TABLES.agc:153
//	       -2CADR	REDO2.17
// slot 3114 3115
    3114, 63040, 3115, 3984,
// RESTART_TABLES.agc:154
//
// RESTART_TABLES.agc:155
//2.21SPOT	DEC	25
// slot 3116
    3116, 50,
// RESTART_TABLES.agc:156
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:157
//	       -2CADR	R10,R11
// slot 3117 3118
    3117, 63474, 3118, 30608,
// RESTART_TABLES.agc:158
//
// RESTART_TABLES.agc:159
//# ANY MORE GROUP 2.ODD RESTART VALUES SHOULD GO HERE.
// RESTART_TABLES.agc:160
//
// RESTART_TABLES.agc:161
//3.2SPOT		EQUALS	1.2SPOT
// RESTART_TABLES.agc:162
//# ANY MORE GROUP 3.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:163
//
// RESTART_TABLES.agc:164
//3.3SPOT	       -GENADR	ZOOMTIME
// slot 3119
    3119, 63962,
// RESTART_TABLES.agc:165
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:166
//	       -2CADR	ZOOM
// slot 3120 3121
    3120, 63450, 3121, 34704,
// RESTART_TABLES.agc:167
//
// RESTART_TABLES.agc:168
//3.5SPOT		OCT	20000
// slot 3122
    3122, 16384,
// RESTART_TABLES.agc:169
//		EBANK=	TTOGO
// RESTART_TABLES.agc:170
//		2CADR	S40.13
// slot 3123 3124
    3123, 2752, 3124, 47214,
// RESTART_TABLES.agc:171
//
// RESTART_TABLES.agc:172
//# ANY MORE GROUP 3.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:173
//
// RESTART_TABLES.agc:174
//4.2SPOT		DEC	2500
// slot 3125
    3125, 5000,
// RESTART_TABLES.agc:175
//		EBANK=	TTOGO
// RESTART_TABLES.agc:176
//	       -2CADR	TIG-5
// slot 3126 3127
    3126, 63018, 3127, 3984,
// RESTART_TABLES.agc:177
//
// RESTART_TABLES.agc:178
//		OCT	77777
// slot 3128
    3128, 65534,
// RESTART_TABLES.agc:179
//		EBANK=	TTOGO
// RESTART_TABLES.agc:180
//# Page 241
// RESTART_TABLES.agc:181
//	       -2CADR	REDO4.2
// slot 3129 3130
    3129, 63034, 3130, 3984,
// RESTART_TABLES.agc:182
//
// RESTART_TABLES.agc:183
//# ANY MORE GROUP 4.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:184
//
// RESTART_TABLES.agc:185
//4.3SPOT		OCT	25000
// slot 3131
    3131, 21504,
// RESTART_TABLES.agc:186
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:187
//		2CADR	GOABORT
// slot 3132 3133
    3132, 3776, 3133, 53358,
// RESTART_TABLES.agc:188
//
// RESTART_TABLES.agc:189
//4.5SPOT		DEC	50
// slot 3134
    3134, 100,
// RESTART_TABLES.agc:190
//		EBANK=	TTOGO
// RESTART_TABLES.agc:191
//	       -2CADR	ULLAGOFF
// slot 3135 3136
    3135, 62746, 3136, 3984,
// RESTART_TABLES.agc:192
//
// RESTART_TABLES.agc:193
//4.7SPOT		DEC	500
// slot 3137
    3137, 1000,
// RESTART_TABLES.agc:194
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:195
//	       -2CADR	TIG-0
// slot 3138 3139
    3138, 62968, 3139, 3984,
// RESTART_TABLES.agc:196
//
// RESTART_TABLES.agc:197
//4.11SPOT       -GENADR	TGO +1
// slot 3140
    3140, 63840,
// RESTART_TABLES.agc:198
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:199
//	       -2CADR	ENGOFTSK
// slot 3141 3142
    3141, 61754, 3142, 3984,
// RESTART_TABLES.agc:200
//
// RESTART_TABLES.agc:201
//4.13SPOT	OCT	12000
// slot 3143
    3143, 10240,
// RESTART_TABLES.agc:202
//		EBANK=	TRKMKCNT
// RESTART_TABLES.agc:203
//		2CADR	POSTBURN
// slot 3144 3145
    3144, 3366, 3145, 61550,
// RESTART_TABLES.agc:204
//
// RESTART_TABLES.agc:205
//4.15SPOT	DEC	500
// slot 3146
    3146, 1000,
// RESTART_TABLES.agc:206
//		EBANK=	TTOGO
// RESTART_TABLES.agc:207
//	       -2CADR	TIG-30
// slot 3147 3148
    3147, 63106, 3148, 3984,
// RESTART_TABLES.agc:208
//
// RESTART_TABLES.agc:209
//4.17SPOT	OCT	77777
// slot 3149
    3149, 65534,
// RESTART_TABLES.agc:210
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:211
//	       -2CADR	TIG-5
// slot 3150 3151
    3150, 63018, 3151, 3984,
// RESTART_TABLES.agc:212
//
// RESTART_TABLES.agc:213
//4.21SPOT	OCT	13000
// slot 3152
    3152, 11264,
// RESTART_TABLES.agc:214
//		EBANK=	STAR
// RESTART_TABLES.agc:215
//		2CADR	R51.1 +1
// slot 3153 3154
    3153, 3104, 3154, 24682,
// RESTART_TABLES.agc:216
//
// RESTART_TABLES.agc:217
//4.23SPOT	OCT	77777
// slot 3155
    3155, 65534,
// RESTART_TABLES.agc:218
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:219
//	       -2CADR	IGNITION
// slot 3156 3157
    3156, 62930, 3157, 3984,
// RESTART_TABLES.agc:220
//
// RESTART_TABLES.agc:221
//4.25SPOT	GENADR	SAVET-30
// slot 3158
    3158, 1662,
// RESTART_TABLES.agc:222
//	       -GENADR	TIG-35
// slot 3159
    3159, 63166,
// RESTART_TABLES.agc:223
//		EBANK=	SAVET-30
// RESTART_TABLES.agc:224
//		BBCON	TIG-35
// slot 3160
    3160, 61550,
// RESTART_TABLES.agc:225
//
// RESTART_TABLES.agc:226
//4.27SPOT	OCT	52777
// slot 3161
    3161, 44030,
// RESTART_TABLES.agc:227
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:228
//		2CADR	P70A
// slot 3162 3163
    3162, 2166, 3163, 34926,
// RESTART_TABLES.agc:229
//
// RESTART_TABLES.agc:230
//# Page 242
// RESTART_TABLES.agc:231
//4.31SPOT	OCT	52777
// slot 3164
    3164, 44030,
// RESTART_TABLES.agc:232
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:233
//		2CADR	P71A
// slot 3165 3166
    3165, 2172, 3166, 34926
)).

agcAotInstallSourceRope(list(
// RESTART_TABLES.agc:234
//
// RESTART_TABLES.agc:235
//4.33SPOT	OCT	46777
// slot 3167
    3167, 39934,
// RESTART_TABLES.agc:236
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:237
//		2CADR	GOP00FIX
// slot 3168 3169
    3168, 2088, 3169, 8302,
// RESTART_TABLES.agc:238
//
// RESTART_TABLES.agc:239
//4.35SPOT	OCT	46777
// slot 3170
    3170, 39934,
// RESTART_TABLES.agc:240
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:241
//		2CADR	GOPOODOO
// slot 3171 3172
    3171, 5994, 3172, 4206,
// RESTART_TABLES.agc:242
//
// RESTART_TABLES.agc:243
//4.37SPOT	OCT	52777
// slot 3173
    3173, 44030,
// RESTART_TABLES.agc:244
//		EBANK=	WHICH
// RESTART_TABLES.agc:245
//		2CADR	COMFAIL
// slot 3174 3175
    3174, 2802, 3175, 61550,
// RESTART_TABLES.agc:246
//
// RESTART_TABLES.agc:247
//# ANY MORE 4.ODD RESTART VALUES SHOULD GO HERE.
// RESTART_TABLES.agc:248
//
// RESTART_TABLES.agc:249
//5.2SPOT		OCT	22000
// slot 3176
    3176, 18432,
// RESTART_TABLES.agc:250
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:251
//		2CADR	NORMLIZE
// slot 3177 3178
    3177, 2658, 3178, 39022,
// RESTART_TABLES.agc:252
//
// RESTART_TABLES.agc:253
//		DEC	200
// slot 3179
    3179, 400,
// RESTART_TABLES.agc:254
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:255
//	       -2CADR	REREADAC
// slot 3180 3181
    3180, 61670, 3181, 1936,
// RESTART_TABLES.agc:256
//
// RESTART_TABLES.agc:257
//5.4SPOT		DEC	200
// slot 3182
    3182, 400,
// RESTART_TABLES.agc:258
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:259
//	       -2CADR	REREADAC
// slot 3183 3184
    3183, 61670, 3184, 1936,
// RESTART_TABLES.agc:260
//
// RESTART_TABLES.agc:261
//		OCT	20000
// slot 3185
    3185, 16384,
// RESTART_TABLES.agc:262
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:263
//		2CADR	SERVICER
// slot 3186 3187
    3186, 2316, 3187, 55406,
// RESTART_TABLES.agc:264
//
// RESTART_TABLES.agc:265
//# ANY MORE GROUP 5.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:266
//
// RESTART_TABLES.agc:267
//5.3SPOT		DEC	200
// slot 3188
    3188, 400,
// RESTART_TABLES.agc:268
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:269
//	       -2CADR	REREADAC
// slot 3189 3190
    3189, 61670, 3190, 1936,
// RESTART_TABLES.agc:270
//
// RESTART_TABLES.agc:271
//5.5SPOT		OCT	77777
// slot 3191
    3191, 65534,
// RESTART_TABLES.agc:272
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:273
//	       -2CADR	REDO5.5
// slot 3192 3193
    3192, 61864, 3193, 1936,
// RESTART_TABLES.agc:274
//
// RESTART_TABLES.agc:275
//5.7SPOT		OCT	77777
// slot 3194
    3194, 65534,
// RESTART_TABLES.agc:276
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:277
//# Page 243
// RESTART_TABLES.agc:278
//	       -2CADR	BIBIBIAS
// slot 3195 3196
    3195, 61922, 3196, 1936,
// RESTART_TABLES.agc:279
//
// RESTART_TABLES.agc:280
//# ANY MORE GROUP 5.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:281
//
// RESTART_TABLES.agc:282
//6.2SPOT		EQUALS	1.2SPOT
// RESTART_TABLES.agc:283
//6.3SPOT		DEC	100
// slot 3197
    3197, 200,
// RESTART_TABLES.agc:284
//		EBANK=	TIG
// RESTART_TABLES.agc:285
//	       -2CADR	CLOKTASK
// slot 3198 3199
    3198, 62560, 3199, 3984,
// RESTART_TABLES.agc:286
//
// RESTART_TABLES.agc:287
//6.5SPOT		OCT	30000		# PROTECT INCREMENTING OF TIME2,TIME1 BY
// slot 3200
    3200, 24576,
// RESTART_TABLES.agc:288
//		EBANK=	TEPHEM		# P27(UPDATE PROGRAM) VIA V70 OR V73.
// RESTART_TABLES.agc:289
//		2CADR	TIMEDIDR
// slot 3201 3202
    3201, 3842, 3202, 8294,
// RESTART_TABLES.agc:290
//
// RESTART_TABLES.agc:291
//6.7SPOT		OCT	17000
// slot 3203
    3203, 15360,
// RESTART_TABLES.agc:292
//		EBANK=	VGPREV
// RESTART_TABLES.agc:293
//		2CADR	REDO6.7
// slot 3204 3205
    3204, 3536, 3205, 61550
)).

