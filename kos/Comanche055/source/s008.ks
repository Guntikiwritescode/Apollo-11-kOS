// CONTRACT_AND_APPROVALS.agc
// no code for the lines below
// CONTRACT_AND_APPROVALS.agc:1
//# Copyright:	Public domain.
// CONTRACT_AND_APPROVALS.agc:2
//# Filename:	CONTRACT_AND_APPROVALS.agc
// CONTRACT_AND_APPROVALS.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// CONTRACT_AND_APPROVALS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// CONTRACT_AND_APPROVALS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// CONTRACT_AND_APPROVALS.agc:6
//# Assembler:	yaYUL
// CONTRACT_AND_APPROVALS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// CONTRACT_AND_APPROVALS.agc:8
//# Website:	www.ibiblio.org/apollo.
// CONTRACT_AND_APPROVALS.agc:9
//# Mod history:	2009-05-06 RSB	Transcribed from page images.
// CONTRACT_AND_APPROVALS.agc:10
//#
// CONTRACT_AND_APPROVALS.agc:11
//# This source code has been transcribed or otherwise adapted from digitized
// CONTRACT_AND_APPROVALS.agc:12
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// CONTRACT_AND_APPROVALS.agc:13
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// CONTRACT_AND_APPROVALS.agc:14
//# thanks to both.  The images (with suitable reduction in storage size and
// CONTRACT_AND_APPROVALS.agc:15
//# consequent reduction in image quality as well) are available online at
// CONTRACT_AND_APPROVALS.agc:16
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// CONTRACT_AND_APPROVALS.agc:17
//# illegible, contact me at info@sandroid.org about getting access to the
// CONTRACT_AND_APPROVALS.agc:18
//# (much) higher-quality images which Paul actually created.
// CONTRACT_AND_APPROVALS.agc:19
//#
// CONTRACT_AND_APPROVALS.agc:20
//# Notations on the hardcopy document read, in part:
// CONTRACT_AND_APPROVALS.agc:21
//#
// CONTRACT_AND_APPROVALS.agc:22
//#	Assemble revision 055 of AGC program Comanche by NASA
// CONTRACT_AND_APPROVALS.agc:23
//#	2021113-051.  10:28 APR. 1, 1969
// CONTRACT_AND_APPROVALS.agc:24
//
// CONTRACT_AND_APPROVALS.agc:25
//# Page 1
// CONTRACT_AND_APPROVALS.agc:26
//
// CONTRACT_AND_APPROVALS.agc:27
//
// CONTRACT_AND_APPROVALS.agc:28
//# ************************************************************************
// CONTRACT_AND_APPROVALS.agc:29
//# *                                                                      *
// CONTRACT_AND_APPROVALS.agc:30
//# *	     THIS AGC PROGRAM SHALL ALSO BE REFERRED TO AS:              *
// CONTRACT_AND_APPROVALS.agc:31
//# *									 *
// CONTRACT_AND_APPROVALS.agc:32
//# *                                                                      *
// CONTRACT_AND_APPROVALS.agc:33
//# *			   COLOSSUS 2A                                   *
// CONTRACT_AND_APPROVALS.agc:34
//# *                                                                      *
// CONTRACT_AND_APPROVALS.agc:35
//# *                                                                      *
// CONTRACT_AND_APPROVALS.agc:36
//# *	  THIS PROGRAM IS INTENDED FOR USE IN THE CM AS SPECIFIED	 *
// CONTRACT_AND_APPROVALS.agc:37
//# *       IN REPORT R-577. THIS PROGRAM WAS PREPARED UNDER DSR		 *
// CONTRACT_AND_APPROVALS.agc:38
//# *       PROJECT 55-23870, SPONSORED BY THE MANNED SPACECRAFT		 *
// CONTRACT_AND_APPROVALS.agc:39
//# *       CENTER OF THE NATIONAL AERONAUTICS AND SPACE			 *
// CONTRACT_AND_APPROVALS.agc:40
//# *       ADMINISTRATION THROUGH CONTRACT NAS 9-4065 WITH THE		 *
// CONTRACT_AND_APPROVALS.agc:41
//# *       INSTRUMENTATION LABORATORY, MASSACHUSETTS INSTITUTE OF	 *
// CONTRACT_AND_APPROVALS.agc:42
//# *       TECHNOLOGY, CAMBRIDGE, MASS.					 *
// CONTRACT_AND_APPROVALS.agc:43
//# *                                                                      *
// CONTRACT_AND_APPROVALS.agc:44
//# ************************************************************************
// CONTRACT_AND_APPROVALS.agc:45
//
// CONTRACT_AND_APPROVALS.agc:46
//
// CONTRACT_AND_APPROVALS.agc:47
//#         SUBMITTED:	MARGARET H. HAMILTON		  DATE:	 28 MAR 69
// CONTRACT_AND_APPROVALS.agc:48
//#             M.H.HAMILTON, COLOSSUS PROGRAMMING LEADER
// CONTRACT_AND_APPROVALS.agc:49
//#             APOLLO GUIDANCE AND NAVIGATION
// CONTRACT_AND_APPROVALS.agc:50
//
// CONTRACT_AND_APPROVALS.agc:51
//#         APPROVED:	DANIEL J. LICKLY                  DATE:	 28 MAR 69
// CONTRACT_AND_APPROVALS.agc:52
//#             D.J.LICKLY, DIRECTOR, MISSION PROGRAM DEVELOPMENT
// CONTRACT_AND_APPROVALS.agc:53
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// CONTRACT_AND_APPROVALS.agc:54
//
// CONTRACT_AND_APPROVALS.agc:55
//#	  APPROVED: FRED H. MARTIN                  	  DATE:	 28 MAR 69
// CONTRACT_AND_APPROVALS.agc:56
//#             FRED H. MARTIN, COLOSSUS PROJECT MANGER
// CONTRACT_AND_APPROVALS.agc:57
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// CONTRACT_AND_APPROVALS.agc:58
//
// CONTRACT_AND_APPROVALS.agc:59
//#         APPROVED: NORMAN E.SEARS                 	  DATE:	 28 MAR 69
// CONTRACT_AND_APPROVALS.agc:60
//#             N.E. SEARS, DIRECTOR, MISSION DEVELOPMENT
// CONTRACT_AND_APPROVALS.agc:61
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// CONTRACT_AND_APPROVALS.agc:62
//
// CONTRACT_AND_APPROVALS.agc:63
//#         APPROVED: RICHARD H. BATTIN               	  DATE:	 28 MAR 69
// CONTRACT_AND_APPROVALS.agc:64
//#             R.H. BATTIN, DIRECTOR, MISSION DEVELOPMENT
// CONTRACT_AND_APPROVALS.agc:65
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// CONTRACT_AND_APPROVALS.agc:66
//
// CONTRACT_AND_APPROVALS.agc:67
//#         APPROVED: DAVID G. HOAG			  DATE:	 28 MAR 69
// CONTRACT_AND_APPROVALS.agc:68
//#             D.G. HOAG, DIRECTOR
// CONTRACT_AND_APPROVALS.agc:69
//#             APOLLO GUIDANCE AND NAVIGATION PROGRAM
// CONTRACT_AND_APPROVALS.agc:70
//
// CONTRACT_AND_APPROVALS.agc:71
//#         APPROVED: RALPH R. RAGAN			  DATE:	 28 MAR 69
// CONTRACT_AND_APPROVALS.agc:72
//#             R.R. RAGAN, DEPUTY DIRECTOR
// CONTRACT_AND_APPROVALS.agc:73
//#             INSTRUMENTATION LABORATORY
