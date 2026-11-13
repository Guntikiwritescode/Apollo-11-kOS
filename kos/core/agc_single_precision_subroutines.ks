// PORT: Comanche055 original header.
// Copyright:	Public domain.
// Filename:	SINGLE_PRECISION_SUBROUTINES.agc
// Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
//		It is part of the source code for the Command Module's (CM)
//		Apollo Guidance Computer (AGC), for Apollo 11.
// Assembler:	yaYUL
// Contact:	Ron Burkey <info@sandroid.org>.
// Website:	www.ibiblio.org/apollo.
// Pages:	1207
// Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
//				same name, using Comanche055 page images.
//
// This source code has been transcribed or otherwise adapted from digitized
// images of a hardcopy from the MIT Museum.  The digitization was performed
// by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// thanks to both.  The images (with suitable reduction in storage size and
// consequent reduction in image quality as well) are available online at
// www.ibiblio.org/apollo.  If for some reason you find that the images are
// illegible, contact me at info@sandroid.org about getting access to the
// (much) higher-quality images which Paul actually created.
//
// Notations on the hardcopy document read, in part:
//
//	Assemble revision 055 of AGC program Comanche by NASA
//	2021113-051.  10:28 APR. 1, 1969
//
//	This AGC program shall also be referred to as
//			Colossus 2A
// Page 1207
// SINGLE PRECISION SINE AND COSINE
// PORT: Luminary099 original header.
// Copyright:	Public domain.
// Filename:	SINGLE_PRECISION_SUBROUTINES.agc
// Purpose: 	Part of the source code for Luminary 1A build 099.
//		It is part of the source code for the Lunar Module's (LM)
//		Apollo Guidance Computer (AGC), for Apollo 11.
// Assembler:	yaYUL
// Contact:	Ron Burkey <info@sandroid.org>.
// Website:	www.ibiblio.org/apollo.
// Pages:	1102
// Mod history:	2009-05-25 RSB	Adapted from the corresponding
//				Luminary131 file, using page
//				images from Luminary 1A.
//		2010-12-31 JL	Fixed page number comment.
//
// This source code has been transcribed or otherwise adapted from
// digitized images of a hardcopy from the MIT Museum.  The digitization
// was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// the Museum.  Many thanks to both.  The images (with suitable reduction
// in storage size and consequent reduction in image quality as well) are
// available online at www.ibiblio.org/apollo.  If for some reason you
// find that the images are illegible, contact me at info@sandroid.org
// about getting access to the (much) higher-quality images which Paul
// actually created.
//
// Notations on the hardcopy document read, in part:
//
//	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
//	16:27 JULY 14, 1969
// Page 1102
// SINGLE PRECISION SINE AND COSINE

// SINGLE PRECISION SINE AND COSINE

function agcSpcos {
    parameter words, temkSlot.
    set words[0] to agcAddSP16(words[0], 8192). // ARGUMENTS SCALED AT PI
    agcSpsin(words, temkSlot).
}

function agcSpsin {
    parameter words, temkSlot.
    local stored is agcStoreAccumulator(words[0], temkSlot).
    set words[temkSlot] to stored[1].
    set words[0] to stored[0].
    if stored[2] = 1 {
        set words[0] to 65535 - agcSignExtend(words[temkSlot]).
    }

    // SPT
    set words[0] to agcAddSP16(words[0], words[0]).
    set stored to agcStoreAccumulator(words[0], temkSlot).
    set words[temkSlot] to stored[1].
    set words[0] to stored[0].
    local exactQuadrant is false.
    if stored[2] = 1 {
        set words[0] to agcSignExtend(words[temkSlot]).
        set words[temkSlot] to agcOverflowCorrected(stored[0]).
        // INDEX TEMK / AD LIMITS. The TS overflow result is +1 or -1.
        local limitWord is choose 16384 if stored[0] = 1 else 16383.
        set words[0] to agcAddSP16(words[0], agcSignExtend(limitWord)).
        set words[0] to 65535 - words[0].
        set words[0] to agcAddSP16(words[0], agcSignExtend(words[temkSlot])).
        set stored to agcStoreAccumulator(words[0], temkSlot).
        set words[temkSlot] to stored[1].
        set words[0] to stored[0].
        set exactQuadrant to stored[2] = 1.
    }
    if exactQuadrant {
        // ARG90. INDEX A / CS LIMITS.
        local limitWord is choose 16384 if words[0] = 1 else 16383.
        set words[0] to 65535 - agcSignExtend(limitWord).
    } else {
        agcPolley(words, temkSlot).
    }
    // RESULT SCALED AT 1
    set words[5] to mod(words[2], 4096).
    set words[2] to 3.
}

