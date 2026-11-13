// GIMBAL_LOCK_AVOIDANCE.agc
agcAotInstallSourceRope(list(
// GIMBAL_LOCK_AVOIDANCE.agc:1
//# Copyright:	Public domain.
// GIMBAL_LOCK_AVOIDANCE.agc:2
//# Filename:	GIMBAL_LOCK_AVOIDANCE.agc
// GIMBAL_LOCK_AVOIDANCE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// GIMBAL_LOCK_AVOIDANCE.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// GIMBAL_LOCK_AVOIDANCE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// GIMBAL_LOCK_AVOIDANCE.agc:6
//# Assembler:	yaYUL
// GIMBAL_LOCK_AVOIDANCE.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// GIMBAL_LOCK_AVOIDANCE.agc:8
//# Website:	www.ibiblio.org/apollo.
// GIMBAL_LOCK_AVOIDANCE.agc:9
//# Pages:	364
// GIMBAL_LOCK_AVOIDANCE.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// GIMBAL_LOCK_AVOIDANCE.agc:11
//#				Luminary131 file, using page
// GIMBAL_LOCK_AVOIDANCE.agc:12
//#				images from Luminary 1A.
// GIMBAL_LOCK_AVOIDANCE.agc:13
//#		2010-12-31 JL	Fixed page number comment.
// GIMBAL_LOCK_AVOIDANCE.agc:14
//#
// GIMBAL_LOCK_AVOIDANCE.agc:15
//# This source code has been transcribed or otherwise adapted from
// GIMBAL_LOCK_AVOIDANCE.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// GIMBAL_LOCK_AVOIDANCE.agc:17
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// GIMBAL_LOCK_AVOIDANCE.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// GIMBAL_LOCK_AVOIDANCE.agc:19
//# in storage size and consequent reduction in image quality as well) are
// GIMBAL_LOCK_AVOIDANCE.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// GIMBAL_LOCK_AVOIDANCE.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// GIMBAL_LOCK_AVOIDANCE.agc:22
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// GIMBAL_LOCK_AVOIDANCE.agc:23
//# actually created.
// GIMBAL_LOCK_AVOIDANCE.agc:24
//#
// GIMBAL_LOCK_AVOIDANCE.agc:25
//# Notations on the hardcopy document read, in part:
// GIMBAL_LOCK_AVOIDANCE.agc:26
//#
// GIMBAL_LOCK_AVOIDANCE.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// GIMBAL_LOCK_AVOIDANCE.agc:28
//#	16:27 JULY 14, 1969
// GIMBAL_LOCK_AVOIDANCE.agc:29
//
// GIMBAL_LOCK_AVOIDANCE.agc:30
//# Page 364
// GIMBAL_LOCK_AVOIDANCE.agc:31
//		BANK	15
// GIMBAL_LOCK_AVOIDANCE.agc:32
//
// GIMBAL_LOCK_AVOIDANCE.agc:33
//		SETLOC	KALCMON1
// GIMBAL_LOCK_AVOIDANCE.agc:34
//		BANK
// GIMBAL_LOCK_AVOIDANCE.agc:35
//
// GIMBAL_LOCK_AVOIDANCE.agc:36
//# DETECTING GIMBAL LOCK
// GIMBAL_LOCK_AVOIDANCE.agc:37
//LOCSKIRT	EQUALS	NOGIMLOC
// GIMBAL_LOCK_AVOIDANCE.agc:38
//
// GIMBAL_LOCK_AVOIDANCE.agc:39
//NOGIMLOC	SET
// slot 20964
    20964, 65304,
// GIMBAL_LOCK_AVOIDANCE.agc:40
//			CALCMAN3
// slot 20965
    20965, 1144,
// GIMBAL_LOCK_AVOIDANCE.agc:41
//WCALC		LXC,1	DLOAD*
// slot 20966
    20966, 58304,
// GIMBAL_LOCK_AVOIDANCE.agc:42
//			RATEINDX	# CHOOSE THE DESIRED MANEUVER RATE
// slot 20967
    20967, 1450,
// GIMBAL_LOCK_AVOIDANCE.agc:43
//			ARATE,1		# FROM A LIST OF FOUR
// slot 20968
    20968, 5108,
// GIMBAL_LOCK_AVOIDANCE.agc:44
//		SR4	CALL		# COMPUTE THE INCREMENTAL ROTATION MATRIX
// slot 20969
    20969, 37892,
// GIMBAL_LOCK_AVOIDANCE.agc:45
//			DELCOMP		# DEL CORRESPONDING TO A 1 SEC ROTATION
// slot 20970
    20970, 37550,
// GIMBAL_LOCK_AVOIDANCE.agc:46
//					# ABOUT COF
// GIMBAL_LOCK_AVOIDANCE.agc:47
//		DLOAD*	VXSC
// slot 20971
    20971, 61894,
// GIMBAL_LOCK_AVOIDANCE.agc:48
//			ARATE,1
// slot 20972
    20972, 5108,
// GIMBAL_LOCK_AVOIDANCE.agc:49
//			COF
// slot 20973
    20973, 3442,
// GIMBAL_LOCK_AVOIDANCE.agc:50
//		STODL	BRATE		# COMPONENT MANEUVER RATES 45 DEG/SEC
// slot 20974
    20974, 15788,
// GIMBAL_LOCK_AVOIDANCE.agc:51
//			AM
// slot 20975
    20975, 3516,
// GIMBAL_LOCK_AVOIDANCE.agc:52
//		DMP	DDV*
// slot 20976
    20976, 46858,
// GIMBAL_LOCK_AVOIDANCE.agc:53
//			ANGLTIME
// slot 20977
    20977, 5124,
// GIMBAL_LOCK_AVOIDANCE.agc:54
//			ARATE,1
// slot 20978
    20978, 5108,
// GIMBAL_LOCK_AVOIDANCE.agc:55
//		SR
// slot 20979
    20979, 65378,
// GIMBAL_LOCK_AVOIDANCE.agc:56
//			5
// slot 20980
    20980, 17164,
// GIMBAL_LOCK_AVOIDANCE.agc:57
//		STORE	TM		# MANEUVER EXECUTION TIME SCALED AS T2
// slot 20981
    20981, 3512,
// GIMBAL_LOCK_AVOIDANCE.agc:58
//		SETGO
// slot 20982
    20982, 65304,
// GIMBAL_LOCK_AVOIDANCE.agc:59
//			CALCMAN2	# 0(OFF) = CONTINUE MANEUVER
// slot 20983
    20983, 1082,
// GIMBAL_LOCK_AVOIDANCE.agc:60
//			NEWANGL +1	# 1(ON) = START MANEUVER
// slot 20984
    20984, 37904,
// GIMBAL_LOCK_AVOIDANCE.agc:61
//
// GIMBAL_LOCK_AVOIDANCE.agc:62
//# THE FOUR SELECTABLE FREE FALL MANEUVER RATES SELECTED BY
// GIMBAL_LOCK_AVOIDANCE.agc:63
//# LOADING RATEINDX WITH 0,2,4,6, RESPECTIVELY
// GIMBAL_LOCK_AVOIDANCE.agc:64
//
// GIMBAL_LOCK_AVOIDANCE.agc:65
//ARATE		2DEC	.0088888888	# = 0.2 DEG/SEC		$ 22.5 DEG/SEC
// slot 20985 20986
    20985, 290, 20986, 20826,
// GIMBAL_LOCK_AVOIDANCE.agc:66
//
// GIMBAL_LOCK_AVOIDANCE.agc:67
//		2DEC	.0222222222	# = 0.5 DEG/SEC		$ 22.5 DEG/SEC
// slot 20987 20988
    20987, 728, 20988, 2912,
// GIMBAL_LOCK_AVOIDANCE.agc:68
//
// GIMBAL_LOCK_AVOIDANCE.agc:69
//		2DEC	.0888888888	# = 2.0 DEG/SEC		$ 22.5 DEG/SEC
// slot 20989 20990
    20989, 2912, 20990, 11650,
// GIMBAL_LOCK_AVOIDANCE.agc:70
//
// GIMBAL_LOCK_AVOIDANCE.agc:71
//		2DEC	.4444444444	# = 10.0 DEG/SEC	$ 22.5 DEG/SEC
// slot 20991 20992
    20991, 14562, 20992, 25486,
// GIMBAL_LOCK_AVOIDANCE.agc:72
//
// GIMBAL_LOCK_AVOIDANCE.agc:73
//ANGLTIME	2DEC	.0001907349	# = 1008-19 FUDGE FACTOR TO CONVERT
// slot 20993 20994
    20993, 6, 20994, 4096
)).

// no code for the lines below
// GIMBAL_LOCK_AVOIDANCE.agc:74
//					# MANEUVER ANGLE TO MANEUVER TIME
// GIMBAL_LOCK_AVOIDANCE.agc:75
//
// GIMBAL_LOCK_AVOIDANCE.agc:76
//
