// adapted from jweigend/Apollo11 agc/dsky.py (GPL-2.0)
function wInitDsky {
    parameter dev,rows.
    set dev["rows"] to rows.
    set dev["digits"] to lexicon(0," ",21,"0",3,"1",25,"2",27,"3",15,"4",
        30,"5",28,"6",19,"7",29,"8",31,"9").
    set dev["keyCodes"] to lexicon("0",16,"1",1,"2",2,"3",3,"4",4,"5",5,"6",6,
        "7",7,"8",8,"9",9,"VERB",17,"RSET",18,"KEY REL",25,"+",26,"-",27,
        "ENTR",28,"CLR",30,"NOUN",31).
    set dev["aliases"] to lexicon("V","VERB","N","NOUN","E","ENTR","ENTER","ENTR",
        "R","RSET","RESET","RSET","C","CLR","CLEAR","CLR","K","KEY REL","KEYREL","KEY REL",
        "P","PRO","PROCEED","PRO").
    set dev["proDown"] to false. set dev["keys"] to list().
}
function wPress {
    parameter dev,keyName.
    local key is keyName:trim:toupper.
    if dev["aliases"]:haskey(key) { set key to dev["aliases"][key]. }
    if key = "PRO" {
        set dev["ch"][26] to wSetBit(dev["ch"][26],8192,false).
        set dev["proDown"] to true.
        dev["keys"]:add(list("pro",true)).
    } else if dev["keyCodes"]:haskey(key) {
        local code is dev["keyCodes"][key].
        set dev["ch"][13] to code.
        dev["keys"]:add(list("key",code)).
    } else { return false. }
    return true.
}
function wRelease {
    parameter dev.
    if dev["proDown"] {
        set dev["ch"][26] to wSetBit(dev["ch"][26],8192,true).
        set dev["proDown"] to false.
        dev["keys"]:add(list("pro",false)).
    }
}
function wSign {
    parameter rows,p,m.
    local plusOn is wBit(rows[p],1024). local minusOn is wBit(rows[m],1024).
    if plusOn = minusOn { return " ". }
    return choose "+" if plusOn else "-".
}
function wDisplay {
    parameter dev,cycle,standbyLamp,restartLamp,flash is true.
    local rows is dev["rows"]. local ch is dev["ch"].
    local pairs is list(""). local digits is dev["digits"].
    from {local i is 1.} until i > 11 step {set i to i+1.} do {
        local pairText is "".
        for code in list(mod(floor(rows[i]/32),32),mod(rows[i],32)) {
            if digits:haskey(code) {set pairText to pairText + digits[code].}
            else {set pairText to pairText + "?".}
        }
        pairs:add(pairText).
    }
    local flashing is wBit(ch[9],32).
    local blank is flash and flashing and mod(cycle,109226)/109226 > 0.75.
    local testLamp is wBit(ch[11],512). local row12 is rows[12].
    local lamps is lexicon("UPLINK ACTY",wBit(ch[9],4),"NO ATT",wBit(row12,8),
        "STBY",standbyLamp or testLamp,"KEY REL",wBit(ch[9],16) and not blank,
        "OPR ERR",wBit(ch[9],64) and not blank,"TEMP",wBit(ch[9],8) or wBit(ch[24],16384),
        "GIMBAL LOCK",wBit(row12,32),"PROG",wBit(row12,256),"RESTART",restartLamp or testLamp,
        "TRACKER",wBit(row12,128),"ALT",wBit(row12,16),"VEL",wBit(row12,4),
        "COMP ACTY",wBit(ch[9],2),"NO DAP",wBit(row12,2),"PRIO DISP",wBit(row12,1)).
    return lexicon("prog",pairs[11],"verb",(choose "  " if blank else pairs[10]),
        "noun",(choose "  " if blank else pairs[9]),"flashing",flashing,"lamps",lamps,
        "r1",wSign(rows,7,6)+pairs[8]:substring(1,1)+pairs[7]+pairs[6],
        "r2",wSign(rows,5,4)+pairs[5]+pairs[4]+pairs[3]:substring(0,1),
        "r3",wSign(rows,2,1)+pairs[3]:substring(1,1)+pairs[2]+pairs[1]).
}
function wTypeSequence {
    parameter dev,textKeys.
    from {local i is 0.} until i >= textKeys:length step {set i to i+1.} do {
        local key is textKeys:substring(i,1).
        if key <> " " and not wPress(dev,key) { return false. }
    }
    return true.
}
function wLamp {
    parameter panel,label.
    local extra is 11-label:length.
    local leftCount is floor(extra/2).
    // python's str.center puts the odd pad on the left here
    if mod(extra,2) = 1 and mod(11,2) = 1 { set leftCount to leftCount+1. }
    local title is "           ":substring(0,leftCount)+label+"           ":substring(0,extra-leftCount).
    return choose "["+title+"]" if panel["lamps"][label] else " "+title+" ".
}
function wRender {
    parameter panel.
    local comp is choose "[##]" if panel["lamps"]["COMP ACTY"] else "    ".
    return list(wLamp(panel,"UPLINK ACTY")+" "+wLamp(panel,"TEMP")+"      COMP     PROG",
        wLamp(panel,"NO ATT")+" "+wLamp(panel,"GIMBAL LOCK")+"     ACTY     "+panel["prog"],
        wLamp(panel,"STBY")+" "+wLamp(panel,"PROG")+"      "+comp,
        wLamp(panel,"KEY REL")+" "+wLamp(panel,"RESTART")+"     VERB     NOUN",
        wLamp(panel,"OPR ERR")+" "+wLamp(panel,"TRACKER")+"      "+panel["verb"]+"       "+panel["noun"],
        wLamp(panel,"NO DAP")+" "+wLamp(panel,"ALT")+"     R1  "+panel["r1"],
        wLamp(panel,"PRIO DISP")+" "+wLamp(panel,"VEL")+"     R2  "+panel["r2"],
        "                           "+"     R3  "+panel["r3"]).
}