function agcPolley {
    parameter words, temkSlot.
    local sqSlot is temkSlot + 1.
    agcSpTrigMp(words, words[temkSlot]).
    local stored is agcStoreAccumulator(words[0], sqSlot).
    set words[sqSlot] to stored[1].
    set words[0] to stored[0].
    agcSpTrigMp(words, 596). // C5/2
    set words[0] to agcAddSP16(words[0], agcSignExtend(27498)). // C3/2
    agcSpTrigMp(words, words[sqSlot]).
    set words[0] to agcAddSP16(words[0], 12867). // C1/2
    agcSpTrigMp(words, words[temkSlot]).

    // DDOUBL
    local lowDouble is agcAddSP16(words[1], words[1]).
    local highDouble is agcAddSP16(words[0], words[0]).
    local lowOverflow is agcOverflowDirection(lowDouble).
    if lowOverflow = 1 {
        set highDouble to agcAddSP16(highDouble, 1).
    } else if lowOverflow = -1 {
        set highDouble to agcAddSP16(highDouble, 65534).
    }
    set words[1] to agcSignExtend(agcOverflowCorrected(lowDouble)).
    set stored to agcStoreAccumulator(highDouble, temkSlot).
    set words[temkSlot] to stored[1].
    // A final TS overflow skips the first TC Q and takes ARG90.
    set words[0] to stored[0].
    if stored[2] = 1 {
        local limitWord is choose 16384 if words[0] = 1 else 16383.
        set words[0] to 65535 - agcSignExtend(limitWord).
    }
}

// PORT: MP with a memory operand as used by POLLEY.
function agcSpTrigMp {
    parameter words, operand.
    local leftWord is agcOverflowCorrected(words[0]).
    local leftNegative is leftWord >= 16384.
    local rightNegative is operand >= 16384.
    local leftMagnitude is choose 32767 - leftWord if leftNegative else leftWord.
    local rightMagnitude is choose 32767 - operand if rightNegative else operand.
    local product is leftMagnitude * rightMagnitude.
    local highWord is floor(product / 16384).
    local lowWord is mod(product, 16384).
    if rightMagnitude <> 0 and leftNegative <> rightNegative {
        set highWord to 65535 - highWord.
        set lowWord to 65535 - lowWord.
    }
    set words[0] to highWord.
    set words[1] to lowWord.
}

// SPROOT WAS DELETED IN REV 51 OF MASTER. ASS. CONT. HAS CARDS.

// PORT: Comanche055 original header.
// Copyright:	Public domain.
// Filename:	SINGLE_PRECISION_SUBROUTINES.agc
// Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
//		It is part of the source code for the Command Module's (CM)
//		Apollo Guidance Computer (AGC), for Apollo 11.
// Assembler:	yaYUL
// Contact:	Ron Burkey <info@sandroid.org>.
// Website:	www.ibiblio.org/apollo.
// Pages:	1207
// Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
//				same name, using Comanche055 page images.
//
// This source code has been transcribed or otherwise adapted from digitized
// images of a hardcopy from the MIT Museum.  The digitization was performed
// by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// thanks to both.  The images (with suitable reduction in storage size and
// consequent reduction in image quality as well) are available online at
// www.ibiblio.org/apollo.  If for some reason you find that the images are
// illegible, contact me at info@sandroid.org about getting access to the
// (much) higher-quality images which Paul actually created.
//
// Notations on the hardcopy document read, in part:
//
//	Assemble revision 055 of AGC program Comanche by NASA
//	2021113-051.  10:28 APR. 1, 1969
//
//	This AGC program shall also be referred to as
//			Colossus 2A
// Page 1207
// SINGLE PRECISION SINE AND COSINE
// PORT: Luminary099 original header.
// Copyright:	Public domain.
// Filename:	SINGLE_PRECISION_SUBROUTINES.agc
// Purpose: 	Part of the source code for Luminary 1A build 099.
//		It is part of the source code for the Lunar Module's (LM)
//		Apollo Guidance Computer (AGC), for Apollo 11.
// Assembler:	yaYUL
// Contact:	Ron Burkey <info@sandroid.org>.
// Website:	www.ibiblio.org/apollo.
// Pages:	1102
// Mod history:	2009-05-25 RSB	Adapted from the corresponding
//				Luminary131 file, using page
//				images from Luminary 1A.
//		2010-12-31 JL	Fixed page number comment.
//
// This source code has been transcribed or otherwise adapted from
// digitized images of a hardcopy from the MIT Museum.  The digitization
// was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// the Museum.  Many thanks to both.  The images (with suitable reduction
// in storage size and consequent reduction in image quality as well) are
// available online at www.ibiblio.org/apollo.  If for some reason you
// find that the images are illegible, contact me at info@sandroid.org
// about getting access to the (much) higher-quality images which Paul
// actually created.
//
// Notations on the hardcopy document read, in part:
//
//	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
//	16:27 JULY 14, 1969
// Page 1102
// SINGLE PRECISION SINE AND COSINE

