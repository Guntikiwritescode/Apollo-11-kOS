// PORT: Original source unit CONTRACT_AND_APPROVALS.agc.
// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:2
//# Filename:	CONTRACT_AND_APPROVALS.agc
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:9
//# Mod history:	2009-05-06 RSB	Transcribed from page images.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:10
//#
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:11
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:12
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:13
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:14
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:15
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:16
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:17
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:18
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:19
//#
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:20
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:21
//#
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:22
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:23
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:24
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:25
//# Page 1
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:26
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:27
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:28
//# ************************************************************************
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:29
//# *                                                                      *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:30
//# *	     THIS AGC PROGRAM SHALL ALSO BE REFERRED TO AS:              *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:31
//# *									 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:32
//# *                                                                      *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:33
//# *			   COLOSSUS 2A                                   *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:34
//# *                                                                      *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:35
//# *                                                                      *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:36
//# *	  THIS PROGRAM IS INTENDED FOR USE IN THE CM AS SPECIFIED	 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:37
//# *       IN REPORT R-577. THIS PROGRAM WAS PREPARED UNDER DSR		 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:38
//# *       PROJECT 55-23870, SPONSORED BY THE MANNED SPACECRAFT		 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:39
//# *       CENTER OF THE NATIONAL AERONAUTICS AND SPACE			 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:40
//# *       ADMINISTRATION THROUGH CONTRACT NAS 9-4065 WITH THE		 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:41
//# *       INSTRUMENTATION LABORATORY, MASSACHUSETTS INSTITUTE OF	 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:42
//# *       TECHNOLOGY, CAMBRIDGE, MASS.					 *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:43
//# *                                                                      *
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:44
//# ************************************************************************
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:45
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:46
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:47
//#         SUBMITTED:	MARGARET H. HAMILTON		  DATE:	 28 MAR 69
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:48
//#             M.H.HAMILTON, COLOSSUS PROGRAMMING LEADER
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:49
//#             APOLLO GUIDANCE AND NAVIGATION
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:50
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:51
//#         APPROVED:	DANIEL J. LICKLY                  DATE:	 28 MAR 69
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:52
//#             D.J.LICKLY, DIRECTOR, MISSION PROGRAM DEVELOPMENT
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:53
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:54
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:55
//#	  APPROVED: FRED H. MARTIN                  	  DATE:	 28 MAR 69
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:56
//#             FRED H. MARTIN, COLOSSUS PROJECT MANGER
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:57
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:58
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:59
//#         APPROVED: NORMAN E.SEARS                 	  DATE:	 28 MAR 69
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:60
//#             N.E. SEARS, DIRECTOR, MISSION DEVELOPMENT
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:61
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:62
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:63
//#         APPROVED: RICHARD H. BATTIN               	  DATE:	 28 MAR 69
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:64
//#             R.H. BATTIN, DIRECTOR, MISSION DEVELOPMENT
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:65
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:66
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:67
//#         APPROVED: DAVID G. HOAG			  DATE:	 28 MAR 69
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:68
//#             D.G. HOAG, DIRECTOR
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:69
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:70
//
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:71
//#         APPROVED: RALPH R. RAGAN			  DATE:	 28 MAR 69
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:72
//#             R.R. RAGAN, DEPUTY DIRECTOR
// PORT: SOURCE CONTRACT_AND_APPROVALS.agc:73
//#             INSTRUMENTATION LABORATORY
