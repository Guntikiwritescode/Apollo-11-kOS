// PORT: Original source unit SERVICER207.agc.
// PORT: Physical bank 37. Shared continuation entries, slots 34241–34242.
function agcAotUnit1924 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34241 {
// PORT: SOURCE SERVICER207.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE SERVICER207.agc:2
//# Filename:     SERVICER207.agc
// PORT: SOURCE SERVICER207.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE SERVICER207.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE SERVICER207.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE SERVICER207.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE SERVICER207.agc:7
//# Reference:    pp. 819-836
// PORT: SOURCE SERVICER207.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE SERVICER207.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE SERVICER207.agc:10
//# Mod history:  2009-05-12 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE SERVICER207.agc:11
//#				name and Comanche 055 page images.
// PORT: SOURCE SERVICER207.agc:12
//#
// PORT: SOURCE SERVICER207.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE SERVICER207.agc:14
//# from scanned documents.
// PORT: SOURCE SERVICER207.agc:15
//#
// PORT: SOURCE SERVICER207.agc:16
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE SERVICER207.agc:17
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE SERVICER207.agc:18
//#
// PORT: SOURCE SERVICER207.agc:19
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE SERVICER207.agc:20
//#
// PORT: SOURCE SERVICER207.agc:21
//#       Prepared by
// PORT: SOURCE SERVICER207.agc:22
//#                       Massachusetts Institute of Technology
// PORT: SOURCE SERVICER207.agc:23
//#                       75 Cambridge Parkway
// PORT: SOURCE SERVICER207.agc:24
//#                       Cambridge, Massachusetts
// PORT: SOURCE SERVICER207.agc:25
//#
// PORT: SOURCE SERVICER207.agc:26
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE SERVICER207.agc:27
//#
// PORT: SOURCE SERVICER207.agc:28
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE SERVICER207.agc:29
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE SERVICER207.agc:30
//
// PORT: SOURCE SERVICER207.agc:31
//# Page 819
// PORT: SOURCE SERVICER207.agc:32
//# SERVICER207
// PORT: SOURCE SERVICER207.agc:33
//
// PORT: SOURCE SERVICER207.agc:34
//# PROGRAM NAME - PREREAD, READACCS, SERVICER, AVERAGE G.
// PORT: SOURCE SERVICER207.agc:35
//
// PORT: SOURCE SERVICER207.agc:36
//
// PORT: SOURCE SERVICER207.agc:37
//# MOD NO. 00	BY M.HAMILTON	DEC.12, 1966
// PORT: SOURCE SERVICER207.agc:38
//
// PORT: SOURCE SERVICER207.agc:39
//
// PORT: SOURCE SERVICER207.agc:40
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE SERVICER207.agc:41
//
// PORT: SOURCE SERVICER207.agc:42
//# THE ROUTINES DESCRIBED BELOW ARE USED TO CALCULATE VALUES OF RN, VN, AND GDT/2 DURING ACCELERATED FLIGHT.
// PORT: SOURCE SERVICER207.agc:43
//# THE SEVERAL ROUTINES COMPRISE A PACKAGE AND ARE NOT MEANT TO BE USED AS SEPARATE SUBROUTINES.
// PORT: SOURCE SERVICER207.agc:44
//
// PORT: SOURCE SERVICER207.agc:45
//# GENERAL REFERENCES TO SERVICER OR AVERAGE G ARE UNDERSTOOD TO REFER TO THE ENTIRE SET OF ROUTINES INCLUDING
// PORT: SOURCE SERVICER207.agc:46
//# READACCS, SERVICER, AVERAGE G, INTEREAD, SMOOTHER, AND ANY ADDITIONAL ROUTINES ATTACHED AT AVGEXIT (SEE BELOW).
// PORT: SOURCE SERVICER207.agc:47
//
// PORT: SOURCE SERVICER207.agc:48
//# PROGRAMS INITIATING SERVICER ARE REQUIRED TO MAKE A WAITLIST CALL FOR PREREAD (OR, IF LIFTOFF, FOR BIBIBIAS)
// PORT: SOURCE SERVICER207.agc:49
//# AT 2 SECONDS BEFORE THE FIRST AVERAGE G UPDATE IN ORDER TO INITIALIZE THE SEQUENCE, WHICH WILL RECUR EVERY
// PORT: SOURCE SERVICER207.agc:50
//# 2 SECONDS FROM THAT TIME ON AS LONG AS AVEGFLAG REMAINS SET.
// PORT: SOURCE SERVICER207.agc:51
//
// PORT: SOURCE SERVICER207.agc:52
//# THE USE OF ERASABLE AVGEXIT ALLOWS VARIOUS ROUTINES TO BE PERFORMED AS PART OF THE NORMAL CYCLE (SEE
// PORT: SOURCE SERVICER207.agc:53
//# EXPLANATION OF AVGEXIT BELOW).
// PORT: SOURCE SERVICER207.agc:54
//
// PORT: SOURCE SERVICER207.agc:55
//# DESCRIPTIONS OF INDIVIDUAL ROUTINES FOLLOW.
// PORT: SOURCE SERVICER207.agc:56
//
// PORT: SOURCE SERVICER207.agc:57
//
// PORT: SOURCE SERVICER207.agc:58
//#	PREREAD
// PORT: SOURCE SERVICER207.agc:59
//
// PORT: SOURCE SERVICER207.agc:60
//#		PREVIOUSLY EXTRAPOLATED VALUES COPIED FROM RN1, VN1, AND PIPTIME1 INTO RN, VN, AND PIPTIME.
// PORT: SOURCE SERVICER207.agc:61
//#		LASTBIAS JOB SCHEDULED.
// PORT: SOURCE SERVICER207.agc:62
//#		PIPS READ AND CLEARED VIA PIPASR SUBROUTINE.
// PORT: SOURCE SERVICER207.agc:63
//#		AVERAGE G FLAG SET ON.
// PORT: SOURCE SERVICER207.agc:64
//#		DRIFT FLAG SET OFF.
// PORT: SOURCE SERVICER207.agc:65
//#		V37 FLAG SET ON.
// PORT: SOURCE SERVICER207.agc:66
//#		INITIALIZATION OF	1) THRUST MONITOR (DVMON) - DVCNTR SET TO ONE.
// PORT: SOURCE SERVICER207.agc:67
//#					2) TOTAL ACCUMULATED DELV VALUE (DVTOTAL) - SET TO ZERO.
// PORT: SOURCE SERVICER207.agc:68
//#					3) AXIS VECTOR (AXIS) - SET TO (.5,0,0).
// PORT: SOURCE SERVICER207.agc:69
//#		NORMLIZE JOB SCHEDULED.
// PORT: SOURCE SERVICER207.agc:70
//#		READACCS TASH CALLED IN 2 SECONDS.
// PORT: SOURCE SERVICER207.agc:71
//
// PORT: SOURCE SERVICER207.agc:72
//
// PORT: SOURCE SERVICER207.agc:73
//#	NORMLIZE
// PORT: SOURCE SERVICER207.agc:74
//#
// PORT: SOURCE SERVICER207.agc:75
//#		GDT/2 INITIALIZED VIA CALCGRAV SUBROUTINE.
// PORT: SOURCE SERVICER207.agc:76
//
// PORT: SOURCE SERVICER207.agc:77
//
// PORT: SOURCE SERVICER207.agc:78
//#	READACCS
// PORT: SOURCE SERVICER207.agc:79
//
// PORT: SOURCE SERVICER207.agc:80
//#		IF ONMON FLAG SET QUIKREAD ROUTINE IS PERFORMED BEFORE PIPASR ZEROS THE PIPA REGISTERS, AND THE 1/2 SEC
// PORT: SOURCE SERVICER207.agc:81
//#		ONMONITOR LOOP IS INITIATED TO PROVIDE DOWNLINK INFORMATION DURING ENTRY.
// PORT: SOURCE SERVICER207.agc:82
//#		PIPS READ AND CLEARED BY PIPASR SUBROUTINE.
// PORT: SOURCE SERVICER207.agc:83
//#		IF CM/DSTBY IS ON, ENTRY VARIABLES INITIALIZED AND SETJTAG TASK CALLED.
// PORT: SOURCE SERVICER207.agc:84
//# Page 820
// PORT: SOURCE SERVICER207.agc:85
//# SERVICER207
// PORT: SOURCE SERVICER207.agc:86
//
// PORT: SOURCE SERVICER207.agc:87
//#		IF AVERAGEG FLAG ON	READACCS CALLED TO RECYCLE IN 2 SECONDS.
// PORT: SOURCE SERVICER207.agc:88
//#		IF AVERAGEG FLAG OFF	AVERAGE G EXIT (AVGEXIT) SET TO 2CADR AVGEND FOR FINAL PASS.
// PORT: SOURCE SERVICER207.agc:89
//#		SERVICER JOB SCHEDULED.
// PORT: SOURCE SERVICER207.agc:90
//
// PORT: SOURCE SERVICER207.agc:91
//
// PORT: SOURCE SERVICER207.agc:92
//#		TEST CONNECTOR OUTBIT TURNED ON.
// PORT: SOURCE SERVICER207.agc:93
//
// PORT: SOURCE SERVICER207.agc:94
//
// PORT: SOURCE SERVICER207.agc:95
//# ONMNITOR
// PORT: SOURCE SERVICER207.agc:96
//
// PORT: SOURCE SERVICER207.agc:97
//#		A SEQUENCE OF THREE PASSES THROUGH QUICREAD FOLLOWING A CALL TO READACCS WITH ONMONFLG SET AT 1/2
// PORT: SOURCE SERVICER207.agc:98
//#		SEC INTERVALS.  INTERVALS ARE COUNTED OUT BY PIPCTR, INITIALISED AT 3 BY READACCS
// PORT: SOURCE SERVICER207.agc:99
//
// PORT: SOURCE SERVICER207.agc:100
//#	QUIKREAD
// PORT: SOURCE SERVICER207.agc:101
//
// PORT: SOURCE SERVICER207.agc:102
//#	      READS CURRENT PIPS INTO X,Y,ZPIPBUF.  READS OLD X,Y,ZPIPBUF INTO X,Y,ZOLDBUF.  VALUES ARE SENT TO
// PORT: SOURCE SERVICER207.agc:103
//#		DOWNLIST DURING ENTRY.
// PORT: SOURCE SERVICER207.agc:104
//#	SERVICER
// PORT: SOURCE SERVICER207.agc:105
//#		DELV VALUES CHECKED TO DETECT RUNAWAY PIP -
// PORT: SOURCE SERVICER207.agc:106
//#			IF BAD PIP	1) ALARM SENT.
// PORT: SOURCE SERVICER207.agc:107
//#					2) COMPENSATION, DVTOTAL ACCUMULATION, AND DVMON BYPASSED.  CONTROL
// PORT: SOURCE SERVICER207.agc:108
//#					   TRANSFERRED TO AVERAGE G.
// PORT: SOURCE SERVICER207.agc:109
//#		PIPS COMPENSATED VIA 1/PIPA SUBROUTINE.
// PORT: SOURCE SERVICER207.agc:110
//#		DVTOTAL INCREMENTED BY ABSOLUTE VALUE OF DELV.
// PORT: SOURCE SERVICER207.agc:111
//#		THRUST MONITOR (DVMON) PERFORMED UNLESS IDLE FLAG IS ON.
// PORT: SOURCE SERVICER207.agc:112
//#		CONTROL TRANSFERRED TO AVERAGE Q.
// PORT: SOURCE SERVICER207.agc:113
//
// PORT: SOURCE SERVICER207.agc:114
//
// PORT: SOURCE SERVICER207.agc:115
//#		DVMON
// PORT: SOURCE SERVICER207.agc:116
//
// PORT: SOURCE SERVICER207.agc:117
//#			THRESHOLD VALUD (PLACED IN DVTHRUSH BY USER) CHECKED AGAINST ABSOLUTE VALUE OF DELV TO CHECK
// PORT: SOURCE SERVICER207.agc:118
//#			THRUST LEVEL.
// PORT: SOURCE SERVICER207.agc:119
//#				IF THRUST	1) ULLAGE OFF ROUTINE PERFORMED.
// PORT: SOURCE SERVICER207.agc:120
//#						2) STEERING FLAG TURNED ON AT FIRST DETECTION OF THRUST.
// PORT: SOURCE SERVICER207.agc:121
//#						3) CONTROL TRANSFERRED TO AVERAGE G.
// PORT: SOURCE SERVICER207.agc:122
//#				IF NO THRUST	1) ON FIRST PASS THROUGH MONITOR, CONTROL TRANSFERRED TO AVERAGE G.
// PORT: SOURCE SERVICER207.agc:123
//#						2) ON SUBSEQUENT PASSES, CONTROL TRANSFERRED TO ENGINE FAIL ROUTINE IF THRUST
// PORT: SOURCE SERVICER207.agc:124
//#						   HAS FAILED FOR 3 CONSECUTIVE PASSES.
// PORT: SOURCE SERVICER207.agc:125
//
// PORT: SOURCE SERVICER207.agc:126
//
// PORT: SOURCE SERVICER207.agc:127
//#		ENGINE FAIL
// PORT: SOURCE SERVICER207.agc:128
//
// PORT: SOURCE SERVICER207.agc:129
//#			ENGFAIL1 TASK CALLED IN 2.5 SECONDS.  THIS WILL RETURN CONTROL TO TIG-5 SO THAT THE IGNITION
// PORT: SOURCE SERVICER207.agc:130
//#				SEQUENCE MAY BE REPEATED.
// PORT: SOURCE SERVICER207.agc:131
//#			ENGINOF3 PERFORMED.
// PORT: SOURCE SERVICER207.agc:132
//#			DAP SET UP FOR RCS.
// PORT: SOURCE SERVICER207.agc:133
//
// PORT: SOURCE SERVICER207.agc:134
//
// PORT: SOURCE SERVICER207.agc:135
//#	AVERAGE G
// PORT: SOURCE SERVICER207.agc:136
//# Page 821
// PORT: SOURCE SERVICER207.agc:137
//#	RN1, VN1, GDT1/2 CALCULATED VIA CALCRVG ROUTINE BY UPDATING RN, VN WITH DELV AND AN AVERAGED VALUE
// PORT: SOURCE SERVICER207.agc:138
//#	OF GDT/2.
// PORT: SOURCE SERVICER207.agc:139
//#	RN1, VN1, GDT1/2, PIPTIME1 COPIED INTO RN, VN, GDT/2, PIPTIME FOR RESTART PROTECTION.
// PORT: SOURCE SERVICER207.agc:140
//#	CONTROL TRANSFERRED TO ADDRESS SPECIFIED BY USER (OR BY READACCS FOR LAST PASS) IN AVGEXIT.
// PORT: SOURCE SERVICER207.agc:141
//#	LAST PASS (AVGEND)	1) FREE FALL GYRO COMPENSATION SET UP.
// PORT: SOURCE SERVICER207.agc:142
//#				2) DRIFT FLAG TURNED ON.
// PORT: SOURCE SERVICER207.agc:143
//#				3) STATE VECTOR TRANSFERRED VIA AVETOMID ROUTINE.
// PORT: SOURCE SERVICER207.agc:144
//#				4) ONMONITOR FLAG RESET.
// PORT: SOURCE SERVICER207.agc:145
//#				5) V37 FLAG RESET.
// PORT: SOURCE SERVICER207.agc:146
//#				6) TEST CONNECTOR OUTBIT RESET.
// PORT: SOURCE SERVICER207.agc:147
//#				7) CONTROL TRANSFERRED TO CANV37 TO CONTINUE MM CHANGE ROUTINE (R00).
// PORT: SOURCE SERVICER207.agc:148
//
// PORT: SOURCE SERVICER207.agc:149
//
// PORT: SOURCE SERVICER207.agc:150
//# CALLING SEQUENCE
// PORT: SOURCE SERVICER207.agc:151
//
// PORT: SOURCE SERVICER207.agc:152
//#	PREREAD ENTERED DIRECTLY FROM TIG-30 VIA POSTJUMP.
// PORT: SOURCE SERVICER207.agc:153
//#	READACCS CALLED AS WAITLIST TASK.
// PORT: SOURCE SERVICER207.agc:154
//
// PORT: SOURCE SERVICER207.agc:155
//
// PORT: SOURCE SERVICER207.agc:156
//# SUBROUTINES CALLED
// PORT: SOURCE SERVICER207.agc:157
//
// PORT: SOURCE SERVICER207.agc:158
//# 	UTILITY ROUTINES - PHASCHNG FLAGUP FLAGDOWN NOVAC FINDVAC WAITLIST ALARM NEWPHASE 2PHSCHNG
// PORT: SOURCE SERVICER207.agc:159
//
// PORT: SOURCE SERVICER207.agc:160
//#	OTHER - PIPASR 1/PIPA CALCGRAV CALCRVG AVETOMID
// PORT: SOURCE SERVICER207.agc:161
//
// PORT: SOURCE SERVICER207.agc:162
//
// PORT: SOURCE SERVICER207.agc:163
//# NORMAL EXIT MODES
// PORT: SOURCE SERVICER207.agc:164
//
// PORT: SOURCE SERVICER207.agc:165
//#	ENDOFJOB	TASKOVER	CANV37
// PORT: SOURCE SERVICER207.agc:166
//
// PORT: SOURCE SERVICER207.agc:167
//#	AVGEXIT -	THIS IS A DOUBLE PRECISION ERASABLE LOCATION BY WHICH CONTROL IS TRANSFERRED AT THE END
// PORT: SOURCE SERVICER207.agc:168
//#			OF EACH CYCLE OF AVERAGE G.
// PORT: SOURCE SERVICER207.agc:169
//#			THE 2CADR OF A ROUTINE TO BE PERFORMED AT THAT TIME (E.G., STEERING EQUATIONS TO BE PERFORMED
// PORT: SOURCE SERVICER207.agc:170
//#			AT 2 SECOND INTERVALS) MAY BE SET BY THE USER INTO AVGEXIT.
// PORT: SOURCE SERVICER207.agc:171
//#			ALL SUCH ROUTINES SHOULD RETURN TO SERVEXIT, WHICH IS THE NORMAL EXIT FROM AVERAGE G.
// PORT: SOURCE SERVICER207.agc:172
//
// PORT: SOURCE SERVICER207.agc:173
//#	SERVEXIT -	DOES A PHASE CHANGE FOR RESTART PROTECTION AND GOES TO ENDOFJOB.
// PORT: SOURCE SERVICER207.agc:174
//#			THE 2CADR OF SERVEXIT IS SET INTO AVGEXIT BY THE USER IF NO OTHER ROUTINE (SEE ABOVE).
// PORT: SOURCE SERVICER207.agc:175
//#
// PORT: SOURCE SERVICER207.agc:176
//#	AVGEND -	LAST PASS OF AVERAGE G EXITS HERE, BYPASSING SPECIAL ROUTINE (SEE ABOVE UNDER READACCS).
// PORT: SOURCE SERVICER207.agc:177
//#			FINAL EXIT IS TO CANV37.				F AVERAGE G).
// PORT: SOURCE SERVICER207.agc:178
//
// PORT: SOURCE SERVICER207.agc:179
//
// PORT: SOURCE SERVICER207.agc:180
//# OUTPUT
// PORT: SOURCE SERVICER207.agc:181
//
// PORT: SOURCE SERVICER207.agc:182
//#	DVTOTAL(2)  PIPTIME(2)  XPIPBUF(2)  YPIPBUF(2)  ZPIPBUF(2)
// PORT: SOURCE SERVICER207.agc:183
//#	RN(6)		REFERENCE COORD.   SCALED AT 2(+29) M/CS
// PORT: SOURCE SERVICER207.agc:184
//#	VN(6)		REFERENCE COORD.   SCALED AT 2(+7) M/CS
// PORT: SOURCE SERVICER207.agc:185
//#	GDT/2(6)	REFERENCE COORD.   SCALED AT 2(+7) M/CS
// PORT: SOURCE SERVICER207.agc:186
//#	DELV(6)		STABLE MEMB. COORD.SCALED AT 2(+14)*5.85*10(-4)M/CS (KPIP1 USED TO GET DV/2 AT 2(+7))
// PORT: SOURCE SERVICER207.agc:187
//# Page 822
// PORT: SOURCE SERVICER207.agc:188
//#	DELVREF(6)	REFERENCE COORD.   SCALED AT 2(+7) M/CS
// PORT: SOURCE SERVICER207.agc:189
//
// PORT: SOURCE SERVICER207.agc:190
//# INITIALIZATION
// PORT: SOURCE SERVICER207.agc:191
//
// PORT: SOURCE SERVICER207.agc:192
//#		ONMONITOR FLAG SET BY ENTRY TO SHOW PIPBUF VALUES REQUIRED.
// PORT: SOURCE SERVICER207.agc:193
//#		IDLE FLAG ON IF DVMON TO BE BYPASSED.
// PORT: SOURCE SERVICER207.agc:194
//#		DVTHRUSH SET TO APPROPRIATE VALUE FOR DVMON.
// PORT: SOURCE SERVICER207.agc:195
//#		AVGEXIT SET TO 2CADR OF ROUTINE, IF ANY, TO BE PERFORMED AFTER EACH CYCLE OF AVERAGE G.  IF NO ROUTINE
// PORT: SOURCE SERVICER207.agc:196
//#			TO BE DONE, AVGEXIT SET TO SERVEXIT.
// PORT: SOURCE SERVICER207.agc:197
//#		VALUES NEEDED
// PORT: SOURCE SERVICER207.agc:198
//#			REFSMMAT
// PORT: SOURCE SERVICER207.agc:199
//#			UNITW - FULL UNIT VECTOR, IN REFERENCE COORD., OF EARTH S ROTATIONAL VECTOR
// PORT: SOURCE SERVICER207.agc:200
//#			RN1, VN1, PIPTIME1 - IN REFERENCE COORD., CONSISTENT WITH TIME OF EXECUTION OF PREREAD
// PORT: SOURCE SERVICER207.agc:201
//
// PORT: SOURCE SERVICER207.agc:202
//
// PORT: SOURCE SERVICER207.agc:203
//# DEBRIS
// PORT: SOURCE SERVICER207.agc:204
//
// PORT: SOURCE SERVICER207.agc:205
//#	CENTRALS	A, L, Q
// PORT: SOURCE SERVICER207.agc:206
//#	OTHER		INTERNAL -  DVCNTR(1)  PIPAGE(1)  PIPCTR(1)  AVGEXIT(2)
// PORT: SOURCE SERVICER207.agc:207
//#			EXTERNAL -  ITEMP1(1)  ITEMP2(1)  RUPTREG1(1)  TEMX(1)  TEMY(1)  TEMZ(1)
// PORT: SOURCE SERVICER207.agc:208
//#			USEFUL DEBRIS
// PORT: SOURCE SERVICER207.agc:209
//#				RN1(6)  VN1(6)  GDT1/2  PIPTIME1(2)
// PORT: SOURCE SERVICER207.agc:210
//#					THESE LOCATIONS USED AS BUFFER STORAGE FOR NEWLY CALCULATED VALUES OF RN, VN, GDT/2,
// PORT: SOURCE SERVICER207.agc:211
//#					AND PIPTIME DURING PERFORMANCE OF SERVICER ROUTINES.
// PORT: SOURCE SERVICER207.agc:212
//#				UNITR - HALF UNIT VECTOR OF RN, REFERENCE COORD.
// PORT: SOURCE SERVICER207.agc:213
//#				RMAG SCALED AT 2(+58) IN 36D.
// PORT: SOURCE SERVICER207.agc:214
//#				RMAGSQ SCALED AT 2(+58) IN 34D.
// PORT: SOURCE SERVICER207.agc:215
//#				(RE/RMAG)SQ IN 32D.
// PORT: SOURCE SERVICER207.agc:216
//
// PORT: SOURCE SERVICER207.agc:217
//
// PORT: SOURCE SERVICER207.agc:218
//		BANK	27
// PORT: SOURCE SERVICER207.agc:219
//		SETLOC	SERVICES
// PORT: SOURCE SERVICER207.agc:220
//		BANK
// PORT: SOURCE SERVICER207.agc:221
//
// PORT: SOURCE SERVICER207.agc:222
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER207.agc:223
//# ********************* PREREAD ***************************************
// PORT: SOURCE SERVICER207.agc:224
//#
// PORT: SOURCE SERVICER207.agc:225
//
// PORT: SOURCE SERVICER207.agc:226
//		COUNT	37/SERV
// PORT: SOURCE SERVICER207.agc:227
//
// PORT: SOURCE SERVICER207.agc:228
//PREREAD		CAF	PRIO21		# CALLER MUST PROTECT PREREAD
// PORT: Fixed ROM slots 34241.
        if slot <> 34241 or instruction <> 14907 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2619), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:229
