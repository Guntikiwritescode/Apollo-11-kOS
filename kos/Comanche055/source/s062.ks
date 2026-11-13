// RESTART_TABLES.agc
// bank 01, slots 3072-3083
function agcAotUnit50 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3077 {
        if slot <= 3074 {
            if slot <= 3072 {
// RESTART_TABLES.agc:1
//# Copyright:	Public domain.
// RESTART_TABLES.agc:2
//# Filename:	RESTART_TABLES.agc
// RESTART_TABLES.agc:3
//# Purpose:	Part of the source code for Comanche, build 055. It
// RESTART_TABLES.agc:4
//#		is part of the source code for the Command Module's
// RESTART_TABLES.agc:5
//#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
// RESTART_TABLES.agc:6
//# Assembler:	yaYUL
// RESTART_TABLES.agc:7
//# Reference:	pp. 211-221
// RESTART_TABLES.agc:8
//# Contact:	Burkey Kerman <info@sandroid.org>,
// RESTART_TABLES.agc:9
//#  		Bernardini Kerman <fabrizio@spacecraft.it>
// RESTART_TABLES.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// RESTART_TABLES.agc:11
//# Mod history:	2009-05-16 FB	Transcription Batch 2 Assignment.
// RESTART_TABLES.agc:12
//#		2009-05-20 RSB	Added a missing comment mark.  Corrected mismarked
// RESTART_TABLES.agc:13
//#				Page 217 -> 220.
// RESTART_TABLES.agc:14
//#		2009-05-21 RSB	Fixed value of 5.21SPOT.
// RESTART_TABLES.agc:15
//#
// RESTART_TABLES.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// RESTART_TABLES.agc:17
//# from scanned documents.
// RESTART_TABLES.agc:18
//#
// RESTART_TABLES.agc:19
//#	Assemble revision 055 of AGC program Comanche by NASA
// RESTART_TABLES.agc:20
//#	2021113-051.  April 1, 1969.
// RESTART_TABLES.agc:21
//#
// RESTART_TABLES.agc:22
//#	This AGC program shall also be referred to as Colossus 2A
// RESTART_TABLES.agc:23
//#
// RESTART_TABLES.agc:24
//#	Prepared by
// RESTART_TABLES.agc:25
//#			Massachusetts Institute of Technology
// RESTART_TABLES.agc:26
//#			75 Cambridge Parkway
// RESTART_TABLES.agc:27
//#			Cambridge, Massachusetts
// RESTART_TABLES.agc:28
//#
// RESTART_TABLES.agc:29
//#	under NASA contract NAS 9-4065.
// RESTART_TABLES.agc:30
//#
// RESTART_TABLES.agc:31
//# Refer directly to the online document mentioned above for further
// RESTART_TABLES.agc:32
//# information.  Please report any errors to info@sandroid.org.
// RESTART_TABLES.agc:33
//
// RESTART_TABLES.agc:34
//# Page 211
// RESTART_TABLES.agc:35
//# RESTART TABLES
// RESTART_TABLES.agc:36
//# --------------
// RESTART_TABLES.agc:37
//#
// RESTART_TABLES.agc:38
//# THERE ARE TWO FORMS OF RESTART TABLES FOR EACH GROUP.  THEY ARE KNOWN AS THE EVEN RESTART TABLES AND THE ODD
// RESTART_TABLES.agc:39
//# RESTART TABLES.  THE ODD TABLES HAVE ONLY ONE ENTRY OF THREE LOCATIONS WHILE THE EVEN TABLES HAVE TWO ENTRIES
// RESTART_TABLES.agc:40
//# EACH USING THREE LOCATIONS. THE INFORMATION AS TO WHETHER IT IS A JOB, WAITLIST, OR A LONGCALL IS GIVEN BY THE
// RESTART_TABLES.agc:41
//# WAY THINGS ARE PUT INTO THE TABLES.
// RESTART_TABLES.agc:42
//#
// RESTART_TABLES.agc:43
//# A JOB HAS ITS PRIORITY STORED IN PRDTTAB OF THE CORRECT PHASE SPOT - A POSITIVE PRIORITY INDICATES A
// RESTART_TABLES.agc:44
//# FINDVAC JOB, A NEGATIVE PRIORITY A NOVAC.  THE 2CADR OF THE JOB IS STORED IN THE CADRTAB.
// RESTART_TABLES.agc:45
//# FOR EXAMPLE,
// RESTART_TABLES.agc:46
//#
// RESTART_TABLES.agc:47
//#		5.7SPOT		OCT	23000
// RESTART_TABLES.agc:48
//#				2CADR	SOMEJOB
// RESTART_TABLES.agc:49
//#
// RESTART_TABLES.agc:50
//# A RESTART OF GROUP 5 WITH PHASE SEVEN WOULD THEN CAUSE SOMEJOB TO BE RESTARTED AS A FINDVAC WITH PRIORITY 23.
// RESTART_TABLES.agc:51
//#
// RESTART_TABLES.agc:52
//#		5.5SPOT		OCT	-23000
// RESTART_TABLES.agc:53
//#				2CADR	ANYJOB
// RESTART_TABLES.agc:54
//#
// RESTART_TABLES.agc:55
//# HERE A RESTART OF GROUP 5 WITH PHASE 7 WOULD CAUSE ANYJOB TO BE RESTARTED AS A NOVAC WITH PRIORITY 23.
// RESTART_TABLES.agc:56
//# A LONGCALL HAS ITS GENADR OF ITS 2CADR STORED NEGATIVELY AND ITS BBCON STORED POSITIVELY.  IN ITS PRDTTAB IS
// RESTART_TABLES.agc:57
//# PLACED THE LOCATION OF A DP REGISTER THAT CONTAINS THE DELTA TIME THAT LONGCALL HAD BEEN ORIGINALLY STARTED
// RESTART_TABLES.agc:58
//# WITH.  EXAMPLE,
// RESTART_TABLES.agc:59
//#
// RESTART_TABLES.agc:60
//#		3.6SPOT		GENADR	DELTAT
// RESTART_TABLES.agc:61
//#				-GENADR	LONGTASK
// RESTART_TABLES.agc:62
//#				BBCON	LONGTASK
// RESTART_TABLES.agc:63
//
// RESTART_TABLES.agc:64
//#				OCT	31000
// RESTART_TABLES.agc:65
//#				2CADR	JOBAGAIN
// RESTART_TABLES.agc:66
//#
// RESTART_TABLES.agc:67
//# THIS WOULD START UP LONGTASK AT THE APPROPRIATE TIME, OR IMMEDIATELY IF THE TIME HAD ALREADY PASSED. IT SHOULD
// RESTART_TABLES.agc:68
//# BE NOTED THAT IF DELTAT IS IN A SWITCHED E BANK, THIS INFORMATION SHOULD BE IN THE BBCON OF THE 2CADR OF THE
// RESTART_TABLES.agc:69
//# TASK.  FROM ABOVE, WE SEE THAT THE SECOND PART OF THIS PHASE WOULD BE STARTED AS A JOB WITH A PRIORITY OF 31.
// RESTART_TABLES.agc:70
//#
// RESTART_TABLES.agc:71
//# WAITLIST CALLS ARE IDENTIFIED BY THE FACT THAT THEIR 2CADR IS STORED NEGATIVELY.  IF PRDTTAB OF THE PHASE SPOT
// RESTART_TABLES.agc:72
//# IS POSITIVE, THEN IT CONTAINS THE DELTA TIME, IF PRDTTAB IS NEGATIVE THEN IT IS THE -GENADR OF AN ERASABLE
// RESTART_TABLES.agc:73
//# LOCATION CONTAINING THE DELTA TIME, THAT IS, THE TIME IS STORED INDIRECTLY.  IT SHOULD BE NOTED AS ABOVE, THAT
// RESTART_TABLES.agc:74
//# IF THE TIME IS STORED INDIRECTLY, THE BBCON MUST CONTAIN THE NECESSARY E BANK INFORMATION IF APPLICABLE.  WITH
// RESTART_TABLES.agc:75
//# WAITLIST WE HAVE ONE FURTHER OPTION, IF -0 IS STORED IN PRDTTAB, IT WILL CAUSE AN IMMEDIATE RESTART OF THE
// RESTART_TABLES.agc:76
//# TASK.  EXAMPLES,
// RESTART_TABLES.agc:77
//#
// RESTART_TABLES.agc:78
//#				OCT	77777		# THIS WILL CAUSE AN IMMEDIATE RESTART
// RESTART_TABLES.agc:79
//#				-2CADR	ATASK		# OF THE TASK :ATASK:
// RESTART_TABLES.agc:80
//#
// RESTART_TABLES.agc:81
//#				DEC	200		# IF THE TIME OF THE 2 SECONDS SINCE DUMMY
// RESTART_TABLES.agc:82
//#				-2CADR	DUMMY		# WAS PUT ON THE WAITLIST IS UP, IT WILL BEGIN
// RESTART_TABLES.agc:83
//#							# IN 10 MS, OTHERWISE IT WILL BEGIN WHEN
// RESTART_TABLES.agc:84
//#							# IT NORMALLY WOULD HAVE BEGUN.
// RESTART_TABLES.agc:85
//# Page 212
// RESTART_TABLES.agc:86
//#				-GENADR	DTIME		# WHERE DTIME CONTAINS THE DELTA TIME
// RESTART_TABLES.agc:87
//#				-2CADR	TASKTASK	# OTHERWISE THIS IS AS ABOVE
// RESTART_TABLES.agc:88
//#
// RESTART_TABLES.agc:89
//# ***** NOW THE TABLES THEMSELVES *****
// RESTART_TABLES.agc:90
//
// RESTART_TABLES.agc:91
//		BANK	01
// RESTART_TABLES.agc:92
//		SETLOC	RESTART
// RESTART_TABLES.agc:93
//		BANK
// RESTART_TABLES.agc:94
//
// RESTART_TABLES.agc:95
//		COUNT	01/RSTAB
// RESTART_TABLES.agc:96
//
// RESTART_TABLES.agc:97
//PRDTTAB		EQUALS	12000			# USED TO FIND THE PRIORITY OR DELTATIME
// RESTART_TABLES.agc:98
//CADRTAB		EQUALS	12001			# THIS AND THE NEXT RELATIVE LOC CONTAIN
// RESTART_TABLES.agc:99
//						# RESTART 2CADR
// RESTART_TABLES.agc:100
//
// RESTART_TABLES.agc:101
//SIZETAB		TC	1.2SPOT -12006
// slot 3072
                if slot <> 3072 or instruction <> 51 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 51, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3073 {
// RESTART_TABLES.agc:102
//		TC	1.3SPOT -12004
// slot 3073
                    if slot <> 3073 or instruction <> 8 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 8, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:103
//		TC	2.2SPOT -12006
// slot 3074
                    if slot <> 3074 or instruction <> 51 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 51, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3075 {
// RESTART_TABLES.agc:104
//		TC	2.3SPOT	-12004
// slot 3075
                if slot <> 3075 or instruction <> 20 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3076 {
// RESTART_TABLES.agc:105
//		TC	3.2SPOT -12006
// slot 3076
                    if slot <> 3076 or instruction <> 51 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 51, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:106
//		TC	3.3SPOT -12004
// slot 3077
                    if slot <> 3077 or instruction <> 35 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 35, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3080 {
            if slot <= 3078 {
// RESTART_TABLES.agc:107
//		TC	4.2SPOT -12006
// slot 3078
                if slot <> 3078 or instruction <> 51 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 51, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3079 {
// RESTART_TABLES.agc:108
//		TC	4.3SPOT -12004
// slot 3079
                    if slot <> 3079 or instruction <> 71 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 71, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:109
//		TC	5.2SPOT -12006
// slot 3080
                    if slot <> 3080 or instruction <> 162 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 162, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3081 {
// RESTART_TABLES.agc:110
//		TC	5.3SPOT -12004
// slot 3081
                if slot <> 3081 or instruction <> 176 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 176, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3082 {
// RESTART_TABLES.agc:111
//		TC	6.2SPOT -12006
// slot 3082
                    if slot <> 3082 or instruction <> 222 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 222, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:112
//		TC	6.3SPOT -12004
// slot 3083
                    if slot <> 3083 or instruction <> 230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 230, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[50] to agcAotUnit50@.

agcAotInstallSourceRope(list(
// RESTART_TABLES.agc:113
//1.2SPOT		EQUALS	3.2SPOT
// RESTART_TABLES.agc:114
//
// RESTART_TABLES.agc:115
//# ANY MORE GROUP 1.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:116
//
// RESTART_TABLES.agc:117
//1.3SPOT		DEC	120			# THIS NUMBER MUST BE EQUAL C(JTAGTIME)
// slot 3084
    3084, 240,
// RESTART_TABLES.agc:118
//		EBANK=	AOG
// RESTART_TABLES.agc:119
//		-2CADR	SETJTAG
// slot 3085 3086
    3085, 62192, 3086, 38802,
// RESTART_TABLES.agc:120
//
// RESTART_TABLES.agc:121
//1.5SPOT		OCT	10000
// slot 3087
    3087, 8192,
// RESTART_TABLES.agc:122
//		EBANK=	DAPDATR1
// RESTART_TABLES.agc:123
//		2CADR	REDO40.9
// slot 3088 3089
    3088, 2570, 3089, 28780,
// RESTART_TABLES.agc:124
//
// RESTART_TABLES.agc:125
//1.7SPOT		OCT	10000
// slot 3090
    3090, 8192,
// RESTART_TABLES.agc:126
//		EBANK=	ESTROKER
// RESTART_TABLES.agc:127
//		2CADR	RELINUS
// slot 3091 3092
    3091, 2168, 3092, 47212,
// RESTART_TABLES.agc:128
//
// RESTART_TABLES.agc:129
//1.11SPOT	OCT	10000
// slot 3093
    3093, 8192,
// RESTART_TABLES.agc:130
//		EBANK=	ESTROKER
// RESTART_TABLES.agc:131
//		2CADR	PIKUP20
// slot 3094 3095
    3094, 2506, 3095, 63596,
// RESTART_TABLES.agc:132
//
// RESTART_TABLES.agc:133
//# ANY MORE GROUP 1.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:134
//
// RESTART_TABLES.agc:135
//2.2SPOT		EQUALS	1.2SPOT
// RESTART_TABLES.agc:136
//
// RESTART_TABLES.agc:137
//# ANY MORE GROUP 2.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:138
//# Page 213
// RESTART_TABLES.agc:139
//
// RESTART_TABLES.agc:140
//2.3SPOT		GENADR	600SECS
// slot 3096
    3096, 2904,
// RESTART_TABLES.agc:141
//		-GENADR	STATEINT
// slot 3097
    3097, 62672,
// RESTART_TABLES.agc:142
//		EBANK=	RRECTCSM
// RESTART_TABLES.agc:143
//		BBCON	STATEINT
// slot 3098
    3098, 22630,
// RESTART_TABLES.agc:144
//
// RESTART_TABLES.agc:145
//2.5SPOT		OCT	05000
// slot 3099
    3099, 5120,
// RESTART_TABLES.agc:146
//		EBANK=	RRECTCSM
// RESTART_TABLES.agc:147
//		2CADR	STATINT1
// slot 3100 3101
    3100, 2876, 3101, 22630,
// RESTART_TABLES.agc:148
//
// RESTART_TABLES.agc:149
//2.7SPOT		OCT	10000
// slot 3102
    3102, 8192,
// RESTART_TABLES.agc:150
//		EBANK=	MRKBUF2
// RESTART_TABLES.agc:151
//		2CADR	R22
// slot 3103 3104
    3103, 2864, 3104, 57454,
// RESTART_TABLES.agc:152
//
// RESTART_TABLES.agc:153
//2.11SPOT	OCT	14000
// slot 3105
    3105, 12288,
// RESTART_TABLES.agc:154
//		EBANK=	LANDMARK
// RESTART_TABLES.agc:155
//		2CADR	V94ENTER
// slot 3106 3107
    3106, 2812, 3107, 51306,
// RESTART_TABLES.agc:156
//
// RESTART_TABLES.agc:157
//2.13SPOT	OCT	10000
// slot 3108
    3108, 8192,
// RESTART_TABLES.agc:158
//		EBANK=	MRKBUF2
// RESTART_TABLES.agc:159
//		2CADR	REDOR22
// slot 3109 3110
    3109, 2558, 3110, 47214,
// RESTART_TABLES.agc:160
//
// RESTART_TABLES.agc:161
//# ANY MORE GROUP 2.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:162
//
// RESTART_TABLES.agc:163
//3.2SPOT		EQUALS	4.2SPOT
// RESTART_TABLES.agc:164
//
// RESTART_TABLES.agc:165
//# ANY MORE GROUP 3.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:166
//
// RESTART_TABLES.agc:167
//3.3SPOT		OCT	20000
// slot 3111
    3111, 16384,
// RESTART_TABLES.agc:168
//		EBANK=	TGO
// RESTART_TABLES.agc:169
//		2CADR	S40.13
// slot 3112 3113
    3112, 2606, 3113, 28782,
// RESTART_TABLES.agc:170
//
// RESTART_TABLES.agc:171
//3.5SPOT		DEC	0
// slot 3114
    3114, 0,
// RESTART_TABLES.agc:172
//		DEC	0
// slot 3115
    3115, 0,
// RESTART_TABLES.agc:173
//		DEC	0
// slot 3116
    3116, 0,
// RESTART_TABLES.agc:174
//3.7SPOT		OCT	22000
// slot 3117
    3117, 18432,
// RESTART_TABLES.agc:175
//		EBANK=	TEPHEM
// RESTART_TABLES.agc:176
//		2CADR	MATRXJOB
// slot 3118 3119
    3118, 2206, 3119, 57446,
// RESTART_TABLES.agc:177
//
// RESTART_TABLES.agc:178
//3.11SPOT	OCT	22000
// slot 3120
    3120, 18432,
// RESTART_TABLES.agc:179
//		EBANK=	TEPHEM
// RESTART_TABLES.agc:180
//		2CADR	REP11
// slot 3121 3122
    3121, 2390, 3122, 57446,
// RESTART_TABLES.agc:181
//
// RESTART_TABLES.agc:182
//3.13SPOT	OCT	22000
// slot 3123
    3123, 18432,
// RESTART_TABLES.agc:183
//		EBANK=	TEPHEM
// RESTART_TABLES.agc:184
//		2CADR	REP11A
// slot 3124 3125
    3124, 2092, 3125, 57446,
// RESTART_TABLES.agc:185
//
// RESTART_TABLES.agc:186
//3.15SPOT	-GENADR	TGO +1
// slot 3126
    3126, 63950,
// RESTART_TABLES.agc:187
//		EBANK=	TGO
// RESTART_TABLES.agc:188
//		-2CADR	ENGINOFF
// slot 3127 3128
    3127, 62482, 3128, 24464,
// RESTART_TABLES.agc:189
//
// RESTART_TABLES.agc:190
//# Page 214
// RESTART_TABLES.agc:191
//# ANY MORE GROUP 3.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:192
//
// RESTART_TABLES.agc:193
//4.2SPOT		OCT	77777
// slot 3129
    3129, 65534,
// RESTART_TABLES.agc:194
//		EBANK=	TIG
// RESTART_TABLES.agc:195
//		-2CADR	PRECHECK
// slot 3130 3131
    3130, 62734, 3131, 24464,
// RESTART_TABLES.agc:196
//
// RESTART_TABLES.agc:197
//		OCT	30000
// slot 3132
    3132, 24576,
// RESTART_TABLES.agc:198
//		EBANK=	DELVIMU
// RESTART_TABLES.agc:199
//		2CADR	P47BODY
// slot 3133 3134
    3133, 2744, 3134, 41070,
// RESTART_TABLES.agc:200
//
// RESTART_TABLES.agc:201
//4.4SPOT		OCT	77777
// slot 3135
    3135, 65534,
// RESTART_TABLES.agc:202
//		EBANK=	TIG
// RESTART_TABLES.agc:203
//		-2CADR	PRECHECK
// slot 3136 3137
    3136, 62734, 3137, 24464,
// RESTART_TABLES.agc:204
//
// RESTART_TABLES.agc:205
//		DEC	2996
// slot 3138
    3138, 5992,
// RESTART_TABLES.agc:206
//		EBANK=	DAPDATR1
// RESTART_TABLES.agc:207
//		-2CADR	TTG/0
// slot 3139 3140
    3139, 63046, 3140, 24466,
// RESTART_TABLES.agc:208
//
// RESTART_TABLES.agc:209
//4.6SPOT		OCT	77777
// slot 3141
    3141, 65534,
// RESTART_TABLES.agc:210
//		EBANK=	TIG
// RESTART_TABLES.agc:211
//		-2CADR	PRECHECK
// slot 3142 3143
    3142, 62734, 3143, 24464,
// RESTART_TABLES.agc:212
//
// RESTART_TABLES.agc:213
//		DEC	2496
// slot 3144
    3144, 4992,
// RESTART_TABLES.agc:214
//		EBANK=	TIG
// RESTART_TABLES.agc:215
//		-2CADR	TIG-5
// slot 3145 3146
    3145, 62726, 3146, 24464,
// RESTART_TABLES.agc:216
//
// RESTART_TABLES.agc:217
//# ANY MORE GROUP 4.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:218
//
// RESTART_TABLES.agc:219
//4.3SPOT		DEC	40
// slot 3147
    3147, 80,
// RESTART_TABLES.agc:220
//		EBANK=	PACTOFF
// RESTART_TABLES.agc:221
//		-2CADR	DOTVCON
// slot 3148 3149
    3148, 62618, 3149, 24466,
// RESTART_TABLES.agc:222
//
// RESTART_TABLES.agc:223
//4.5SPOT		DEC	160
// slot 3150
    3150, 320,
// RESTART_TABLES.agc:224
//		EBANK=	PACTOFF
// RESTART_TABLES.agc:225
//		-2CADR	DOSTRULL
// slot 3151 3152
    3151, 62568, 3152, 24466,
// RESTART_TABLES.agc:226
//
// RESTART_TABLES.agc:227
//4.7SPOT		DEC	500
// slot 3153
    3153, 1000,
// RESTART_TABLES.agc:228
//		EBANK=	PACTOFF
// RESTART_TABLES.agc:229
//		-2CADR	TIG-0
// slot 3154 3155
    3154, 62698, 3155, 24466,
// RESTART_TABLES.agc:230
//
// RESTART_TABLES.agc:231
//4.11SPOT	DEC	250
// slot 3156
    3156, 500,
// RESTART_TABLES.agc:232
//		EBANK=	DAPDATR1
// RESTART_TABLES.agc:233
//		-2CADR	V97E40.6
// slot 3157 3158
    3157, 61754, 3158, 24466,
// RESTART_TABLES.agc:234
//
// RESTART_TABLES.agc:235
//4.13SPOT	DEC	200
// slot 3159
    3159, 400,
// RESTART_TABLES.agc:236
//		EBANK=	WHOCARES
// RESTART_TABLES.agc:237
//		-2CADR	R40ENABL
// slot 3160 3161
    3160, 61808, 3161, 24464,
// RESTART_TABLES.agc:238
//
// RESTART_TABLES.agc:239
//4.15SPOT	OCT	16000			# PRELAUNCH OPTICAL VERIFICATION
// slot 3162
    3162, 14336,
// RESTART_TABLES.agc:240
//		EBANK=	OGC
// RESTART_TABLES.agc:241
//# Page 215
// RESTART_TABLES.agc:242
//		2CADR	COMPVER			# CALLS FOR OPTICS DATA AGAIN (STD LEADIN)
// slot 3163 3164
    3163, 2048, 3164, 55402
)).

agcAotInstallSourceRope(list(
// RESTART_TABLES.agc:243
//
// RESTART_TABLES.agc:244
//4.17SPOT	OCT	16000			#  PRELAUNCH AZIMUTH CHANGE
// slot 3165
    3165, 14336,
// RESTART_TABLES.agc:245
//		EBANK=	XSM
// RESTART_TABLES.agc:246
//		2CADR	AZMTHCG1
// slot 3166 3167
    3166, 4036, 3167, 55402,
// RESTART_TABLES.agc:247
//
// RESTART_TABLES.agc:248
//4.21SPOT	GENADR	P40TMP			# DELTA TIME USED IN SETTING UP
// slot 3168
    3168, 1908,
// RESTART_TABLES.agc:249
//		-GENADR	TIGBLNK			# LONG CALL OF TIGBLNK  BY P40,P41
// slot 3169
    3169, 62912,
// RESTART_TABLES.agc:250
//		EBANK=	P40TMP
// RESTART_TABLES.agc:251
//		BBCON	TIGBLNK
// slot 3170
    3170, 41070,
// RESTART_TABLES.agc:252
//4.23SPOT	OCT	12000			# PROTECT  P40S/SV BY P40 P41
// slot 3171
    3171, 10240,
// RESTART_TABLES.agc:253
//		EBANK=	TIG
// RESTART_TABLES.agc:254
//		2CADR	P40S/SV
// slot 3172 3173
    3172, 2312, 3173, 41070,
// RESTART_TABLES.agc:255
//
// RESTART_TABLES.agc:256
//4.25SPOT	OCT	24000
// slot 3174
    3174, 20480,
// RESTART_TABLES.agc:257
//		EBANK=	BESTI
// RESTART_TABLES.agc:258
//		2CADR	PROG52
// slot 3175 3176
    3175, 2048, 3176, 26720,
// RESTART_TABLES.agc:259
//
// RESTART_TABLES.agc:260
//4.27SPOT	DEC	250
// slot 3177
    3177, 500,
// RESTART_TABLES.agc:261
//		EBANK=	PACTOFF
// RESTART_TABLES.agc:262
//		-2CADR	DOTVCRCS
// slot 3178 3179
    3178, 62458, 3179, 24466,
// RESTART_TABLES.agc:263
//
// RESTART_TABLES.agc:264
//4.31SPOT	OCT	13000
// slot 3180
    3180, 11264,
// RESTART_TABLES.agc:265
//		EBANK=	STAR
// RESTART_TABLES.agc:266
//		2CADR	R51 +1
// slot 3181 3182
    3181, 2742, 3182, 24682,
// RESTART_TABLES.agc:267
//
// RESTART_TABLES.agc:268
//4.33SPOT	DEC	2100			# PROTECT CONTINUING JOB TO START P63
// slot 3183
    3183, 4200,
// RESTART_TABLES.agc:269
//		EBANK=	AOG
// RESTART_TABLES.agc:270
//		-2CADR	WAKEP62
// slot 3184 3185
    3184, 62982, 3185, 20370,
// RESTART_TABLES.agc:271
//
// RESTART_TABLES.agc:272
//4.35SPOT	OCT	12000
// slot 3186
    3186, 10240,
// RESTART_TABLES.agc:273
//		EBANK=	DAPDATR1
// RESTART_TABLES.agc:274
//		2CADR	POSTBURN
// slot 3187 3188
    3187, 2380, 3188, 41068,
// RESTART_TABLES.agc:275
//
// RESTART_TABLES.agc:276
//4.37SPOT	DEC	500
// slot 3189
    3189, 1000,
// RESTART_TABLES.agc:277
//		EBANK=	TIG
// RESTART_TABLES.agc:278
//		-2CADR	TIGAVEG
// slot 3190 3191
    3190, 62756, 3191, 24464,
// RESTART_TABLES.agc:279
//
// RESTART_TABLES.agc:280
//4.41SPOT	OCT	17000			# PROTECT DISPLAY JOB IN P67
// slot 3192
    3192, 15360,
// RESTART_TABLES.agc:281
//		EBANK=	AOG
// RESTART_TABLES.agc:282
//		2CADR	P67.1
// slot 3193 3194
    3193, 2708, 3194, 45164,
// RESTART_TABLES.agc:283
//
// RESTART_TABLES.agc:284
//4.43SPOT	-GENADR	S61DT			# PROTECT TASK TO START PREREAD,ENTRY
// slot 3195
    3195, 63494,
// RESTART_TABLES.agc:285
//		EBANK=	S61DT			# S61.1C WILL CHANGE EBANK=EB7 FOR PREREAD
// RESTART_TABLES.agc:286
//		-2CADR	S61.1C
// slot 3196 3197
    3196, 62740, 3197, 20370,
// RESTART_TABLES.agc:287
//
// RESTART_TABLES.agc:288
//4.45SPOT	OCT	13000			# PROTECT CONTINUING JOB S61.1
// slot 3198
    3198, 11264,
// RESTART_TABLES.agc:289
//		EBANK=	AOG			# (ENTRY IMU ALIGNMENT)
// RESTART_TABLES.agc:290
//# Page 216
// RESTART_TABLES.agc:291
//		2CADR	S61.1A -1
// slot 3199 3200
    3199, 2822, 3200, 45164,
// RESTART_TABLES.agc:292
//
// RESTART_TABLES.agc:293
//4.47SPOT	OCT	17000			# PROTECT HUNTEST ITERATION.
// slot 3201
    3201, 15360,
// RESTART_TABLES.agc:294
//		EBANK=	AOG
// RESTART_TABLES.agc:295
//		2CADR	PRE-HUNT
// slot 3202 3203
    3202, 3096, 3203, 43116,
// RESTART_TABLES.agc:296
//
// RESTART_TABLES.agc:297
//4.51SPOT	OCT	77777			# PROTECT FDAI ATTITUDE
// slot 3204
    3204, 65534,
// RESTART_TABLES.agc:298
//		EBANK=	BODY3			# ERROR DISPLAY IN P11
// RESTART_TABLES.agc:299
//		-2CADR	ATERTASK
// slot 3205 3206
    3205, 63070, 3206, 8082,
// RESTART_TABLES.agc:300
//
// RESTART_TABLES.agc:301
//4.53SPOT	DEC	-0
// slot 3207
    3207, 65534,
// RESTART_TABLES.agc:302
//		EBANK=	END-E7			# EBANK7 FOR TIG
// RESTART_TABLES.agc:303
//		-2CADR	V97ETASK
// slot 3208 3209
    3208, 61784, 3209, 24464,
// RESTART_TABLES.agc:304
//
// RESTART_TABLES.agc:305
//4.55SPOT	OCT	13000			# PROTECT  P65 RESPONSIVE DISPLAY.
// slot 3210
    3210, 11264,
// RESTART_TABLES.agc:306
//		EBANK=	RTINIT
// RESTART_TABLES.agc:307
//		2CADR	P65.1
// slot 3211 3212
    3211, 2654, 3212, 45166,
// RESTART_TABLES.agc:308
//
// RESTART_TABLES.agc:309
//4.57SPOT	-GENADR	P40TMP
// slot 3213
    3213, 63626,
// RESTART_TABLES.agc:310
//		EBANK=	P40TMP
// RESTART_TABLES.agc:311
//		-2CADR	TIGON
// slot 3214 3215
    3214, 62846, 3215, 24464,
// RESTART_TABLES.agc:312
//
// RESTART_TABLES.agc:313
//4.61SPOT	OCT	77777
// slot 3216
    3216, 65534,
// RESTART_TABLES.agc:314
//		EBANK=	PACTOFF
// RESTART_TABLES.agc:315
//		-2CADR	IGNITION
// slot 3217 3218
    3217, 62676, 3218, 24466,
// RESTART_TABLES.agc:316
//
// RESTART_TABLES.agc:317
//4.63SPOT	OCT	77777
// slot 3219
    3219, 65534,
// RESTART_TABLES.agc:318
//		EBANK=	PACTOFF
// RESTART_TABLES.agc:319
//		-2CADR	DOSPSOFF
// slot 3220 3221
    3220, 62470, 3221, 24466,
// RESTART_TABLES.agc:320
//
// RESTART_TABLES.agc:321
//4.65SPOT	DEC	10
// slot 3222
    3222, 20,
// RESTART_TABLES.agc:322
//		EBANK=	TIG
// RESTART_TABLES.agc:323
//		-2CADR	TIG-5
// slot 3223 3224
    3223, 62726, 3224, 24464,
// RESTART_TABLES.agc:324
//
// RESTART_TABLES.agc:325
//4.67SPOT	DEC	-0
// slot 3225
    3225, 65534,
// RESTART_TABLES.agc:326
//		EBANK=	CSMMASS
// RESTART_TABLES.agc:327
//		-2CADR	V97TTASK
// slot 3226 3227
    3226, 61884, 3227, 24466,
// RESTART_TABLES.agc:328
//
// RESTART_TABLES.agc:329
//4.71SPOT	DEC	250
// slot 3228
    3228, 500,
// RESTART_TABLES.agc:330
//		EBANK=	DAPDATR1		# (FOR RCSDAPON)
// RESTART_TABLES.agc:331
//		-2CADR	V97TRCS
// slot 3229 3230
    3229, 61858, 3230, 24466,
// RESTART_TABLES.agc:332
//
// RESTART_TABLES.agc:333
//4.73SPOT	DEC	-0
// slot 3231
    3231, 65534,
// RESTART_TABLES.agc:334
//		EBANK=	V97VCNTR
// RESTART_TABLES.agc:335
//		-2CADR	V97PTASK
// slot 3232 3233
    3232, 61832, 3233, 24466,
// RESTART_TABLES.agc:336
//
// RESTART_TABLES.agc:337
//4.75SPOT	DEC	-0
// slot 3234
    3234, 65534,
// RESTART_TABLES.agc:338
//		EBANK=	DAPDATR1
// RESTART_TABLES.agc:339
//		-2CADR	SPSOFF97
// slot 3235 3236
    3235, 61764, 3236, 24466,
// RESTART_TABLES.agc:340
//
// RESTART_TABLES.agc:341
//# Page 217
// RESTART_TABLES.agc:342
//4.77SPOT	DEC	-0
// slot 3237
    3237, 65534,
// RESTART_TABLES.agc:343
//		EBANK=	PACTOFF
// RESTART_TABLES.agc:344
//		-2CADR	TIG-0
// slot 3238 3239
    3238, 62698, 3239, 24466,
// RESTART_TABLES.agc:345
//
// RESTART_TABLES.agc:346
//# ANY MORE GROUP 4.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:347
//
// RESTART_TABLES.agc:348
//5.2SPOT		OCT	32000
// slot 3240
    3240, 26624,
// RESTART_TABLES.agc:349
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:350
//		2CADR	NORMLIZE
// slot 3241 3242
    3241, 3388, 3242, 63598,
// RESTART_TABLES.agc:351
//
// RESTART_TABLES.agc:352
//		DEC	200
// slot 3243
    3243, 400,
// RESTART_TABLES.agc:353
//		EBANK=	AOG
// RESTART_TABLES.agc:354
//		-2CADR	REREADAC
// slot 3244 3245
    3244, 62068, 3245, 1938,
// RESTART_TABLES.agc:355
//
// RESTART_TABLES.agc:356
//5.4SPOT		OCT	20000
// slot 3246
    3246, 16384,
// RESTART_TABLES.agc:357
//		EBANK=	DVCNTR
// RESTART_TABLES.agc:358
//		2CADR	SERVICER
// slot 3247 3248
    3247, 3208, 3248, 63598,
// RESTART_TABLES.agc:359
//
// RESTART_TABLES.agc:360
//		DEC	200
// slot 3249
    3249, 400,
// RESTART_TABLES.agc:361
//		EBANK=	AOG
// RESTART_TABLES.agc:362
//		-2CADR	REREADAC
// slot 3250 3251
    3250, 62068, 3251, 1938,
// RESTART_TABLES.agc:363
//
// RESTART_TABLES.agc:364
//# ANY MORE GROUP 5.EVEN RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:365
//
// RESTART_TABLES.agc:366
//5.3SPOT		DEC	200
// slot 3252
    3252, 400,
// RESTART_TABLES.agc:367
//		EBANK=	AOG
// RESTART_TABLES.agc:368
//		-2CADR	REREADAC
// slot 3253 3254
    3253, 62068, 3254, 1938,
// RESTART_TABLES.agc:369
//
// RESTART_TABLES.agc:370
//5.5SPOT		OCT	77777
// slot 3255
    3255, 65534
)).

agcAotInstallSourceRope(list(
// RESTART_TABLES.agc:371
//		EBANK=	AOG
// RESTART_TABLES.agc:372
//		-2CADR	REDO5.5
// slot 3256 3257
    3256, 62508, 3257, 1938,
// RESTART_TABLES.agc:373
//
// RESTART_TABLES.agc:374
//5.7SPOT		OCT	20000			# USED BY PRELAUNCH
// slot 3258
    3258, 16384,
// RESTART_TABLES.agc:375
//		EBANK=	XSM
// RESTART_TABLES.agc:376
//		2CADR	RSTGTS1
// slot 3259 3260
    3259, 2652, 3260, 55402,
// RESTART_TABLES.agc:377
//
// RESTART_TABLES.agc:378
//5.11SPOT	OCT	77777
// slot 3261
    3261, 65534,
// RESTART_TABLES.agc:379
//		EBANK=	XSM
// RESTART_TABLES.agc:380
//		-2CADR	ALLOOP1
// slot 3262 3263
    3262, 62714, 3263, 10132,
// RESTART_TABLES.agc:381
//
// RESTART_TABLES.agc:382
//5.13SPOT	OCT	20000
// slot 3264
    3264, 16384,
// RESTART_TABLES.agc:383
//		EBANK=	XSM
// RESTART_TABLES.agc:384
//		2CADR	WTLISTNT
// slot 3265 3266
    3265, 2734, 3266, 55402,
// RESTART_TABLES.agc:385
//
// RESTART_TABLES.agc:386
//5.15SPOT	OCT	20000
// slot 3267
    3267, 16384,
// RESTART_TABLES.agc:387
//		EBANK=	XSM
// RESTART_TABLES.agc:388
//		2CADR	RESTEST1
// slot 3268 3269
    3268, 3496, 3269, 55402,
// RESTART_TABLES.agc:389
//
// RESTART_TABLES.agc:390
//5.17SPOT	OCT	20000
// slot 3270
    3270, 16384,
// RESTART_TABLES.agc:391
//		EBANK=	XSM
// RESTART_TABLES.agc:392
//# Page 218
// RESTART_TABLES.agc:393
//		2CADR	GEOSTRT4
// slot 3271 3272
    3271, 5406, 3272, 4202,
// RESTART_TABLES.agc:394
//
// RESTART_TABLES.agc:395
//5.21SPOT	OCT	22000
// slot 3273
    3273, 18432,
// RESTART_TABLES.agc:396
//		EBANK=	XSM
// RESTART_TABLES.agc:397
//		2CADR	ALFLT1
// slot 3274 3275
    3274, 2876, 3275, 55402,
// RESTART_TABLES.agc:398
//
// RESTART_TABLES.agc:399
//5.23SPOT	OCT	77777
// slot 3276
    3276, 65534,
// RESTART_TABLES.agc:400
//		EBANK=	XSM
// RESTART_TABLES.agc:401
//		-2CADR	SPECSTS
// slot 3277 3278
    3277, 62676, 3278, 10132,
// RESTART_TABLES.agc:402
//
// RESTART_TABLES.agc:403
//5.25SPOT	OCT	20000
// slot 3279
    3279, 16384,
// RESTART_TABLES.agc:404
//		EBANK=	XSM
// RESTART_TABLES.agc:405
//		2CADR	RESTEST3
// slot 3280 3281
    3280, 3514, 3281, 55402,
// RESTART_TABLES.agc:406
//
// RESTART_TABLES.agc:407
//5.27SPOT	OCT	20000
// slot 3282
    3282, 16384,
// RESTART_TABLES.agc:408
//		EBANK=	XSM
// RESTART_TABLES.agc:409
//		2CADR	RESTAIER
// slot 3283 3284
    3283, 3462, 3284, 55402,
// RESTART_TABLES.agc:410
//
// RESTART_TABLES.agc:411
//5.31SPOT	DEC	0
// slot 3285
    3285, 0,
// RESTART_TABLES.agc:412
//		DEC	0
// slot 3286
    3286, 0,
// RESTART_TABLES.agc:413
//		DEC	0
// slot 3287
    3287, 0,
// RESTART_TABLES.agc:414
//5.33SPOT	OCT	20000
// slot 3288
    3288, 16384,
// RESTART_TABLES.agc:415
//		EBANK=	XSM
// RESTART_TABLES.agc:416
//		2CADR	RESCHNG
// slot 3289 3290
    3289, 3552, 3290, 55402,
// RESTART_TABLES.agc:417
//
// RESTART_TABLES.agc:418
//5.35SPOT	DEC	0
// slot 3291
    3291, 0,
// RESTART_TABLES.agc:419
//		2DEC	0
// slot 3292 3293
    3292, 0, 3293, 0,
// RESTART_TABLES.agc:420
//
// RESTART_TABLES.agc:421
//5.37SPOT	OCT	77777
// slot 3294
    3294, 65534,
// RESTART_TABLES.agc:422
//		EBANK=	AOG
// RESTART_TABLES.agc:423
//		-2CADR	CHEKAVEG
// slot 3295 3296
    3295, 62408, 3296, 1938,
// RESTART_TABLES.agc:424
//
// RESTART_TABLES.agc:425
//5.41SPOT	OCT	77777			# TO PROTECT PREREAD AT TIG-30A
// slot 3297
    3297, 65534,
// RESTART_TABLES.agc:426
//		EBANK=	DVCNTR			#    TIG-15 T+60
// RESTART_TABLES.agc:427
//		-2CADR	PREREAD
// slot 3298 3299
    3298, 62588, 3299, 1936,
// RESTART_TABLES.agc:428
//
// RESTART_TABLES.agc:429
//# ANY MORE GROUP 5.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:430
//
// RESTART_TABLES.agc:431
//6.2SPOT		OCT	77777			# USED BY P40 AFTER GIMB DR TST TO REPOS'N
// slot 3300
    3300, 65534,
// RESTART_TABLES.agc:432
//		EBANK=	AK			# ENGINE UNTIL TVCDAPON
// RESTART_TABLES.agc:433
//		-2CADR	PRE40.6
// slot 3301 3302
    3301, 63164, 3302, 32658,
// RESTART_TABLES.agc:434
//
// RESTART_TABLES.agc:435
//		DEC	100
// slot 3303
    3303, 200,
// RESTART_TABLES.agc:436
//		EBANK=	TTOGO
// RESTART_TABLES.agc:437
//		-2CADR	CLOKTASK
// slot 3304 3305
    3304, 62110, 3305, 24464,
// RESTART_TABLES.agc:438
//
// RESTART_TABLES.agc:439
//# ANY MORE 6.ODD RESTART VALUES SHOULD GO HERE
// RESTART_TABLES.agc:440
//# Page 219
// RESTART_TABLES.agc:441
//
// RESTART_TABLES.agc:442
//6.3SPOT		DEC	100
// slot 3306
    3306, 200,
// RESTART_TABLES.agc:443
//		EBANK=	TIG
// RESTART_TABLES.agc:444
//		-2CADR	CLOKTASK
// slot 3307 3308
    3307, 62110, 3308, 24464,
// RESTART_TABLES.agc:445
//
// RESTART_TABLES.agc:446
//6.5SPOT		OCT	30000			# PROTECT INCREMENTING OF TIME2,TIME1 BY
// slot 3309
    3309, 24576,
// RESTART_TABLES.agc:447
//		EBANK=	TEPHEM			# P27(UPDATE PROGRAM)
// RESTART_TABLES.agc:448
//		2CADR	TIMEDIDR
// slot 3310 3311
    3310, 3830, 3311, 47206,
// RESTART_TABLES.agc:449
//
// RESTART_TABLES.agc:450
//6.7SPOT		OCT	0
// slot 3312
    3312, 0,
// RESTART_TABLES.agc:451
//		OCT	0
// slot 3313
    3313, 0,
// RESTART_TABLES.agc:452
//		OCT	0
// slot 3314
    3314, 0,
// RESTART_TABLES.agc:453
//
// RESTART_TABLES.agc:454
//6.11SPOT	-GENADR	CM/GYMDT		# PROTECT TASK TO READ CDUS.
// slot 3315
    3315, 63572,
// RESTART_TABLES.agc:455
//		EBANK=	CM/GYMDT		# FOR ENTRY DAP
// RESTART_TABLES.agc:456
//		-2CADR	READGYMB
// slot 3316 3317
    3316, 62918, 3317, 38802,
// RESTART_TABLES.agc:457
//
// RESTART_TABLES.agc:458
//6.13SPOT	DEC	0
// slot 3318
    3318, 0,
// RESTART_TABLES.agc:459
//		DEC	0
// slot 3319
    3319, 0,
// RESTART_TABLES.agc:460
//		DEC	0
// slot 3320
    3320, 0
)).

// bank 02, slots 4172-4174
function agcAotUnit144 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4172 {
// RESTART_TABLES.agc:461
//
// RESTART_TABLES.agc:462
//# Page 220
// RESTART_TABLES.agc:463
//# PROGRAM DESCRIPTION: NEWPHASE						DATE:  11 NOV 1966
// RESTART_TABLES.agc:464
//# MOD: 1								ASSEMBLY:  SUNBURST REV
// RESTART_TABLES.agc:465
//# MOD BY: COPPS KERMAN								LOG SECTION: PHASE TABLE MAINTENANCE
// RESTART_TABLES.agc:466
//# FUNCTIONAL DESCRIPTION:
// RESTART_TABLES.agc:467
//#
// RESTART_TABLES.agc:468
//#	NEWPHASE IS THE QUICK WAY TO MAKE A NON VARIABLE PHASE CHANGE. IT INCLUDES THE OPTION OF SETTING
// RESTART_TABLES.agc:469
//#	TBASE OF THE GROUP.  IF TBASE IS TO BE SET, -C(TIME1) IS STORED IN THE TBASE TABLE AS FOLLOWS:
// RESTART_TABLES.agc:470
//#
// RESTART_TABLES.agc:471
//#		(L-1)	TBASE0
// RESTART_TABLES.agc:472
//#		(L)	TBASE1	(IF GROUP=1)
// RESTART_TABLES.agc:473
//#		(L+1)
// RESTART_TABLES.agc:474
//#		(L+2)	TBASE2	(IF GROUP=2)
// RESTART_TABLES.agc:475
//#		-----
// RESTART_TABLES.agc:476
//#		(L+6)	TBASE4	(IF GROUP=4)
// RESTART_TABLES.agc:477
//#		(L+7)
// RESTART_TABLES.agc:478
//#		(L+8)	TBASE5	(IF GROUP=5)
// RESTART_TABLES.agc:479
//#
// RESTART_TABLES.agc:480
//#	IN ANY CASE, THE NEGATIVE OF THE PHASE, FOLLOWED (IN THE NEXT REGISTER) BY THE PHASE, IS STORED IN THE
// RESTART_TABLES.agc:481
//#	PHASE TABLE AS FOLLOWS:
// RESTART_TABLES.agc:482
//#
// RESTART_TABLES.agc:483
//#		(L)	-PHASE1	(IF GROUP=1)
// RESTART_TABLES.agc:484
//#		(L+1)	PHASE1
// RESTART_TABLES.agc:485
//#		(L+2)	-PHASE2	(IF GROUP=2)
// RESTART_TABLES.agc:486
//#		(L+3)	PHASE2
// RESTART_TABLES.agc:487
//#		-----
// RESTART_TABLES.agc:488
//#		(L+7)	PHASE4
// RESTART_TABLES.agc:489
//#		(L+8)	-PHASE5	(IF GROUP=5)
// RESTART_TABLES.agc:490
//#		(L+9)	PHASE5
// RESTART_TABLES.agc:491
//#
// RESTART_TABLES.agc:492
//# CALLING SEQUENCE:
// RESTART_TABLES.agc:493
//#	EXAMPLE IS FOR PLACING A PHASE OF FIVE INTO GROUP THREE:
// RESTART_TABLES.agc:494
//#
// RESTART_TABLES.agc:495
//#	1) IF TBASE IS NOT TO BE SET:
// RESTART_TABLES.agc:496
//#			L-1	CA	FIVE
// RESTART_TABLES.agc:497
//#			L	TC	NEWPHASE
// RESTART_TABLES.agc:498
//#			L+1	OCT	00003
// RESTART_TABLES.agc:499
//#
// RESTART_TABLES.agc:500
//#	2) IF TBASE IS TO BE SET:
// RESTART_TABLES.agc:501
//#			L-1	CS	FIVE
// RESTART_TABLES.agc:502
//#			L	TC	NEWPHASE
// RESTART_TABLES.agc:503
//#			L+1	OCT	00003
// RESTART_TABLES.agc:504
//#
// RESTART_TABLES.agc:505
//# SUBROUTINES CALLED: NONE
// RESTART_TABLES.agc:506
//#
// RESTART_TABLES.agc:507
//# NORMAL EXIT MODE: AT L+2 OF CALLING SEQUENCE
// RESTART_TABLES.agc:508
//#
// RESTART_TABLES.agc:509
//# ALARM OR ABORT EXITS: NONE
// RESTART_TABLES.agc:510
//#
// RESTART_TABLES.agc:511
//# OUTPUT: PHASE TABLE AND TBASE TABLE UPDATED
// RESTART_TABLES.agc:512
//#
// RESTART_TABLES.agc:513
//# ERASABLE INITIALIZATION REQ'D: NONE
// RESTART_TABLES.agc:514
//# Page 221
// RESTART_TABLES.agc:515
//# DEBRIS:  A,L,TEMPG
// RESTART_TABLES.agc:516
//
// RESTART_TABLES.agc:517
//# ***WARNING*** THIS PROGRAM IS TO BE PLACED IN FIXED-FIXED AND UNSWITCHED ERASABLE.
// RESTART_TABLES.agc:518
//
// RESTART_TABLES.agc:519
//		BLOCK	02
// RESTART_TABLES.agc:520
//		SETLOC	FFTAG1
// RESTART_TABLES.agc:521
//		BANK
// RESTART_TABLES.agc:522
//
// RESTART_TABLES.agc:523
//		COUNT*	$$/PHASE
// RESTART_TABLES.agc:524
//
// RESTART_TABLES.agc:525
//NEWPHASE	INHINT
// slot 4172
        if slot <> 4172 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4173 {
// RESTART_TABLES.agc:526
//
// RESTART_TABLES.agc:527
//		TS	L			# SAVE FOR FURTHER USE
// slot 4173
            if slot <> 4173 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RESTART_TABLES.agc:528
//		NDX	Q			# OBTAIN THE GROUP NUMBER
// slot 4174
            if slot <> 4174 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[144] to agcAotUnit144@.

agcAotInstallSourceRope(list(
// RESTART_TABLES.agc:529
//		CA	0
// slot 4175
    4175, 24576
)).

// bank 02, slots 4176-4185
function agcAotUnit145 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4180 {
        if slot <= 4177 {
            if slot <= 4176 {
// RESTART_TABLES.agc:530
//		INCR	Q			# OBTAIN THE RETURN ADDRESS
// slot 4176
                if slot <> 4176 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTART_TABLES.agc:531
//		DOUBLE				# SAVE THE GROUP IN A FORM USED FOR
// slot 4177
                if slot <> 4177 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4178 {
// RESTART_TABLES.agc:532
//		TS	TEMPG			# INDEXING
// slot 4178
                if slot <> 4178 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4179 {
// RESTART_TABLES.agc:533
//
// RESTART_TABLES.agc:534
//		CCS	L			# SEE IF WE ARE TO SET TBASE
// slot 4179
                    if slot <> 4179 or instruction <> 4097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:535
//		TCF	+7			# NO, THE DELTA T WAS POSITIVE
// slot 4180
                    if slot <> 4180 or instruction <> 6235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6235, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4182 {
            if slot <= 4181 {
// RESTART_TABLES.agc:536
//		TCF	+6
// slot 4181
                if slot <> 4181 or instruction <> 6235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6235, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RESTART_TABLES.agc:537
//
// RESTART_TABLES.agc:538
//NUFAZ+10	INCR	A			# SET TBASE AND STORE PHASE CORRECTLY
// slot 4182
                if slot <> 4182 or instruction <> 10240 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4183 {
// RESTART_TABLES.agc:539
//		TS	L
// slot 4183
                if slot <> 4183 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4184 {
// RESTART_TABLES.agc:540
//		CS	TIME1			# SET TBASE
// slot 4184
                    if slot <> 4184 or instruction <> 16405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 21).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RESTART_TABLES.agc:541
//		NDX	TEMPG
// slot 4185
                    if slot <> 4185 or instruction <> 20529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[145] to agcAotUnit145@.

agcAotInstallSourceRope(list(
// RESTART_TABLES.agc:542
//		TS	TBASE1 -2
// slot 4186
    4186, 46162
)).

// bank 02, slots 4187-4188
function agcAotUnit146 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4187 {
// RESTART_TABLES.agc:543
//		CS	L			# NOW PUT THE PHASE IN THE RIGHT TABLE LOC
// slot 4187
        if slot <> 4187 or instruction <> 16385 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 1).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// RESTART_TABLES.agc:544
//		NDX	TEMPG
// slot 4188
        if slot <> 4188 or instruction <> 20529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20529, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[146] to agcAotUnit146@.

agcAotInstallSourceRope(list(
// RESTART_TABLES.agc:545
//		DXCH	-PHASE1	-2
// slot 4189
    4189, 43986
)).

// bank 02, slots 4190-4191
function agcAotUnit147 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4190 {
// RESTART_TABLES.agc:546
//		RELINT
// slot 4190
        if slot <> 4190 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RESTART_TABLES.agc:547
//		TC	Q			# NOW RETURN TO CALLER
// slot 4191
        if slot <> 4191 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[147] to agcAotUnit147@.

// no code for the lines below
// RESTART_TABLES.agc:548
//
// RESTART_TABLES.agc:549
//
