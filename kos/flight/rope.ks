function segmentRope { parameter words.
    local address is 2048.
    for cell in open("0:/apollo-landing/rope.txt"):readall:string:split(",") {
        set words[address] to cell:tonumber. set address to address+1.
    }
    until address >= 43008 { set words[address] to 0. set address to address+1. }
}