//		TC	NOVAC
// PORT: Fixed ROM slots 34242.
        if slot <> 34242 or instruction <> 2652 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2652, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1924] to agcAotUnit1924@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:230
//		EBANK=	NBDX
// PORT: SOURCE SERVICER207.agc:231
//		2CADR	LASTBIAS	# DO LAST GYRO COMPENSATION IN FREE FALL
// PORT: Fixed ROM slots 34243 34244.
    34243, 3900, 34244, 12390
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34245–34247.
function agcAotUnit1925 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34245 {
// PORT: SOURCE SERVICER207.agc:232
//
// PORT: SOURCE SERVICER207.agc:233
//					# CALL-TO AND LASTBIAS ITSELF ARE NOT
// PORT: SOURCE SERVICER207.agc:234
//					#	PROTECTED. REREADAC SETS 1/PIPADT
// PORT: SOURCE SERVICER207.agc:235
//					#	TO 2.0 SECS IN CASE LASTBIAS LOST.
// PORT: SOURCE SERVICER207.agc:236
//					#	(REDUNDANT IF LASTBIAS IS AOK)
// PORT: SOURCE SERVICER207.agc:237
//# Page 823
// PORT: SOURCE SERVICER207.agc:238
//REDO5.31	TC	PREREAD1
// PORT: Fixed ROM slots 34245.
        if slot <> 34245 or instruction <> 1490 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1490, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34246 {
// PORT: SOURCE SERVICER207.agc:239
//
// PORT: SOURCE SERVICER207.agc:240
//		CAF	PRIO32
// PORT: Fixed ROM slots 34246.
            if slot <> 34246 or instruction <> 16311 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4023), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:241
//		TC	FINDVAC		# SET UP NORMLIZE JOB REQUIRED PRIOR TO
// PORT: Fixed ROM slots 34247.
            if slot <> 34247 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1925] to agcAotUnit1925@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:242
//		EBANK=	DVCNTR		# FIRST AVERAGE G PASS
// PORT: SOURCE SERVICER207.agc:243
//		2CADR	NORMLIZE
// PORT: Fixed ROM slots 34248 34249.
    34248, 3388, 34249, 63598
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34250–34251.
function agcAotUnit1926 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34250 {
// PORT: SOURCE SERVICER207.agc:244
//
// PORT: SOURCE SERVICER207.agc:245
//		CAF	2SECS
// PORT: Fixed ROM slots 34250.
        if slot <> 34250 or instruction <> 14882 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2594), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:246
//		TC	WAITLIST
// PORT: Fixed ROM slots 34251.
        if slot <> 34251 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1926] to agcAotUnit1926@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:247