// SINGLE PRECISION SINE AND COSINE

function agcSpcosTimed {
    parameter words, temkSlot, held is list(), origin is 0.
    set words[0] to agcAddSP16(words[0], 8192). // ARGUMENTS SCALED AT PI
    return 2 + agcSpsinTimed(words, temkSlot, held, origin + 2).
}

function agcSpsinTimed {
    parameter words, temkSlot, held is list(), origin is 0.
    local cycles is 8.
    local stored is agcStoreAccumulator(words[0], temkSlot).
    set words[temkSlot] to stored[1].
    set words[0] to stored[0].
    if stored[2] = 1 {
        set cycles to cycles + 1.
        set words[0] to 65535 - agcSignExtend(words[temkSlot]).
    }

    if words:haskey("priorityMatrixStart") {
        priorityWait(words, words["priorityMatrixStart"] + origin + (choose 4 if stored[2] = 1 else 3),
            held, words["priorityMatrixStart"]).
    }

    // SPT
    set words[0] to agcAddSP16(words[0], words[0]).
    set stored to agcStoreAccumulator(words[0], temkSlot).
    set words[temkSlot] to stored[1].
    set words[0] to stored[0].
    local exactQuadrant is false.
    if stored[2] = 1 {
        set cycles to cycles + 12.
        set words[0] to agcSignExtend(words[temkSlot]).
        set words[temkSlot] to agcOverflowCorrected(stored[0]).
        // INDEX TEMK / AD LIMITS. The TS overflow result is +1 or -1.
        local limitWord is choose 16384 if stored[0] = 1 else 16383.
        set words[0] to agcAddSP16(words[0], agcSignExtend(limitWord)).
        set words[0] to 65535 - words[0].
        set words[0] to agcAddSP16(words[0], agcSignExtend(words[temkSlot])).
        set stored to agcStoreAccumulator(words[0], temkSlot).
        set words[temkSlot] to stored[1].
        set words[0] to stored[0].
        set exactQuadrant to stored[2] = 1.
    }
    if exactQuadrant {
        set cycles to cycles + 6.
        // ARG90. INDEX A / CS LIMITS.
        local limitWord is choose 16384 if words[0] = 1 else 16383.
        set words[0] to 65535 - agcSignExtend(limitWord).
    } else {
        // Pending cycles of the four MPs and DDOUBL, relative to POLLEY.
        for offset in list(3, 9, 15, 21, 24) {
            held:add(origin + cycles + offset).
        }
        if words:haskey("priorityMatrixStart") {
            priorityWait(words, words["priorityMatrixStart"] + origin + cycles, held, words["priorityMatrixStart"]).
        }
        set cycles to cycles + agcPolleyTimed(words, temkSlot).
    }
    if words:haskey("priorityMatrixStart") {
        priorityWait(words, words["priorityMatrixStart"] + origin + cycles, held, words["priorityMatrixStart"]).
    }
    // RESULT SCALED AT 1
    set words[5] to mod(words[2], 4096).
    set words[2] to 3.
    return cycles.
}

function agcPolleyTimed {
    parameter words, temkSlot.
    local sqSlot is temkSlot + 1.
    agcSpTrigMp(words, words[temkSlot]).
    local stored is agcStoreAccumulator(words[0], sqSlot).
    set words[sqSlot] to stored[1].
    set words[0] to stored[0].
    agcSpTrigMp(words, 596). // C5/2
    set words[0] to agcAddSP16(words[0], agcSignExtend(27498)). // C3/2
    agcSpTrigMp(words, words[sqSlot]).
    set words[0] to agcAddSP16(words[0], 12867). // C1/2
    agcSpTrigMp(words, words[temkSlot]).

    // DDOUBL
    local lowDouble is agcAddSP16(words[1], words[1]).
    local highDouble is agcAddSP16(words[0], words[0]).
    local lowOverflow is agcOverflowDirection(lowDouble).
    if lowOverflow = 1 {
        set highDouble to agcAddSP16(highDouble, 1).
    } else if lowOverflow = -1 {
        set highDouble to agcAddSP16(highDouble, 65534).
    }
    set words[1] to agcSignExtend(agcOverflowCorrected(lowDouble)).
    set stored to agcStoreAccumulator(highDouble, temkSlot).
    set words[temkSlot] to stored[1].
    // A final TS overflow skips the first TC Q and takes ARG90.
    set words[0] to stored[0].
    if stored[2] = 1 {
        local limitWord is choose 16384 if words[0] = 1 else 16383.
        set words[0] to 65535 - agcSignExtend(limitWord).
    }
    return choose 33 if stored[2] = 1 else 29.
}

// PORT: MP with a memory operand as used by POLLEY.


// SPROOT WAS DELETED IN REV 51 OF MASTER. ASS. CONT. HAS CARDS.