//		EBANK=	AOG
// PORT: SOURCE SERVICER207.agc:248
//		2CADR	READACCS
// PORT: Fixed ROM slots 34252 34253.
    34252, 3016, 34253, 63596
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34254–34255.
function agcAotUnit1927 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34254 {
// PORT: SOURCE SERVICER207.agc:249
//
// PORT: SOURCE SERVICER207.agc:250
//		CS	TWO
// PORT: Fixed ROM slots 34254.
        if slot <> 34254 or instruction <> 18958 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:251
//		TC	NEWPHASE
// PORT: Fixed ROM slots 34255.
        if slot <> 34255 or instruction <> 2124 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2124, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1927] to agcAotUnit1927@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:252
//		OCT	5
// PORT: Fixed ROM slots 34256.
    34256, 10
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34257–34306.
function agcAotUnit1928 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34281 {
        if slot <= 34268 {
            if slot <= 34262 {
                if slot <= 34259 {
                    if slot <= 34257 {
// PORT: SOURCE SERVICER207.agc:253
//
// PORT: SOURCE SERVICER207.agc:254
//		TCF	TASKOVER
// PORT: Fixed ROM slots 34257.
                        if slot <> 34257 or instruction <> 6868 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6868, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34258 {
// PORT: SOURCE SERVICER207.agc:255
//
// PORT: SOURCE SERVICER207.agc:256
//PREREAD1	EXTEND
// PORT: Fixed ROM slots 34258.
                            if slot <> 34258 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:257
//		QXCH	RUPTREG1
// PORT: Fixed ROM slots 34259.
                            if slot <> 34259 or instruction <> 9272 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 56, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34260 {
// PORT: SOURCE SERVICER207.agc:258
//
// PORT: SOURCE SERVICER207.agc:259
//		TC	PIPASR		# CLEAR + READ PIPS LAST TIME IN FREE FALL
// PORT: Fixed ROM slots 34260.
                        if slot <> 34260 or instruction <> 1708 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1708, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34261 {
// PORT: SOURCE SERVICER207.agc:260
//
// PORT: SOURCE SERVICER207.agc:261
//		CAF	ONE		# SET UP PIPAGE FOR REREADAC IN CASE A
// PORT: Fixed ROM slots 34261.
                            if slot <> 34261 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:262
//		TS	PIPAGE		# 	RESTART OCCURS BEFORE READACCS
// PORT: Fixed ROM slots 34262.
                            if slot <> 34262 or instruction <> 23192 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23192, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34265 {
                    if slot <= 34263 {
// PORT: SOURCE SERVICER207.agc:263
//
// PORT: SOURCE SERVICER207.agc:264
//		CS	FLAGWRD1	# SET AVEG FLAG
// PORT: Fixed ROM slots 34263.
                        if slot <> 34263 or instruction <> 16445 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 61).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34264 {
// PORT: SOURCE SERVICER207.agc:265
//		MASK	BIT1
// PORT: Fixed ROM slots 34264.
                            if slot <> 34264 or instruction <> 31247 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                if fixedOperand = 1 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:266
//		ADS	FLAGWRD1
// PORT: Fixed ROM slots 34265.
                            if slot <> 34265 or instruction <> 11325 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 61).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34266 {
// PORT: SOURCE SERVICER207.agc:267
//
// PORT: SOURCE SERVICER207.agc:268
//		CA	POSMAX
// PORT: Fixed ROM slots 34266.
                        if slot <> 34266 or instruction <> 14847 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34267 {
// PORT: SOURCE SERVICER207.agc:269
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 34267.
                            if slot <> 34267 or instruction <> 28734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 62).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:270
//		TS	FLAGWRD2	# KNOCK DOWN DRIFT FLAG
// PORT: Fixed ROM slots 34268.
                            if slot <> 34268 or instruction <> 22590 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22590, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34274 {
                if slot <= 34271 {
                    if slot <= 34269 {
// PORT: SOURCE SERVICER207.agc:271
//
// PORT: SOURCE SERVICER207.agc:272
//		CS	FLAGWRD7	# SET V37 FLAG
// PORT: Fixed ROM slots 34269.
                        if slot <> 34269 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34270 {
// PORT: SOURCE SERVICER207.agc:273
//		MASK	BIT6
// PORT: Fixed ROM slots 34270.
                            if slot <> 34270 or instruction <> 31242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                if fixedOperand = 32 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:274
//		ADS	FLAGWRD7
// PORT: Fixed ROM slots 34271.
                            if slot <> 34271 or instruction <> 11331 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34272 {
// PORT: SOURCE SERVICER207.agc:275
//
// PORT: SOURCE SERVICER207.agc:276
//		CAF	ZERO
// PORT: Fixed ROM slots 34272.
                        if slot <> 34272 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34273 {
// PORT: SOURCE SERVICER207.agc:277
//		TS	DVTOTAL		# CLEAR DVTOTAL
// PORT: Fixed ROM slots 34273.
                            if slot <> 34273 or instruction <> 23317 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23317, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:278
//		TS	DVTOTAL +1
// PORT: Fixed ROM slots 34274.
                            if slot <> 34274 or instruction <> 23318 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23318, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34277 {
                    if slot <= 34275 {
// PORT: SOURCE SERVICER207.agc:279
//
// PORT: SOURCE SERVICER207.agc:280
//		TC	RUPTREG1
// PORT: Fixed ROM slots 34275.
                        if slot <> 34275 or instruction <> 56 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 56, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34276 {
// PORT: SOURCE SERVICER207.agc:281
//
// PORT: SOURCE SERVICER207.agc:282
//# Page 824
// PORT: SOURCE SERVICER207.agc:283
//# ********************* READACCS ***************************************
// PORT: SOURCE SERVICER207.agc:284
//		EBANK=	AOG
// PORT: SOURCE SERVICER207.agc:285
//READACCS	TC	PIPASR
// PORT: Fixed ROM slots 34276.
                            if slot <> 34276 or instruction <> 1708 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1708, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:286
//
// PORT: SOURCE SERVICER207.agc:287
//PIPSDONE	CAF	FIVE
// PORT: Fixed ROM slots 34277.
                            if slot <> 34277 or instruction <> 14866 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34279 {
                        if slot <= 34278 {
// PORT: SOURCE SERVICER207.agc:288
//		TS	L
// PORT: Fixed ROM slots 34278.
                            if slot <> 34278 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:289
//		COM
// PORT: Fixed ROM slots 34279.
                            if slot <> 34279 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34280 {
// PORT: SOURCE SERVICER207.agc:290
//		DXCH	-PHASE5
// PORT: Fixed ROM slots 34280.
                            if slot <> 34280 or instruction <> 22003 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:291
//
// PORT: SOURCE SERVICER207.agc:292
//REDO5.5		CAF	ONE		# SHOW PIPS HAVE BEEN READ
// PORT: Fixed ROM slots 34281.
                            if slot <> 34281 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
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
        if slot <= 34293 {
            if slot <= 34287 {
                if slot <= 34284 {
                    if slot <= 34282 {
// PORT: SOURCE SERVICER207.agc:293
//		TS	PIPAGE
// PORT: Fixed ROM slots 34282.
                        if slot <> 34282 or instruction <> 23192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34283 {
// PORT: SOURCE SERVICER207.agc:294
//
// PORT: SOURCE SERVICER207.agc:295
//		CA	TWO		# SET PIPCTR FOR ONMINTOR
// PORT: Fixed ROM slots 34283.
                            if slot <> 34283 or instruction <> 14862 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:296
//		TS	PIPCTR		# AFTER ABOVE PHASCHNG
// PORT: Fixed ROM slots 34284.
                            if slot <> 34284 or instruction <> 23191 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23191, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34285 {
// PORT: SOURCE SERVICER207.agc:297
//
// PORT: SOURCE SERVICER207.agc:298
//		CS	CM/FLAGS
// PORT: Fixed ROM slots 34285.
                        if slot <> 34285 or instruction <> 16450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 66).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34286 {
// PORT: SOURCE SERVICER207.agc:299
//		MASK	BIT2		# CM/DSTBY
// PORT: Fixed ROM slots 34286.
                            if slot <> 34286 or instruction <> 31246 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                if fixedOperand = 2 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:300
//		CCS	A
// PORT: Fixed ROM slots 34287.
                            if slot <> 34287 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34290 {
                    if slot <= 34288 {
// PORT: SOURCE SERVICER207.agc:301
//		TC	CHEKAVEG
// PORT: Fixed ROM slots 34288.
                        if slot <> 34288 or instruction <> 1563 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1563, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34289 {
// PORT: SOURCE SERVICER207.agc:302
//
// PORT: SOURCE SERVICER207.agc:303
//		CS	PIPTIME1 +1
// PORT: Fixed ROM slots 34289.
                            if slot <> 34289 or instruction <> 17062 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 678).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:304
//		TS	TBASE6		# FOR RESTARTS
// PORT: Fixed ROM slots 34290.
                            if slot <> 34290 or instruction <> 23093 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23093, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34291 {
// PORT: SOURCE SERVICER207.agc:305
//		EXTEND			# CONTINUE FOR ENTRY DAP
// PORT: Fixed ROM slots 34291.
                        if slot <> 34291 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34292 {
// PORT: SOURCE SERVICER207.agc:306
//		DCA	AOG
// PORT: Fixed ROM slots 34292.
                            if slot <> 34292 or instruction <> 13234 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 946, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:307
//		DXCH	AOG/PIP
// PORT: Fixed ROM slots 34293.
                            if slot <> 34293 or instruction <> 22456 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 952, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34299 {
                if slot <= 34296 {
                    if slot <= 34294 {
// PORT: SOURCE SERVICER207.agc:308
//		CA	AMG
// PORT: Fixed ROM slots 34294.
                        if slot <> 34294 or instruction <> 13235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 947).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34295 {
// PORT: SOURCE SERVICER207.agc:309
//		XCH	AMG/PIP
// PORT: Fixed ROM slots 34295.
                            if slot <> 34295 or instruction <> 24505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 953, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:310
//		EXTEND
// PORT: Fixed ROM slots 34296.
                            if slot <> 34296 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34297 {
// PORT: SOURCE SERVICER207.agc:311
//		DCA	ROLL/180
// PORT: Fixed ROM slots 34297.
                        if slot <> 34297 or instruction <> 13237 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 949, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34298 {
// PORT: SOURCE SERVICER207.agc:312
//		DXCH	ROLL/PIP
// PORT: Fixed ROM slots 34298.
                            if slot <> 34298 or instruction <> 22459 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 955, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:313
//		CA	BETA/180
// PORT: Fixed ROM slots 34299.
                            if slot <> 34299 or instruction <> 13238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 950).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34302 {
                    if slot <= 34300 {
// PORT: SOURCE SERVICER207.agc:314
//		XCH	BETA/PIP
// PORT: Fixed ROM slots 34300.
                        if slot <> 34300 or instruction <> 24508 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 956, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34301 {
// PORT: SOURCE SERVICER207.agc:315
//		CA	CM/FLAGS
// PORT: Fixed ROM slots 34301.
                            if slot <> 34301 or instruction <> 12354 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 66).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:316
//		MASK	BIT12		# CM/DAPARM 93D BIT12
// PORT: Fixed ROM slots 34302.
                            if slot <> 34302 or instruction <> 31236 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                                if fixedOperand = 2048 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34304 {
                        if slot <= 34303 {
// PORT: SOURCE SERVICER207.agc:317
//		EXTEND			# DURING ENTRY, WHEN RCS DAP IS INACTIVE,
// PORT: Fixed ROM slots 34303.
                            if slot <> 34303 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:318
//		BZF	NOSAVPIP	# SAVE PIPAS EACH 0.5 SEC FOR TM.
// PORT: Fixed ROM slots 34304.
                            if slot <> 34304 or instruction <> 5646 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5646, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34305 {
// PORT: SOURCE SERVICER207.agc:319
//
// PORT: SOURCE SERVICER207.agc:320
//		CA	0.5SEC
// PORT: Fixed ROM slots 34305.
                            if slot <> 34305 or instruction <> 13878 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1590), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:321
//		TC	WAITLIST
// PORT: Fixed ROM slots 34306.
                            if slot <> 34306 or instruction <> 2725 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2725, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1928] to agcAotUnit1928@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:322
//		EBANK=	XPIPBUF
// PORT: SOURCE SERVICER207.agc:323
//		2CADR	QUIKREAD
// PORT: Fixed ROM slots 34307 34308.
    34307, 3182, 34308, 63596
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34309–34321.
function agcAotUnit1929 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34314 {
        if slot <= 34311 {
            if slot <= 34309 {
// PORT: SOURCE SERVICER207.agc:324
//
// PORT: SOURCE SERVICER207.agc:325
//					# NO NEED TO RESTART PROTECT THIS.
// PORT: SOURCE SERVICER207.agc:326
//		CA	DELVX		# SAVE PIPAS AS READ (BUT NOT COMPENSATED)
// PORT: Fixed ROM slots 34309.
                if slot <> 34309 or instruction <> 12914 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 626).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34310 {
// PORT: SOURCE SERVICER207.agc:327
//		XCH	XPIPBUF
// PORT: Fixed ROM slots 34310.
                    if slot <> 34310 or instruction <> 24411 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 859, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:328
//		TS	XOLDBUF
// PORT: Fixed ROM slots 34311.
                    if slot <> 34311 or instruction <> 23390 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23390, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34312 {
// PORT: SOURCE SERVICER207.agc:329
//
// PORT: SOURCE SERVICER207.agc:330
//		CA	DELVY
// PORT: Fixed ROM slots 34312.
                if slot <> 34312 or instruction <> 12916 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 628).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34313 {
// PORT: SOURCE SERVICER207.agc:331
//		XCH	YPIPBUF
// PORT: Fixed ROM slots 34313.
                    if slot <> 34313 or instruction <> 24412 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 860, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:332
//		TS	YOLDBUF
// PORT: Fixed ROM slots 34314.
                    if slot <> 34314 or instruction <> 23391 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23391, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34317 {
            if slot <= 34315 {
// PORT: SOURCE SERVICER207.agc:333
//# Page 825
// PORT: SOURCE SERVICER207.agc:334
//		CA	DELVZ
// PORT: Fixed ROM slots 34315.
                if slot <> 34315 or instruction <> 12918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 630).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34316 {
// PORT: SOURCE SERVICER207.agc:335
//		XCH	ZPIPBUF
// PORT: Fixed ROM slots 34316.
                    if slot <> 34316 or instruction <> 24413 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 861, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:336
//		TS	ZOLDBUF
// PORT: Fixed ROM slots 34317.
                    if slot <> 34317 or instruction <> 23392 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23392, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34319 {
                if slot <= 34318 {
// PORT: SOURCE SERVICER207.agc:337
//
// PORT: SOURCE SERVICER207.agc:338
//NOSAVPIP	CA	FIVE
// PORT: Fixed ROM slots 34318.
                    if slot <> 34318 or instruction <> 14866 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:339
//		TS	CM/GYMDT
// PORT: Fixed ROM slots 34319.
                    if slot <> 34319 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34320 {
// PORT: SOURCE SERVICER207.agc:340
//
// PORT: SOURCE SERVICER207.agc:341
//		CA	JTAGTIME	# ACTIVATE CM/RCS AFTER PIPUP TO GO
// PORT: Fixed ROM slots 34320.
                    if slot <> 34320 or instruction <> 13979 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1691), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:342
//					# IN JTAGTIME +5 CS.
// PORT: SOURCE SERVICER207.agc:343
//		TC	WAITLIST
// PORT: Fixed ROM slots 34321.
                    if slot <> 34321 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1929] to agcAotUnit1929@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:344
//		EBANK=	AOG
// PORT: SOURCE SERVICER207.agc:345
//		2CADR	SETJTAG
// PORT: Fixed ROM slots 34322 34323.
    34322, 3342, 34323, 26732
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34324–34325.
function agcAotUnit1930 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34324 {
// PORT: SOURCE SERVICER207.agc:346
//
// PORT: SOURCE SERVICER207.agc:347
//		CS	THREE		# 1.3SPOT FOR SETJTAG
// PORT: Fixed ROM slots 34324.
        if slot <> 34324 or instruction <> 19596 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 3212), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:348
//		TC	NEWPHASE
// PORT: Fixed ROM slots 34325.
        if slot <> 34325 or instruction <> 2124 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2124, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1930] to agcAotUnit1930@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:349
//		OCT	1
// PORT: Fixed ROM slots 34326.
    34326, 2
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34327–34336.
function agcAotUnit1931 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34331 {
        if slot <= 34328 {
            if slot <= 34327 {
// PORT: SOURCE SERVICER207.agc:350
//
// PORT: SOURCE SERVICER207.agc:351
//		CAF	OCT37
// PORT: Fixed ROM slots 34327.
                if slot <> 34327 or instruction <> 14578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:352
//		TS	L
// PORT: Fixed ROM slots 34328.
                if slot <> 34328 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34329 {
// PORT: SOURCE SERVICER207.agc:353
//		COM
// PORT: Fixed ROM slots 34329.
                if slot <> 34329 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34330 {
// PORT: SOURCE SERVICER207.agc:354
//		DXCH	-PHASE5
// PORT: Fixed ROM slots 34330.
                    if slot <> 34330 or instruction <> 22003 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:355
//
// PORT: SOURCE SERVICER207.agc:356
//CHEKAVEG	CS	FLAGWRD1
// PORT: Fixed ROM slots 34331.
                    if slot <> 34331 or instruction <> 16445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 61).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34333 {
            if slot <= 34332 {
// PORT: SOURCE SERVICER207.agc:357
//		MASK	BIT1
// PORT: Fixed ROM slots 34332.
                if slot <> 34332 or instruction <> 31247 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    if fixedOperand = 1 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:358
//		CCS	A		# IF AVEG FLAG DOWN SET FINAL EXIT AVEG
// PORT: Fixed ROM slots 34333.
                if slot <> 34333 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34334 {
// PORT: SOURCE SERVICER207.agc:359
//		TC	AVEGOUT
// PORT: Fixed ROM slots 34334.
                if slot <> 34334 or instruction <> 1582 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1582, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34335 {
// PORT: SOURCE SERVICER207.agc:360
//
// PORT: SOURCE SERVICER207.agc:361
//		CAF	2SECS
// PORT: Fixed ROM slots 34335.
                    if slot <> 34335 or instruction <> 14882 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2594), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:362
//		TC	WAITLIST
// PORT: Fixed ROM slots 34336.
                    if slot <> 34336 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1931] to agcAotUnit1931@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:363
//		EBANK=	AOG
// PORT: SOURCE SERVICER207.agc:364
//		2CADR	READACCS
// PORT: Fixed ROM slots 34337 34338.
    34337, 3016, 34338, 63596
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34339–34340.
function agcAotUnit1932 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34339 {
// PORT: SOURCE SERVICER207.agc:365
//
// PORT: SOURCE SERVICER207.agc:366
//MAKESERV	CAF	PRIO20		# ESTABLISH SERVICER ROUTINE
// PORT: Fixed ROM slots 34339.
        if slot <> 34339 or instruction <> 14850 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:367
//		TC	FINDVAC
// PORT: Fixed ROM slots 34340.
        if slot <> 34340 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1932] to agcAotUnit1932@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:368
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER207.agc:369
//		2CADR	SERVICER
// PORT: Fixed ROM slots 34341 34342.
    34341, 3208, 34342, 63598
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34343–34344.
function agcAotUnit1933 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34343 {
// PORT: SOURCE SERVICER207.agc:370
//
// PORT: SOURCE SERVICER207.agc:371
//		CS	FOUR		# RESTART SERVICER AND READACCS
// PORT: Fixed ROM slots 34343.
        if slot <> 34343 or instruction <> 18957 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:372
//		TC	NEWPHASE
// PORT: Fixed ROM slots 34344.
        if slot <> 34344 or instruction <> 2124 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2124, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1933] to agcAotUnit1933@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:373
//		OCT	5
// PORT: Fixed ROM slots 34345.
    34345, 10
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34346–34353.
function agcAotUnit1934 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34349 {
        if slot <= 34347 {
            if slot <= 34346 {
// PORT: SOURCE SERVICER207.agc:374
//
// PORT: SOURCE SERVICER207.agc:375
//		CAF	BIT9
// PORT: Fixed ROM slots 34346.
                if slot <> 34346 or instruction <> 14855 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:376
//		EXTEND
// PORT: Fixed ROM slots 34347.
                if slot <> 34347 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34348 {
// PORT: SOURCE SERVICER207.agc:377
//		WOR	DSALMOUT	# TURN TEST CONNECTOR OUTBIT ON
// PORT: Fixed ROM slots 34348.
                if slot <> 34348 or instruction <> 2569 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:378
//
// PORT: SOURCE SERVICER207.agc:379
//		TCF	TASKOVER	# END PREVIOUS READACCS WAITLIST TASK
// PORT: Fixed ROM slots 34349.
                if slot <> 34349 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34351 {
            if slot <= 34350 {
// PORT: SOURCE SERVICER207.agc:380
//
// PORT: SOURCE SERVICER207.agc:381
//# Page 826
// PORT: SOURCE SERVICER207.agc:382
//AVEGOUT		EXTEND
// PORT: Fixed ROM slots 34350.
                if slot <> 34350 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:383
//		DCA	AVOUTCAD
// PORT: Fixed ROM slots 34351.
                if slot <> 34351 or instruction <> 13875 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1587, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34352 {
// PORT: SOURCE SERVICER207.agc:384
//		DXCH	AVGEXIT
// PORT: Fixed ROM slots 34352.
                if slot <> 34352 or instruction <> 22163 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:385
//		TCF	MAKESERV
// PORT: Fixed ROM slots 34353.
                if slot <> 34353 or instruction <> 5667 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5667, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1934] to agcAotUnit1934@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:386
//
// PORT: SOURCE SERVICER207.agc:387
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER207.agc:388
//AVOUTCAD	2CADR	AVGEND
// PORT: Fixed ROM slots 34354 34355.
    34354, 3306, 34355, 63598
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34356–34357.
function agcAotUnit1935 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34356 {
// PORT: SOURCE SERVICER207.agc:389
//
// PORT: SOURCE SERVICER207.agc:390
//# Page 827
// PORT: SOURCE SERVICER207.agc:391
//# ROUTINE NAME:	ONMNITOR
// PORT: SOURCE SERVICER207.agc:392
//# MOD 04 BY BAIRNSFATHER 30 APR 1968	REDO ONMNITOR TO SAVE PIPS EACH 0.5 SEC FOR TM,ENTRY.
// PORT: SOURCE SERVICER207.agc:393
//# MOD 03 BY FISHER DECEMBER 1967
// PORT: SOURCE SERVICER207.agc:394
//# MOD 02 BY RYE SEPT 1967
// PORT: SOURCE SERVICER207.agc:395
//# MOD 01 BY KOSMALA 23 MAR 1967
// PORT: SOURCE SERVICER207.agc:396
//# MOD 00 BY KOSMALA 27 FEB 1967
// PORT: SOURCE SERVICER207.agc:397
//
// PORT: SOURCE SERVICER207.agc:398
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE SERVICER207.agc:399
//
// PORT: SOURCE SERVICER207.agc:400
//#	THE PURPOSE OF ONMONITOR IS TO PROVIDE 1/2 SEC.READING OF PIPAS FOR DOWNLIST DURING ENTRY.
// PORT: SOURCE SERVICER207.agc:401
//#	X,Y,ZPIPBUF CONTAIN PRESET VALUES X,Y,ZOLDBUF CONTAIN VALUES FROM PREVIOUS READING.
// PORT: SOURCE SERVICER207.agc:402
//
// PORT: SOURCE SERVICER207.agc:403
//# CALLING SEQUENCE
// PORT: SOURCE SERVICER207.agc:404
//
// PORT: SOURCE SERVICER207.agc:405
//#	CALL AS WAITLIST TASK. TERMINATES ITSELF IN TASKOVER
// PORT: SOURCE SERVICER207.agc:406
//
// PORT: SOURCE SERVICER207.agc:407
//# INITIALISATION
// PORT: SOURCE SERVICER207.agc:408
//
// PORT: SOURCE SERVICER207.agc:409
//#	PIPCTR = 2 (FOR DT = 0.5 SEC)
// PORT: SOURCE SERVICER207.agc:410
//#	X,Y,ZPIPBUF SET TO PREVIOUS PIPAX,Y,Z
// PORT: SOURCE SERVICER207.agc:411
//
// PORT: SOURCE SERVICER207.agc:412
//# OUTPUT
// PORT: SOURCE SERVICER207.agc:413
//
// PORT: SOURCE SERVICER207.agc:414
//#	X,Y,ZPIPBUF, X,Y,ZOLDBUF
// PORT: SOURCE SERVICER207.agc:415
//# DEBRIS
// PORT: SOURCE SERVICER207.agc:416
//
// PORT: SOURCE SERVICER207.agc:417
//#	X,Y,ZPIPBUF CONTAIN LAST PIPAX,Y,Z VALUES
// PORT: SOURCE SERVICER207.agc:418
//#		X,Y,ZOLDBUF CONTAIN LAST-BUT-ONE PIPAX,Y,Z VALUES
// PORT: SOURCE SERVICER207.agc:419
//#	RUPTREG1
// PORT: SOURCE SERVICER207.agc:420
//#	PIPCTR
// PORT: SOURCE SERVICER207.agc:421
//
// PORT: SOURCE SERVICER207.agc:422
//ONMNITOR	TS	PIPCTR
// PORT: Fixed ROM slots 34356.
        if slot <> 34356 or instruction <> 23191 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23191, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:423
//
// PORT: SOURCE SERVICER207.agc:424
//		TC	FIXDELAY	# WAIT
// PORT: Fixed ROM slots 34357.
        if slot <> 34357 or instruction <> 2743 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2743, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1935] to agcAotUnit1935@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:425
//0.5SEC		DEC	50
// PORT: Fixed ROM slots 34358.
    34358, 100
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34359–34361.
function agcAotUnit1936 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34359 {
// PORT: SOURCE SERVICER207.agc:426
//
// PORT: SOURCE SERVICER207.agc:427
//QUIKREAD	CAF	TWO
// PORT: Fixed ROM slots 34359.
        if slot <> 34359 or instruction <> 14862 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34360 {
// PORT: SOURCE SERVICER207.agc:428
//		TS	RUPTREG1
// PORT: Fixed ROM slots 34360.
            if slot <> 34360 or instruction <> 22584 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22584, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:429
//		INDEX	A
// PORT: Fixed ROM slots 34361.
            if slot <> 34361 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1936] to agcAotUnit1936@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:430
//		CA	PIPAX		# SAVE ACTUAL PIPAS FOR TM.
// PORT: Fixed ROM slots 34362.
    34362, 24638
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34363–34363.
function agcAotUnit1937 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:431
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 34363.
    if slot <> 34363 or instruction <> 20536 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1937] to agcAotUnit1937@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:432
//		XCH	XPIPBUF		# UPDATE X,Y,ZPIPBUF
// PORT: Fixed ROM slots 34364.
    34364, 48822
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34365–34365.
function agcAotUnit1938 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:433
//		INDEX	RUPTREG1
// PORT: Fixed ROM slots 34365.
    if slot <> 34365 or instruction <> 20536 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1938] to agcAotUnit1938@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:434
//		TS	XOLDBUF		# AND X,Y,ZOLDBUF
// PORT: Fixed ROM slots 34366.
    34366, 46780
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34367–34376.
function agcAotUnit1939 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34371 {
        if slot <= 34368 {
            if slot <= 34367 {
// PORT: SOURCE SERVICER207.agc:435
//CHKCTR		CCS	RUPTREG1
// PORT: Fixed ROM slots 34367.
                if slot <> 34367 or instruction <> 4152 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 56).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:436
//		TCF	QUIKREAD +1	# LOOP AGAIN
// PORT: Fixed ROM slots 34368.
                if slot <> 34368 or instruction <> 5688 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5688, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34369 {
// PORT: SOURCE SERVICER207.agc:437
//		CCS	PIPCTR
// PORT: Fixed ROM slots 34369.
                if slot <> 34369 or instruction <> 4759 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 663).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34370 {
// PORT: SOURCE SERVICER207.agc:438
//		TCF	ONMNITOR
// PORT: Fixed ROM slots 34370.
                    if slot <> 34370 or instruction <> 5684 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5684, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:439
//		TC	TASKOVER
// PORT: Fixed ROM slots 34371.
                    if slot <> 34371 or instruction <> 2772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2772, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34373 {
            if slot <= 34372 {
// PORT: SOURCE SERVICER207.agc:440
//
// PORT: SOURCE SERVICER207.agc:441
//# Page 828
// PORT: SOURCE SERVICER207.agc:442
//# ********************* SERVICER ***************************************
// PORT: SOURCE SERVICER207.agc:443
//#
// PORT: SOURCE SERVICER207.agc:444
//
// PORT: SOURCE SERVICER207.agc:445
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER207.agc:446
//
// PORT: SOURCE SERVICER207.agc:447
//SERVICER	CAF	TWO
// PORT: Fixed ROM slots 34372.
                if slot <> 34372 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:448
//		INHINT
// PORT: Fixed ROM slots 34373.
                if slot <> 34373 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34374 {
// PORT: SOURCE SERVICER207.agc:449
//PIPCHECK	TS	RUPTREG1
// PORT: Fixed ROM slots 34374.
                if slot <> 34374 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34375 {
// PORT: SOURCE SERVICER207.agc:450
//
// PORT: SOURCE SERVICER207.agc:451
//		DOUBLE
// PORT: Fixed ROM slots 34375.
                    if slot <> 34375 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SERVICER207.agc:452
//		INDEX	A
// PORT: Fixed ROM slots 34376.
                    if slot <> 34376 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1939] to agcAotUnit1939@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:453
//		CCS	DELVX
// PORT: Fixed ROM slots 34377.
    34377, 9444
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34378–34383.
function agcAotUnit1940 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34380 {
        if slot <= 34378 {
// PORT: SOURCE SERVICER207.agc:454
//		TC	+2
// PORT: Fixed ROM slots 34378.
            if slot <> 34378 or instruction <> 1612 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1612, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34379 {
// PORT: SOURCE SERVICER207.agc:455
//		TC	PIPLOOP
// PORT: Fixed ROM slots 34379.
                if slot <> 34379 or instruction <> 1618 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1618, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:456
//
// PORT: SOURCE SERVICER207.agc:457
//		AD	-MAXDELV	# DO PIPA-SATURATION TEST BEFORE
// PORT: Fixed ROM slots 34380.
                if slot <> 34380 or instruction <> 26266 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1690), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34381 {
// PORT: SOURCE SERVICER207.agc:458
//		EXTEND
// PORT: Fixed ROM slots 34381.
            if slot <> 34381 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34382 {
// PORT: SOURCE SERVICER207.agc:459
//		BZMF	PIPLOOP		# COMPENSATION.
// PORT: Fixed ROM slots 34382.
                if slot <> 34382 or instruction <> 26194 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26194, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:460
//
// PORT: SOURCE SERVICER207.agc:461
//		TC	ALARM
// PORT: Fixed ROM slots 34383.
                if slot <> 34383 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1940] to agcAotUnit1940@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:462
//		OCT	00205		# SATURATED-PIPA ALARM   ***CHANGE LATER
// PORT: Fixed ROM slots 34384.
    34384, 266
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34385–34388.
function agcAotUnit1941 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34386 {
        if slot <= 34385 {
// PORT: SOURCE SERVICER207.agc:463
//		TC	AVERAGEG
// PORT: Fixed ROM slots 34385.
            if slot <> 34385 or instruction <> 1635 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1635, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:464
//
// PORT: SOURCE SERVICER207.agc:465
//PIPLOOP		CCS	RUPTREG1
// PORT: Fixed ROM slots 34386.
            if slot <> 34386 or instruction <> 4152 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 56).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34387 {
// PORT: SOURCE SERVICER207.agc:466
//		TCF	PIPCHECK
// PORT: Fixed ROM slots 34387.
            if slot <> 34387 or instruction <> 5702 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5702, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:467
//
// PORT: SOURCE SERVICER207.agc:468
//		TC	PHASCHNG	# RESTART REREADAC + SERVICER
// PORT: Fixed ROM slots 34388.
            if slot <> 34388 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1941] to agcAotUnit1941@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:469
//		OCT	16035
// PORT: Fixed ROM slots 34389.
    34389, 14394,
// PORT: SOURCE SERVICER207.agc:470
//		OCT	20000
// PORT: Fixed ROM slots 34390.
    34390, 16384,
// PORT: SOURCE SERVICER207.agc:471
//		EBANK=	DVCNTR
// PORT: SOURCE SERVICER207.agc:472
//		2CADR	DVTOTUP
// PORT: Fixed ROM slots 34391 34392.
    34391, 3254, 34392, 63598
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34393–34393.
function agcAotUnit1942 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:473
//
// PORT: SOURCE SERVICER207.agc:474
//		TC	BANKCALL	# PIPA COMPENSATION CALL
// PORT: Fixed ROM slots 34393.
    if slot <> 34393 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1942] to agcAotUnit1942@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:475
//		CADR	1/PIPA
// PORT: Fixed ROM slots 34394.
    34394, 13668
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34395–34395.
function agcAotUnit1943 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:476
//
// PORT: SOURCE SERVICER207.agc:477
//DVTOTUP		TC	INTPRET
// PORT: Fixed ROM slots 34395.
    if slot <> 34395 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1943] to agcAotUnit1943@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:478
//		VLOAD	ABVAL		# GET ABS VALUE OF DELV
// PORT: Fixed ROM slots 34396.
    34396, 42746,
// PORT: SOURCE SERVICER207.agc:479
//			DELV
// PORT: Fixed ROM slots 34397.
    34397, 1254,
// PORT: SOURCE SERVICER207.agc:480
//		DMP	EXIT
// PORT: Fixed ROM slots 34398.
    34398, 65034,
// PORT: SOURCE SERVICER207.agc:481
//			KPIP1		# SCALE AT 2(+7)
// PORT: Fixed ROM slots 34399.
    34399, 32338
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34400–34402.
function agcAotUnit1944 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34400 {
// PORT: SOURCE SERVICER207.agc:482
//
// PORT: SOURCE SERVICER207.agc:483
//		EXTEND
// PORT: Fixed ROM slots 34400.
        if slot <> 34400 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34401 {
// PORT: SOURCE SERVICER207.agc:484
//		DCA	MPAC
// PORT: Fixed ROM slots 34401.
            if slot <> 34401 or instruction <> 12397 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:485
//		DAS	DVTOTAL		# ACCUMULATE DVTOTAL
// PORT: Fixed ROM slots 34402.
            if slot <> 34402 or instruction <> 8982 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 790) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1944] to agcAotUnit1944@.

// PORT: Physical bank 37. Shared continuation entries, slots 34403–34403.
function agcAotUnit1945 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:486
//AVERAGEG	TC	PHASCHNG
// PORT: Fixed ROM slots 34403.
    if slot <> 34403 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1945] to agcAotUnit1945@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:487
//		OCT	10035
// PORT: Fixed ROM slots 34404.
    34404, 8250
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34405–34405.
function agcAotUnit1946 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:488
//
// PORT: SOURCE SERVICER207.agc:489
//		TC	INTPRET
// PORT: Fixed ROM slots 34405.
    if slot <> 34405 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1946] to agcAotUnit1946@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:490
//		CALL
// PORT: Fixed ROM slots 34406.
    34406, 65320,
// PORT: SOURCE SERVICER207.agc:491
//# Page 829
// PORT: SOURCE SERVICER207.agc:492
//			CALCRVG
// PORT: Fixed ROM slots 34407.
    34407, 65056,
// PORT: SOURCE SERVICER207.agc:493
//		EXIT
// PORT: Fixed ROM slots 34408.
    34408, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34409–34409.
function agcAotUnit1947 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:494
//
// PORT: SOURCE SERVICER207.agc:495
//		TC	PHASCHNG
// PORT: Fixed ROM slots 34409.
    if slot <> 34409 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1947] to agcAotUnit1947@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:496
//		OCT	10035
// PORT: Fixed ROM slots 34410.
    34410, 8250
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34411–34412.
function agcAotUnit1948 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34411 {
// PORT: SOURCE SERVICER207.agc:497
//
// PORT: SOURCE SERVICER207.agc:498
//		CAF	OCT31		# COPY RN1,VN1,GOT102,GOBL1/2,PIPTIME1
// PORT: Fixed ROM slots 34411.
        if slot <> 34411 or instruction <> 14411 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2123), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:499
//		TC	GENTRAN		# INTO RN ,VN ,GDT/12 ,GOBL/2 ,PIPTIME
// PORT: Fixed ROM slots 34412.
        if slot <> 34412 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1948] to agcAotUnit1948@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:500
//		ADRES	RN1
// PORT: Fixed ROM slots 34413.
    34413, 1330,
// PORT: SOURCE SERVICER207.agc:501
//		ADRES	RN
// PORT: Fixed ROM slots 34414.
    34414, 1264
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34415–34416.
function agcAotUnit1949 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34415 {
// PORT: SOURCE SERVICER207.agc:502
//		RELINT			# GENTRAN DOES AN INHINT
// PORT: Fixed ROM slots 34415.
        if slot <> 34415 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:503
//		TC	PHASCHNG
// PORT: Fixed ROM slots 34416.
        if slot <> 34416 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1949] to agcAotUnit1949@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:504
//		OCT	10035
// PORT: Fixed ROM slots 34417.
    34417, 8250
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34418–34423.
function agcAotUnit1950 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34420 {
        if slot <= 34418 {
// PORT: SOURCE SERVICER207.agc:505
//
// PORT: SOURCE SERVICER207.agc:506
//		EXTEND
// PORT: Fixed ROM slots 34418.
            if slot <> 34418 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34419 {
// PORT: SOURCE SERVICER207.agc:507
//		DCA	AVGEXIT
// PORT: Fixed ROM slots 34419.
                if slot <> 34419 or instruction <> 12947 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 659, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:508
//		DXCH	Z		# AVERAGEG EXIT
// PORT: Fixed ROM slots 34420.
                if slot <> 34420 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 34421 {
// PORT: SOURCE SERVICER207.agc:509
//
// PORT: SOURCE SERVICER207.agc:510
//AVGEND		CA	PIPTIME +1	# FINAL AVERAGE G EXIT
// PORT: Fixed ROM slots 34421.
            if slot <> 34421 or instruction <> 12933 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 645).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34422 {
// PORT: SOURCE SERVICER207.agc:511
//		TS	OLDBT1		# SET UP FREE FALL GYRO COMPENSATION
// PORT: Fixed ROM slots 34422.
                if slot <> 34422 or instruction <> 23100 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23100, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:512
//
// PORT: SOURCE SERVICER207.agc:513
//		TC	UPFLAG		# SET DRIFTFLG
// PORT: Fixed ROM slots 34423.
                if slot <> 34423 or instruction <> 2918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2918, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1950] to agcAotUnit1950@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:514
//		ADRES	DRIFTFLG	# BIT 15 FLAG 2
// PORT: Fixed ROM slots 34424.
    34424, 60
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34425–34425.
function agcAotUnit1951 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:515
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 34425.
    if slot <> 34425 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1951] to agcAotUnit1951@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:516
//		OCT	5		# GROUP 5 OFF
// PORT: Fixed ROM slots 34426.
    34426, 10,
// PORT: SOURCE SERVICER207.agc:517
//		OCT	05022		# GROUP 2 ON FOR AVETOMID
// PORT: Fixed ROM slots 34427.
    34427, 5156,
// PORT: SOURCE SERVICER207.agc:518
//		OCT	20000
// PORT: Fixed ROM slots 34428.
    34428, 16384
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34429–34429.
function agcAotUnit1952 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:519
//
// PORT: SOURCE SERVICER207.agc:520
//		TC	INTPRET
// PORT: Fixed ROM slots 34429.
    if slot <> 34429 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1952] to agcAotUnit1952@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:521
//		CALL
// PORT: Fixed ROM slots 34430.
    34430, 65320,
// PORT: SOURCE SERVICER207.agc:522
//			AVETOMID	# CONVERT STATE VECTOR TO REFERENCE SCALE.
// PORT: Fixed ROM slots 34431.
    34431, 61306,
// PORT: SOURCE SERVICER207.agc:523
//		EXIT
// PORT: Fixed ROM slots 34432.
    34432, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34433–34436.
function agcAotUnit1953 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34434 {
        if slot <= 34433 {
// PORT: SOURCE SERVICER207.agc:524
//
// PORT: SOURCE SERVICER207.agc:525
//		CAF	ZERO		# ZERO MARK COUNTERS.
// PORT: Fixed ROM slots 34433.
            if slot <> 34433 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:526
//		TS	VHFCNT
// PORT: Fixed ROM slots 34434.
            if slot <> 34434 or instruction <> 23125 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23125, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34435 {
// PORT: SOURCE SERVICER207.agc:527
//		TS	TRKMKCNT
// PORT: Fixed ROM slots 34435.
            if slot <> 34435 or instruction <> 23126 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23126, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:528
//
// PORT: SOURCE SERVICER207.agc:529
//		TC	BANKCALL
// PORT: Fixed ROM slots 34436.
            if slot <> 34436 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1953] to agcAotUnit1953@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:530
//		CADR	PIPFREE
// PORT: Fixed ROM slots 34437.
    34437, 15606
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34438–34442.
function agcAotUnit1954 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34439 {
        if slot <= 34438 {
// PORT: SOURCE SERVICER207.agc:531
//
// PORT: SOURCE SERVICER207.agc:532
//		CS	BIT9
// PORT: Fixed ROM slots 34438.
            if slot <> 34438 or instruction <> 18951 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:533
//		TS	MRKBUF2		# INVALIDATE MARK BUFFER
// PORT: Fixed ROM slots 34439.
            if slot <> 34439 or instruction <> 23516 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23516, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34440 {
// PORT: SOURCE SERVICER207.agc:534
//		EXTEND
// PORT: Fixed ROM slots 34440.
            if slot <> 34440 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34441 {
// PORT: SOURCE SERVICER207.agc:535
//		WAND	DSALMOUT
// PORT: Fixed ROM slots 34441.
                if slot <> 34441 or instruction <> 1545 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:536
//
// PORT: SOURCE SERVICER207.agc:537
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 34442.
                if slot <> 34442 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1954] to agcAotUnit1954@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:538
//		ADRES	CM/DSTBY
// PORT: Fixed ROM slots 34443.
    34443, 206
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34444–34444.
function agcAotUnit1955 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:539
//
// PORT: SOURCE SERVICER207.agc:540
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 34444.
    if slot <> 34444 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1955] to agcAotUnit1955@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:541
//		ADRES	V37FLAG
// PORT: Fixed ROM slots 34445.
    34445, 228
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34446–34450.
function agcAotUnit1956 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34447 {
        if slot <= 34446 {
// PORT: SOURCE SERVICER207.agc:542
//
// PORT: SOURCE SERVICER207.agc:543
//# Page 830
// PORT: SOURCE SERVICER207.agc:544
//		CAF	BIT7		# RESTORE GROUP 1 + 2 IF P20 IS RUNNING.
// PORT: Fixed ROM slots 34446.
            if slot <> 34446 or instruction <> 14857 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SERVICER207.agc:545
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 34447.
            if slot <> 34447 or instruction <> 28732 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 60).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34448 {
// PORT: SOURCE SERVICER207.agc:546
//		EXTEND
// PORT: Fixed ROM slots 34448.
            if slot <> 34448 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34449 {
// PORT: SOURCE SERVICER207.agc:547
//		BZF	+4
// PORT: Fixed ROM slots 34449.
                if slot <> 34449 or instruction <> 5781 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5781, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SERVICER207.agc:548
//
// PORT: SOURCE SERVICER207.agc:549
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 34450.
                if slot <> 34450 or instruction <> 2810 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2810, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1956] to agcAotUnit1956@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:550
//		OCT	111		# 1.11SPOT
// PORT: Fixed ROM slots 34451.
    34451, 146,
// PORT: SOURCE SERVICER207.agc:551
//		OCT	132		# 2.13SPOT
// PORT: Fixed ROM slots 34452.
    34452, 180
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34453–34453.
function agcAotUnit1957 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:552
//
// PORT: SOURCE SERVICER207.agc:553
//		TC	POSTJUMP
// PORT: Fixed ROM slots 34453.
    if slot <> 34453 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1957] to agcAotUnit1957@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:554
//		CADR	CANV37
// PORT: Fixed ROM slots 34454.
    34454, 8360
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34455–34455.
function agcAotUnit1958 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:555
//
// PORT: SOURCE SERVICER207.agc:556
//SERVEXIT	TC	PHASCHNG
// PORT: Fixed ROM slots 34455.
    if slot <> 34455 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1958] to agcAotUnit1958@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:557
//		OCT	00035		# A, 5.3 = REREADAC (ONLY)
// PORT: Fixed ROM slots 34456.
    34456, 58
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34457–34457.
function agcAotUnit1959 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SERVICER207.agc:558
//
// PORT: SOURCE SERVICER207.agc:559
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 34457.
    if slot <> 34457 or instruction <> 6799 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6799, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1959] to agcAotUnit1959@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:560
//
// PORT: SOURCE SERVICER207.agc:561
//DVTHRUSH	EQUALS	ELEVEN		# 15 PERCENT OF 2SEC PIPA ACCUMULATION,
// PORT: SOURCE SERVICER207.agc:562
//					#	FOR 503-FULL CSM/LEM....DELV SC.AT
// PORT: SOURCE SERVICER207.agc:563
//					#	5.85 CM/SEC.
// PORT: SOURCE SERVICER207.agc:564
//
// PORT: SOURCE SERVICER207.agc:565
//-MAXDELV	DEC	-6398		# 3200 PPS FOR 2 SEC CCS TAKES 1
// PORT: Fixed ROM slots 34458.
    34458, 52738,
// PORT: SOURCE SERVICER207.agc:566
//
// PORT: SOURCE SERVICER207.agc:567
//JTAGTIME	DEC	120		# = 1 SEC + T CDU, T CDU = .1 SEC
// PORT: Fixed ROM slots 34459.
    34459, 240,
// PORT: SOURCE SERVICER207.agc:568
//
// PORT: SOURCE SERVICER207.agc:569
//2.5SEC		DEC	250
// PORT: Fixed ROM slots 34460.
    34460, 500,
// PORT: SOURCE SERVICER207.agc:570
//MDOTFAIL	DEC	144.0 B-16	# 5 SEC MASS LOSS AT 28.8 KG/SEC
// PORT: Fixed ROM slots 34461.
    34461, 72
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34462–34463.
function agcAotUnit1960 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34462 {
// PORT: SOURCE SERVICER207.agc:571
//					# SHOULD BE 2-4 SECS FOR NO START
// PORT: SOURCE SERVICER207.agc:572
//					#	    6-8 SECS FOR FAILURE
// PORT: SOURCE SERVICER207.agc:573
//
// PORT: SOURCE SERVICER207.agc:574
//# Page 831
// PORT: SOURCE SERVICER207.agc:575
//# NORMLIZE PERFORMS THE INITIALIZATION REQUIRED PRIOR TO THE FIRST ENTRY TO AVERAGEG, AND SCALES RN SO THAT IT
// PORT: SOURCE SERVICER207.agc:576
//# HAS 1 LEADING BINARY ZERO.  IN MOST MISSIONS, RN WILL BE SCALED AT 2(+29), BUT IN THE 206 MISSION, RN WILL BE
// PORT: SOURCE SERVICER207.agc:577
//# SCALED AT 2(+24)M.
// PORT: SOURCE SERVICER207.agc:578
//
// PORT: SOURCE SERVICER207.agc:579
//NORMLIZE	CAF	THIRTEEN	# SET UP TO COPY 14 REGS- RN1,VN1,PIPTIME1
// PORT: Fixed ROM slots 34462.
        if slot <> 34462 or instruction <> 14869 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2581), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:580
//		TC	GENTRAN		# INTO RN,VN, PIPTIME
// PORT: Fixed ROM slots 34463.
        if slot <> 34463 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1960] to agcAotUnit1960@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:581
//		ADRES	RN1		# FROM HERE
// PORT: Fixed ROM slots 34464.
    34464, 1330,
// PORT: SOURCE SERVICER207.agc:582
//		ADRES	RN		# TO HERE
// PORT: Fixed ROM slots 34465.
    34465, 1264
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34466–34467.
function agcAotUnit1961 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34466 {
// PORT: SOURCE SERVICER207.agc:583
//
// PORT: SOURCE SERVICER207.agc:584
//		RELINT
// PORT: Fixed ROM slots 34466.
        if slot <> 34466 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE SERVICER207.agc:585
//		TC	INTPRET
// PORT: Fixed ROM slots 34467.
        if slot <> 34467 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1961] to agcAotUnit1961@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:586
//		VLOAD	CALL		# LOAD RN FOR CALCGRAV
// PORT: Fixed ROM slots 34468.
    34468, 38138,
// PORT: SOURCE SERVICER207.agc:587
//			RN
// PORT: Fixed ROM slots 34469.
    34469, 1266,
// PORT: SOURCE SERVICER207.agc:588
//			CALCGRAV	# INITIALISE UNITR RMAG GDT1
// PORT: Fixed ROM slots 34470.
    34470, 64982,
// PORT: SOURCE SERVICER207.agc:589
//
// PORT: SOURCE SERVICER207.agc:590
//		STOVL	GDT/2
// PORT: Fixed ROM slots 34471.
    34471, 21774,
// PORT: SOURCE SERVICER207.agc:591
//			GOBL1/2
// PORT: Fixed ROM slots 34472.
    34472, 1372,
// PORT: SOURCE SERVICER207.agc:592
//		STORE	GOBL/2
// PORT: Fixed ROM slots 34473.
    34473, 1306,
// PORT: SOURCE SERVICER207.agc:593
//		EXIT
// PORT: Fixed ROM slots 34474.
    34474, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34475–34537.
function agcAotUnit1962 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34505 {
        if slot <= 34489 {
            if slot <= 34481 {
                if slot <= 34477 {
                    if slot <= 34475 {
// PORT: SOURCE SERVICER207.agc:594
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 34475.
                        if slot <> 34475 or instruction <> 6799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34476 {
// PORT: SOURCE SERVICER207.agc:595
//
// PORT: SOURCE SERVICER207.agc:596
//# Page 832
// PORT: SOURCE SERVICER207.agc:597
//# *****  PIPA READER *****
// PORT: SOURCE SERVICER207.agc:598
//
// PORT: SOURCE SERVICER207.agc:599
//
// PORT: SOURCE SERVICER207.agc:600
//# 		MOD NO. 00 BY D. LICKLY DEC.9 1966
// PORT: SOURCE SERVICER207.agc:601
//
// PORT: SOURCE SERVICER207.agc:602
//
// PORT: SOURCE SERVICER207.agc:603
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE SERVICER207.agc:604
//
// PORT: SOURCE SERVICER207.agc:605
//# 	SUBROUTINE TO READ PIPA COUNTERS, TRYING TO BE VERY CAREFUL SO THAT IT WILL BE RESTARTABLE.
// PORT: SOURCE SERVICER207.agc:606
//# 	PIPA READINGS ARE STORED IN THE VECTOR DELV.  THE HIGH ORDER PART OF EACH COMPONENT CONTAINS THE PIPA READING,
// PORT: SOURCE SERVICER207.agc:607
//# 	RESTARTS BEGIN AT REREADAC.
// PORT: SOURCE SERVICER207.agc:608
//
// PORT: SOURCE SERVICER207.agc:609
//
// PORT: SOURCE SERVICER207.agc:610
//# 	AT THE END OF THE PIPA READER THE CDUS ARE READ AND STORED AS A
// PORT: SOURCE SERVICER207.agc:611
//# VECTOR IN CDUTEMP.  THE HIGH ORDER PART OF EACH COMPONENT CONTAINS
// PORT: SOURCE SERVICER207.agc:612
//# THE CDU READING IN 2S COMP IN THE ORDER CDUX,Y,Z.  THE THRUST
// PORT: SOURCE SERVICER207.agc:613
//# VECTOR ESTIMATOR IN FINDCDUD REQUIRES THE CDUS BE READ AT PIPTIME.
// PORT: SOURCE SERVICER207.agc:614
//
// PORT: SOURCE SERVICER207.agc:615
//# CALLING SEQUENCE AND EXIT
// PORT: SOURCE SERVICER207.agc:616
//
// PORT: SOURCE SERVICER207.agc:617
//#	CALL VIA TC, ISWCALL, ETC.
// PORT: SOURCE SERVICER207.agc:618
//
// PORT: SOURCE SERVICER207.agc:619
//#	EXIT IS VIA Q.
// PORT: SOURCE SERVICER207.agc:620
//
// PORT: SOURCE SERVICER207.agc:621
//
// PORT: SOURCE SERVICER207.agc:622
//# INPUT
// PORT: SOURCE SERVICER207.agc:623
//
// PORT: SOURCE SERVICER207.agc:624
//#	INPUT IS THROUGH THE COUNTERS PIPAX, PIPAY, PIPAZ, AND TIME2.
// PORT: SOURCE SERVICER207.agc:625
//
// PORT: SOURCE SERVICER207.agc:626
//
// PORT: SOURCE SERVICER207.agc:627
//# OUTPUT
// PORT: SOURCE SERVICER207.agc:628
//
// PORT: SOURCE SERVICER207.agc:629
//#	HIGH ORDER COMPONENTS OF THE VECTOR DELV CONTAIN THE PIPA READINGS.
// PORT: SOURCE SERVICER207.agc:630
//#	PIPTIME CONTAINS TIME OF PIPA READING.
// PORT: SOURCE SERVICER207.agc:631
//
// PORT: SOURCE SERVICER207.agc:632
//
// PORT: SOURCE SERVICER207.agc:633
//# DEBRIS (ERASABLE LOCATIONS DESTROYED BY THE PROGRAM)
// PORT: SOURCE SERVICER207.agc:634
//
// PORT: SOURCE SERVICER207.agc:635
//#		LOW ORDER DELV'S ARE ZEROED FOR TM INDICATION.
// PORT: SOURCE SERVICER207.agc:636
//#		TEMX	TEMY	TEMZ	PIPAGE
// PORT: SOURCE SERVICER207.agc:637
//
// PORT: SOURCE SERVICER207.agc:638
//PIPASR		EXTEND
// PORT: Fixed ROM slots 34476.
                            if slot <> 34476 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:639
//		DCA	TIME2
// PORT: Fixed ROM slots 34477.
                            if slot <> 34477 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34479 {
                        if slot <= 34478 {
// PORT: SOURCE SERVICER207.agc:640
//		DXCH	PIPTIME1	# CURRENT TIME	POSITIVE VALUE
// PORT: Fixed ROM slots 34478.
                            if slot <> 34478 or instruction <> 22182 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 678, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:641
//		CS	ZERO		# INITIALIZE THESE AT NEG ZERO.
// PORT: Fixed ROM slots 34479.
                            if slot <> 34479 or instruction <> 18961 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34480 {
// PORT: SOURCE SERVICER207.agc:642
//		TS	TEMX
// PORT: Fixed ROM slots 34480.
                            if slot <> 34480 or instruction <> 23188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:643
//		TS	TEMY
// PORT: Fixed ROM slots 34481.
                            if slot <> 34481 or instruction <> 23189 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23189, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34485 {
                    if slot <= 34483 {
                        if slot <= 34482 {
// PORT: SOURCE SERVICER207.agc:644
//		TS	TEMZ
// PORT: Fixed ROM slots 34482.
                            if slot <> 34482 or instruction <> 23190 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23190, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:645
//# Page 833
// PORT: SOURCE SERVICER207.agc:646
//		CA	ZERO
// PORT: Fixed ROM slots 34483.
                            if slot <> 34483 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34484 {
// PORT: SOURCE SERVICER207.agc:647
//		TS	DELVZ		# OTHER DELVS OK INCLUDING LOW ORDER
// PORT: Fixed ROM slots 34484.
                            if slot <> 34484 or instruction <> 23158 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23158, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:648
//		TS	DELVY
// PORT: Fixed ROM slots 34485.
                            if slot <> 34485 or instruction <> 23156 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23156, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34487 {
                        if slot <= 34486 {
// PORT: SOURCE SERVICER207.agc:649
//
// PORT: SOURCE SERVICER207.agc:650
//		TS	DELVX +1	# LOW ORDER DELV'S ARE ZEROED FOR TM: THUS
// PORT: Fixed ROM slots 34486.
                            if slot <> 34486 or instruction <> 23155 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23155, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:651
//		TS	DELVY +1	# IF DNLNK'D LOW ORDER DELVS ARE NZ, THEY
// PORT: Fixed ROM slots 34487.
                            if slot <> 34487 or instruction <> 23157 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23157, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34488 {
// PORT: SOURCE SERVICER207.agc:652
//		TS	DELVZ +1	# CONTAIN PROPER COMPENSATION.  IF=0, THEN
// PORT: Fixed ROM slots 34488.
                            if slot <> 34488 or instruction <> 23159 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23159, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:653
//					# THE TM VALUES ARE BEFORE COMPENSATION.
// PORT: SOURCE SERVICER207.agc:654
//
// PORT: SOURCE SERVICER207.agc:655
//		TS	PIPAGE		# SHOW PIPA READING IN PROGRESS
// PORT: Fixed ROM slots 34489.
                            if slot <> 34489 or instruction <> 23192 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23192, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34497 {
                if slot <= 34493 {
                    if slot <= 34491 {
                        if slot <= 34490 {
// PORT: SOURCE SERVICER207.agc:656
//
// PORT: SOURCE SERVICER207.agc:657
//REPIP1		EXTEND
// PORT: Fixed ROM slots 34490.
                            if slot <> 34490 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:658
//		DCS	PIPAX		# X AND Y PIPS READ
// PORT: Fixed ROM slots 34491.
                            if slot <> 34491 or instruction <> 16416 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 32, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34492 {
// PORT: SOURCE SERVICER207.agc:659
//		DXCH	TEMX
// PORT: Fixed ROM slots 34492.
                            if slot <> 34492 or instruction <> 22165 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 661, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:660
//		DXCH	PIPAX		# PIPAS SET TO NEG ZERO AS READ.
// PORT: Fixed ROM slots 34493.
                            if slot <> 34493 or instruction <> 21536 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 32, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34495 {
                        if slot <= 34494 {
// PORT: SOURCE SERVICER207.agc:661
//		TS	DELVX
// PORT: Fixed ROM slots 34494.
                            if slot <> 34494 or instruction <> 23154 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23154, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:662
//		LXCH	DELVY
// PORT: Fixed ROM slots 34495.
                            if slot <> 34495 or instruction <> 9844 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 628, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34496 {
// PORT: SOURCE SERVICER207.agc:663
//
// PORT: SOURCE SERVICER207.agc:664
//REPIP3		CS	PIPAZ		# REPEAT PROCESS FOR Z PIP
// PORT: Fixed ROM slots 34496.
                            if slot <> 34496 or instruction <> 16417 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 33).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:665
//		XCH	TEMZ
// PORT: Fixed ROM slots 34497.
                            if slot <> 34497 or instruction <> 24214 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 662, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34501 {
                    if slot <= 34499 {
                        if slot <= 34498 {
// PORT: SOURCE SERVICER207.agc:666
//		XCH	PIPAZ
// PORT: Fixed ROM slots 34498.
                            if slot <> 34498 or instruction <> 23585 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 33, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:667
//DODELVZ		TS	DELVZ
// PORT: Fixed ROM slots 34499.
                            if slot <> 34499 or instruction <> 23158 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23158, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34500 {
// PORT: SOURCE SERVICER207.agc:668
//
// PORT: SOURCE SERVICER207.agc:669
//		TC	Q
// PORT: Fixed ROM slots 34500.
                            if slot <> 34500 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:670
//
// PORT: SOURCE SERVICER207.agc:671
//		EBANK=	AOG
// PORT: SOURCE SERVICER207.agc:672
//
// PORT: SOURCE SERVICER207.agc:673
//REREADAC	CCS	PHASE5		# LAST PASS CHECK
// PORT: Fixed ROM slots 34501.
                            if slot <> 34501 or instruction <> 4595 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 499).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34503 {
                        if slot <= 34502 {
// PORT: SOURCE SERVICER207.agc:674
//		TCF	+2
// PORT: Fixed ROM slots 34502.
                            if slot <> 34502 or instruction <> 5832 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5832, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:675
//		TCF	TASKOVER
// PORT: Fixed ROM slots 34503.
                            if slot <> 34503 or instruction <> 6868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34504 {
// PORT: SOURCE SERVICER207.agc:676
//
// PORT: SOURCE SERVICER207.agc:677
//		CAF	PRIO31		# RESTART MAY HAVE WIPED OUT LASTBIAS, AN
// PORT: Fixed ROM slots 34504.
                            if slot <> 34504 or instruction <> 16309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4021), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:678
//		TS	1/PIPADT	#	UNPROTECTED NOVAC FROM PREREAD,
// PORT: Fixed ROM slots 34505.
                            if slot <> 34505 or instruction <> 23100 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23100, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 34521 {
            if slot <= 34513 {
                if slot <= 34509 {
                    if slot <= 34507 {
                        if slot <= 34506 {
// PORT: SOURCE SERVICER207.agc:679
//					#	WHICH SET(S) UP 1/PIPADT (THUSLY)
// PORT: SOURCE SERVICER207.agc:680
//					#	FOR NON-COASTING COMPENSATION....BE
// PORT: SOURCE SERVICER207.agc:681
//					#	SURE 1/PIPADT IS AOK.  (PRIO31 IS
// PORT: SOURCE SERVICER207.agc:682
//					#	2.0SEC SC.AT B+8CS)
// PORT: SOURCE SERVICER207.agc:683
//
// PORT: SOURCE SERVICER207.agc:684
//		CCS	PIPAGE
// PORT: Fixed ROM slots 34506.
                            if slot <> 34506 or instruction <> 4760 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 664).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:685
//		TCF	READACCS	# PIP READING NOT STARTED.  GO TO BEGINNING
// PORT: Fixed ROM slots 34507.
                            if slot <> 34507 or instruction <> 5604 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5604, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34508 {
// PORT: SOURCE SERVICER207.agc:686
//
// PORT: SOURCE SERVICER207.agc:687
//		CAF	DONEADR		# SET UP RETURN FROM PIPASR
// PORT: Fixed ROM slots 34508.
                            if slot <> 34508 or instruction <> 14058 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1770), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:688
//		TS	Q
// PORT: Fixed ROM slots 34509.
                            if slot <> 34509 or instruction <> 22530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34511 {
                        if slot <= 34510 {
// PORT: SOURCE SERVICER207.agc:689
//
// PORT: SOURCE SERVICER207.agc:690
//		CCS	DELVZ
// PORT: Fixed ROM slots 34510.
                            if slot <> 34510 or instruction <> 4726 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 630).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:691
//		TC	Q		# Z DONE, GO DO CDUS
// PORT: Fixed ROM slots 34511.
                            if slot <> 34511 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34512 {
// PORT: SOURCE SERVICER207.agc:692
//		TCF	+3		# Z NOT DONE, CHECK Y.
// PORT: Fixed ROM slots 34512.
                            if slot <> 34512 or instruction <> 5843 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5843, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:693
//		TC	Q
// PORT: Fixed ROM slots 34513.
                            if slot <> 34513 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34517 {
                    if slot <= 34515 {
                        if slot <= 34514 {
// PORT: SOURCE SERVICER207.agc:694
//		TC	Q
// PORT: Fixed ROM slots 34514.
                            if slot <> 34514 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:695
//# Page 834
// PORT: SOURCE SERVICER207.agc:696
//		ZL
// PORT: Fixed ROM slots 34515.
                            if slot <> 34515 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34516 {
// PORT: SOURCE SERVICER207.agc:697
//		CCS	DELVY
// PORT: Fixed ROM slots 34516.
                            if slot <> 34516 or instruction <> 4724 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 628).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:698
//		TCF	+3
// PORT: Fixed ROM slots 34517.
                            if slot <> 34517 or instruction <> 5848 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5848, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34519 {
                        if slot <= 34518 {
// PORT: SOURCE SERVICER207.agc:699
//		TCF	CHKTEMX		# Y NOT DONE, CHECK X.
// PORT: Fixed ROM slots 34518.
                            if slot <> 34518 or instruction <> 5855 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5855, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:700
//		TCF	+1
// PORT: Fixed ROM slots 34519.
                            if slot <> 34519 or instruction <> 5848 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5848, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34520 {
// PORT: SOURCE SERVICER207.agc:701
//		LXCH	PIPAZ		# Y DONE, ZERO Z PIP.
// PORT: Fixed ROM slots 34520.
                            if slot <> 34520 or instruction <> 9249 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 33, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:702
//
// PORT: SOURCE SERVICER207.agc:703
//		CCS	TEMZ
// PORT: Fixed ROM slots 34521.
                            if slot <> 34521 or instruction <> 4758 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 662).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34529 {
                if slot <= 34525 {
                    if slot <= 34523 {
                        if slot <= 34522 {
// PORT: SOURCE SERVICER207.agc:704
//		CS	TEMZ		# TEMZ NOT = -0, CONTAINS -PIPAZ VALUE.
// PORT: Fixed ROM slots 34522.
                            if slot <> 34522 or instruction <> 17046 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 662).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:705
//		TCF	DODELVZ
// PORT: Fixed ROM slots 34523.
                            if slot <> 34523 or instruction <> 5827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5827, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34524 {
// PORT: SOURCE SERVICER207.agc:706
//		TCF	-2
// PORT: Fixed ROM slots 34524.
                            if slot <> 34524 or instruction <> 5850 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5850, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:707
//		LXCH	DELVZ		# TEMZ = -0, L HAS ZPIP VALUE.
// PORT: Fixed ROM slots 34525.
                            if slot <> 34525 or instruction <> 9846 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 630, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34527 {
                        if slot <= 34526 {
// PORT: SOURCE SERVICER207.agc:708
//		TC	Q
// PORT: Fixed ROM slots 34526.
                            if slot <> 34526 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:709
//
// PORT: SOURCE SERVICER207.agc:710
//CHKTEMX		CCS	TEMX		# HAS THIS CHANGED
// PORT: Fixed ROM slots 34527.
                            if slot <> 34527 or instruction <> 4756 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 660).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34528 {
// PORT: SOURCE SERVICER207.agc:711
//		CS	TEMX		# YES
// PORT: Fixed ROM slots 34528.
                            if slot <> 34528 or instruction <> 17044 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 660).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:712
//		TCF	+3		# YES
// PORT: Fixed ROM slots 34529.
                            if slot <> 34529 or instruction <> 5860 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5860, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34533 {
                    if slot <= 34531 {
                        if slot <= 34530 {
// PORT: SOURCE SERVICER207.agc:713
//		TCF	-2		# YES
// PORT: Fixed ROM slots 34530.
                            if slot <> 34530 or instruction <> 5856 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5856, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:714
//		TCF	REPIP1		# NO
// PORT: Fixed ROM slots 34531.
                            if slot <> 34531 or instruction <> 5818 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5818, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34532 {
// PORT: SOURCE SERVICER207.agc:715
//		TS	DELVX
// PORT: Fixed ROM slots 34532.
                            if slot <> 34532 or instruction <> 23154 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23154, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:716
//
// PORT: SOURCE SERVICER207.agc:717
//		CS	TEMY
// PORT: Fixed ROM slots 34533.
                            if slot <> 34533 or instruction <> 17045 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 661).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34535 {
                        if slot <= 34534 {
// PORT: SOURCE SERVICER207.agc:718
//		TS	DELVY
// PORT: Fixed ROM slots 34534.
                            if slot <> 34534 or instruction <> 23156 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23156, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:719
//
// PORT: SOURCE SERVICER207.agc:720
//		CS	ZERO		# ZERO X AND Y PIPS
// PORT: Fixed ROM slots 34535.
                            if slot <> 34535 or instruction <> 18961 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34536 {
// PORT: SOURCE SERVICER207.agc:721
//		DXCH	PIPAX		# L STILL ZERO FROM ABOVE
// PORT: Fixed ROM slots 34536.
                            if slot <> 34536 or instruction <> 21536 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 32, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE SERVICER207.agc:722
//
// PORT: SOURCE SERVICER207.agc:723
//		TCF	REPIP3
// PORT: Fixed ROM slots 34537.
                            if slot <> 34537 or instruction <> 5824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5824, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1962] to agcAotUnit1962@.

agcAotInstallSourceRope(list(
// PORT: SOURCE SERVICER207.agc:724
//
// PORT: SOURCE SERVICER207.agc:725
//DONEADR		GENADR	PIPSDONE
// PORT: Fixed ROM slots 34538.
    34538, 3018,
// PORT: SOURCE SERVICER207.agc:726
//
// PORT: SOURCE SERVICER207.agc:727
//# Page 835
// PORT: SOURCE SERVICER207.agc:728
//# *********************************************************************************************
// PORT: SOURCE SERVICER207.agc:729
//
// PORT: SOURCE SERVICER207.agc:730
//# 	ROUTINE CALCRVG INTEGRATES THE EQUATIONS OF MOTION BY AVERAGING THE THRUST AND GRAVITATIONAL
// PORT: SOURCE SERVICER207.agc:731
//# ACCELERATIONS OVER A TIME INTERVAL OF 2 SECONDS.
// PORT: SOURCE SERVICER207.agc:732
//#
// PORT: SOURCE SERVICER207.agc:733
//# 	FOR THE EARTH-CENTERED GRAVITATIONAL FIELD, THE PERTURBATION DUE TO OBLATENESS IS COMPUTED TO THE FIRST
// PORT: SOURCE SERVICER207.agc:734
//# HARMONIC COEFFICIENT J.
// PORT: SOURCE SERVICER207.agc:735
//
// PORT: SOURCE SERVICER207.agc:736
//# 	ROUTINE CALCRVG REQUIRES...
// PORT: SOURCE SERVICER207.agc:737
//#		1) THRUST ACCELERATION INCREMENTS IN DELV SCALED SAME AS PIPAX,Y,Z IN STABLE MEMBER COORDS.
// PORT: SOURCE SERVICER207.agc:738
//#		2) VN SCALED 2(+7)M/CS IN REFERENCE COORDS.
// PORT: SOURCE SERVICER207.agc:739
//#		3) RN SCALED AT 2(+29) METERS IN REFERENCE COORDS.
// PORT: SOURCE SERVICER207.agc:740
//#		4) UNITW THE EARTH S UNIT ROTATIONAL VECTOR (SCALED AS A FULL UNIT VECTOR) IN REFERENCE COORDS.
// PORT: SOURCE SERVICER207.agc:741
//
// PORT: SOURCE SERVICER207.agc:742
//# IT LEAVES RN1 UPDATED (SCALED AT 2(+29)M, VN1 (SCALED AT 2(+7)M/CS), AND GDT1/2 (SCALED AT 2(+7)M/CS). ALSO HALF
// PORT: SOURCE SERVICER207.agc:743
//# UNIT VECTOR UNITR, RMAG IN 36D SCALED AT 2(+29)M, R MAG SQ. IN 34D SCALED AT 2(+58) M SQ.
// PORT: SOURCE SERVICER207.agc:744
//
// PORT: SOURCE SERVICER207.agc:745
//CALCGRAV	UNIT	PUSH		# ENTER WITH RN IN MPAC
// PORT: Fixed ROM slots 34539.
    34539, 34396,
// PORT: SOURCE SERVICER207.agc:746
//		STORE 	UNITR
// PORT: Fixed ROM slots 34540.
    34540, 2016,
// PORT: SOURCE SERVICER207.agc:747
//		LXC,1	SLOAD
// PORT: Fixed ROM slots 34541.
    34541, 56768,
// PORT: SOURCE SERVICER207.agc:748
//			RTX2
// PORT: Fixed ROM slots 34542.
    34542, 4044,
// PORT: SOURCE SERVICER207.agc:749
//			X1
// PORT: Fixed ROM slots 34543.
    34543, 78,
// PORT: SOURCE SERVICER207.agc:750
//		BMN	VLOAD
// PORT: Fixed ROM slots 34544.
    34544, 64832,
// PORT: SOURCE SERVICER207.agc:751
//			ITISMOON
// PORT: Fixed ROM slots 34545.
    34545, 65038,
// PORT: SOURCE SERVICER207.agc:752
//		DOT	PUSH
// PORT: Fixed ROM slots 34546.
    34546, 34370,
// PORT: SOURCE SERVICER207.agc:753
//			UNITW
// PORT: Fixed ROM slots 34547.
    34547, 1944,
// PORT: SOURCE SERVICER207.agc:754
//		DSQ	BDSU
// PORT: Fixed ROM slots 34548.
    34548, 37276,
// PORT: SOURCE SERVICER207.agc:755
//			DP1/20
// PORT: Fixed ROM slots 34549.
    34549, 32354,
// PORT: SOURCE SERVICER207.agc:756
//		PDDL	DDV
// PORT: Fixed ROM slots 34550.
    34550, 47530,
// PORT: SOURCE SERVICER207.agc:757
//			RESQ
// PORT: Fixed ROM slots 34551.
    34551, 32358,
// PORT: SOURCE SERVICER207.agc:758
//			34D		# (RN)SQ
// PORT: Fixed ROM slots 34552.
    34552, 70,
// PORT: SOURCE SERVICER207.agc:759
//		STORE	32D		# TEMP FOR (RE/RN)SQ
// PORT: Fixed ROM slots 34553.
    34553, 66,
// PORT: SOURCE SERVICER207.agc:760
//		DMP	DMP
// PORT: Fixed ROM slots 34554.
    34554, 34058,
// PORT: SOURCE SERVICER207.agc:761
//			20J
// PORT: Fixed ROM slots 34555.
    34555, 32362,
// PORT: SOURCE SERVICER207.agc:762
//		VXSC	PDDL
// PORT: Fixed ROM slots 34556.
    34556, 54754,
// PORT: SOURCE SERVICER207.agc:763
//			UNITR
// PORT: Fixed ROM slots 34557.
    34557, 2016,
// PORT: SOURCE SERVICER207.agc:764
//		DMP	DMP
// PORT: Fixed ROM slots 34558.
    34558, 34058,
// PORT: SOURCE SERVICER207.agc:765
//			2J
// PORT: Fixed ROM slots 34559.
    34559, 32366,
// PORT: SOURCE SERVICER207.agc:766
//			32D
// PORT: Fixed ROM slots 34560.
    34560, 66,
// PORT: SOURCE SERVICER207.agc:767
//		VXSC	VAD
// PORT: Fixed ROM slots 34561.
    34561, 44514,
// PORT: SOURCE SERVICER207.agc:768
//			UNITW
// PORT: Fixed ROM slots 34562.
    34562, 1944,
// PORT: SOURCE SERVICER207.agc:769
//		STADR
// PORT: Fixed ROM slots 34563.
    34563, 65324,
// PORT: SOURCE SERVICER207.agc:770
//		STORE	GOBL1/2
// PORT: Fixed ROM slots 34564.
    34564, 64162,
// PORT: SOURCE SERVICER207.agc:771
//		VAD	PUSH
// PORT: Fixed ROM slots 34565.
    34565, 34394,
// PORT: SOURCE SERVICER207.agc:772
//			UNITR
// PORT: Fixed ROM slots 34566.
    34566, 2016,
// PORT: SOURCE SERVICER207.agc:773
//ITISMOON	DLOAD	NORM
// PORT: Fixed ROM slots 34567.
    34567, 49610,
// PORT: SOURCE SERVICER207.agc:774
//			34D
// PORT: Fixed ROM slots 34568.
    34568, 70,
// PORT: SOURCE SERVICER207.agc:775
//			X2
// PORT: Fixed ROM slots 34569.
    34569, 80,
// PORT: SOURCE SERVICER207.agc:776
//		BDDV*	SLR*
// PORT: Fixed ROM slots 34570.
    34570, 44902,
// PORT: SOURCE SERVICER207.agc:777
//# Page 836
// PORT: SOURCE SERVICER207.agc:778
//			-MUDT(E),1
// PORT: Fixed ROM slots 34571.
    34571, 32342,
// PORT: SOURCE SERVICER207.agc:779
//			0 -21D,2
// PORT: Fixed ROM slots 34572.
    34572, 47910,
// PORT: SOURCE SERVICER207.agc:780
//		VXSC	STADR
// PORT: Fixed ROM slots 34573.
    34573, 38626,
// PORT: SOURCE SERVICER207.agc:781
//		STORE	GDT1/2		# SCALED AT 2(+7) M/CS
// PORT: Fixed ROM slots 34574.
    34574, 64174,
// PORT: SOURCE SERVICER207.agc:782
//		RVQ
// PORT: Fixed ROM slots 34575.
    34575, 65308,
// PORT: SOURCE SERVICER207.agc:783
//
// PORT: SOURCE SERVICER207.agc:784
//CALCRVG		VLOAD	VXSC
// PORT: Fixed ROM slots 34576.
    34576, 61946,
// PORT: SOURCE SERVICER207.agc:785
//			DELV
// PORT: Fixed ROM slots 34577.
    34577, 1254,
// PORT: SOURCE SERVICER207.agc:786
//			KPIP1
// PORT: Fixed ROM slots 34578.
    34578, 32338,
// PORT: SOURCE SERVICER207.agc:787
//		VXM	VSL1
// PORT: Fixed ROM slots 34579.
    34579, 64138,
// PORT: SOURCE SERVICER207.agc:788
//			REFSMMAT
// PORT: Fixed ROM slots 34580.
    34580, 1980,
// PORT: SOURCE SERVICER207.agc:789
//		STORE	DELVREF		# DELV IN REF COORDS AT 2(+7)
// PORT: Fixed ROM slots 34581.
    34581, 3638,
// PORT: SOURCE SERVICER207.agc:790
//		VSR1	PUSH
// PORT: Fixed ROM slots 34582.
    34582, 34532,
// PORT: SOURCE SERVICER207.agc:791
//		VAD	PUSH		# (DV-OLDGDT)/2 TO PD SCALED AT 2(+7)M/CS
// PORT: Fixed ROM slots 34583.
    34583, 34394,
// PORT: SOURCE SERVICER207.agc:792
//			GDT/2
// PORT: Fixed ROM slots 34584.
    34584, 1294,
// PORT: SOURCE SERVICER207.agc:793
//		VAD	VXSC
// PORT: Fixed ROM slots 34585.
    34585, 61786,
// PORT: SOURCE SERVICER207.agc:794
//			VN
// PORT: Fixed ROM slots 34586.
    34586, 1278,
// PORT: SOURCE SERVICER207.agc:795
//			2SEC(22)
// PORT: Fixed ROM slots 34587.
    34587, 32350,
// PORT: SOURCE SERVICER207.agc:796
//		VAD	STQ
// PORT: Fixed ROM slots 34588.
    34588, 36954,
// PORT: SOURCE SERVICER207.agc:797
//			RN
// PORT: Fixed ROM slots 34589.
    34589, 1266,
// PORT: SOURCE SERVICER207.agc:798
//			31D
// PORT: Fixed ROM slots 34590.
    34590, 62,
// PORT: SOURCE SERVICER207.agc:799
//		STCALL	RN1		# TEMP STORAGE OF RN SCALED 2(+29)M
// PORT: Fixed ROM slots 34591.
    34591, 30004,
// PORT: SOURCE SERVICER207.agc:800
//			CALCGRAV
// PORT: Fixed ROM slots 34592.
    34592, 64982,
// PORT: SOURCE SERVICER207.agc:801
//
// PORT: SOURCE SERVICER207.agc:802
//		VAD	VAD
// PORT: Fixed ROM slots 34593.
    34593, 44378,
// PORT: SOURCE SERVICER207.agc:803
//		VAD
// PORT: Fixed ROM slots 34594.
    34594, 65370,
// PORT: SOURCE SERVICER207.agc:804
//			VN
// PORT: Fixed ROM slots 34595.
    34595, 1278,
// PORT: SOURCE SERVICER207.agc:805
//		STCALL	VN1		# TEMP STORAGE OF VN SCALED 2(+7)M/CS.
// PORT: Fixed ROM slots 34596.
    34596, 30016,
// PORT: SOURCE SERVICER207.agc:806
//			31D
// PORT: Fixed ROM slots 34597.
    34597, 62,
// PORT: SOURCE SERVICER207.agc:807
//
// PORT: SOURCE SERVICER207.agc:808
//KPIP		2DEC	.1024		# SCALES DELV TO 2(+4)
// PORT: Fixed ROM slots 34598 34599.
    34598, 3354, 34599, 23646,
// PORT: SOURCE SERVICER207.agc:809
//
// PORT: SOURCE SERVICER207.agc:810
//KPIP1		2DEC	0.074880	# 207 DELV SCALING.  1 PULSE = 5.85 CM/SEC.
// PORT: Fixed ROM slots 34600 34601.
    34600, 2452, 34601, 27326,
// PORT: SOURCE SERVICER207.agc:811
//
// PORT: SOURCE SERVICER207.agc:812
//-MUDT(E)	2DEC*	-7.9720645 E+12 B-44*
// PORT: Fixed ROM slots 34602 34603.
    34602, 50686, 34603, 47064,
// PORT: SOURCE SERVICER207.agc:813
//
// PORT: SOURCE SERVICER207.agc:814
//-MUDT(M)	2DEC*	-9.805556 E+10 B-44*
// PORT: Fixed ROM slots 34604 34605.
    34604, 65352, 34605, 55004,
// PORT: SOURCE SERVICER207.agc:815
//
// PORT: SOURCE SERVICER207.agc:816
//2SEC(22)	2DEC	200 B-22
// PORT: Fixed ROM slots 34606 34607.
    34606, 0, 34607, 25600,
// PORT: SOURCE SERVICER207.agc:817
//
// PORT: SOURCE SERVICER207.agc:818
//DP1/20		2DEC	0.05
// PORT: Fixed ROM slots 34608 34609.
    34608, 1638, 34609, 6554,
// PORT: SOURCE SERVICER207.agc:819
//
// PORT: SOURCE SERVICER207.agc:820
//RESQ		2DEC*	40.6809913 E12 B-59*
// PORT: Fixed ROM slots 34610 34611.
    34610, 2, 34611, 5120,
// PORT: SOURCE SERVICER207.agc:821
//
// PORT: SOURCE SERVICER207.agc:822
//20J		2DEC*	3.24692010 E-2 B1*
// PORT: Fixed ROM slots 34612 34613.
    34612, 2126, 34613, 31156,
// PORT: SOURCE SERVICER207.agc:823
//
// PORT: SOURCE SERVICER207.agc:824
//2J		2DEC*	3.24692010 E-3 B1*
// PORT: Fixed ROM slots 34614 34615.
    34614, 212, 34615, 12946
)).

