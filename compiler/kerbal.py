# Kerbal comments: crew, planets, people and jokes. Only the text after # changes, never the code.
import re

SEAT = {"Comanche055": "VAL", "Luminary099": "BOB"}

# lander lines that mean the one flying, not the one at the keyboard
JEB_LINES = {
    ("LANDING_ANALOG_DISPLAYS.agc", 152),
    ("THROTTLE_CONTROL_ROUTINES.agc", 64),
    ("P51-P53.agc", 73),
}

JOKES = [
    ("Luminary099", "BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc", 45, "BURN, BABY, BURN", "BURN, JEB, BURN"),
    ("Luminary099", "ASSEMBLY_AND_OPERATION_INFORMATION.agc", 94, "BURN, BABY, BURN", "BURN, JEB, BURN"),
    ("Luminary099", "BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc", 66, "HONI SOIT QUI MAL Y PENSE", "AD ASTRA PER MOAR BOOSTERS"),
    ("Luminary099", "BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc", 72, "NOLI SE TANGERE", "NOLI KRAKEN EXCITARE"),
    ("Luminary099", "BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc", 904, "HELLO THERE.", "HELLO THERE, JEB."),
    ("Luminary099", "BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc", 925, "GOODBYE.  COME AGAIN SOON.",
     "GOODBYE.  COME AGAIN SOON.  BRING SNACKS."),
    ("Luminary099", "THE_LUNAR_LANDING.agc", 64, "DIONYSIAN FLAG WAVING", "FLAG PLANTING FRENZY"),
    ("Luminary099", "THE_LUNAR_LANDING.agc", 245, "ASTRONAUT:", "BOB:"),
    ("Luminary099", "THE_LUNAR_LANDING.agc", 249, "SEE IF HE'S LYING", "SEE IF BOB'S LYING"),
    ("Luminary099", "THE_LUNAR_LANDING.agc", 254, "OFF TO SEE THE WIZARD...", "OFF TO SEE WERNHER VON KERMAN..."),
    ("Luminary099", "THE_LUNAR_LANDING.agc", 317, "ASTRONAUT:", "JEB:"),
    ("Luminary099", "LUNAR_LANDING_GUIDANCE_EQUATIONS.agc", 125, "GUILDENSTERN:", "GUILDENSTERN KERMAN:"),
    ("Luminary099", "LUNAR_LANDING_GUIDANCE_EQUATIONS.agc", 130, "PHILOSOPHY OF GUILDENSTERN:",
     "PHILOSOPHY OF GUILDENSTERN KERMAN:"),
    ("Luminary099", "LUNAR_LANDING_GUIDANCE_EQUATIONS.agc", 179, "TEMPORARY, I HOPE HOPE HOPE",
     "TEMPORARY, I HOPE HOPE HOPE.  MOAR STRUTS."),
    ("Luminary099", "LUNAR_LANDING_GUIDANCE_EQUATIONS.agc", 180, "TEMPORARY, I HOPE HOPE HOPE",
     "TEMPORARY, I HOPE HOPE HOPE.  MOAR STRUTS."),
    ("Luminary099", "LUNAR_LANDING_GUIDANCE_EQUATIONS.agc", 666, "NUMERO MYSTERIOSO", "NUMERO MYSTERIOSO DE WERNHER"),
    ("Luminary099", "LUNAR_LANDING_GUIDANCE_EQUATIONS.agc", 1375, "TRASHY LITTLE SUBROUTINES",
     "JEBEDIAH KERMAN'S JUNKYARD SUBROUTINES"),
    ("Luminary099", "LANDING_ANALOG_DISPLAYS.agc", 149, "WISHETH THE ASTRONAUT THE ANALOG", "WISHETH JEB THE ANALOG"),
    ("Luminary099", "FRESH_START_AND_RESTART.agc", 353, "CONSULTING POOH PEOPLE.", "CONSULTING POOH KERBALS."),
    ("Luminary099", "PINBALL_GAME_BUTTONS_AND_LIGHTS.agc", 221, "CHRISTIAN EAR", "KERBAL EAR"),
    ("Comanche055", "ALARM_AND_ABORT.agc", 181, "DO BAILOUT.", "DO BAILOUT.  NO F9 UP HERE."),
    ("Comanche055", "POWERED_FLIGHT_SUBROUTINES.agc", 64, "SORRY.", "SORRY, BILL."),
    ("Comanche055", "INTERPRETER.agc", 2174, "NO HOPE", "NO HOPE, NOT EVEN WITH MOAR BOOSTERS"),
    ("Comanche055", "FRESH_START_AND_RESTART.agc", 119, "CONSULTING POOH PEOPLE   ***", "CONSULTING POOH KERBALS  ***"),
    ("Comanche055", "FRESH_START_AND_RESTART.agc", 474, "CONSULTING POOH PEOPLE", "CONSULTING POOH KERBALS"),
    ("Comanche055", "PINBALL_GAME_BUTTONS_AND_LIGHTS.agc", 184, "CHRISTIAN EAR", "KERBAL EAR"),
]
# Val flies the command module, so "he" becomes "she" where it means her
SHE = [
    ("Comanche055", "ASSEMBLY_AND_OPERATION_INFORMATION.agc", 992, "HE DESIRES", "SHE DESIRES"),
    ("Comanche055", "DISPLAY_INTERFACE_ROUTINES.agc", 638, "IF HE TRIES", "IF SHE TRIES"),
    ("Comanche055", "P11.agc", 109, "DISPLAYS HE MUST", "DISPLAYS SHE MUST"),
    ("Comanche055", "P20-P25.agc", 521, "HE HITS AN", "SHE HITS AN"),
    ("Comanche055", "P51-P53.agc", 2055, "SIGHT HE MUST", "SIGHT SHE MUST"),
]
LINES = {(program, source, line): (old, new) for program, source, line, old, new in JOKES + SHE}

# everyone named in the comments becomes a Kerman
PEOPLE = {
    "MARGARET H. HAMILTON": "HAMILTON KERMAN", "M.H.HAMILTON": "HAMILTON KERMAN",
    "M. HAMILTON": "HAMILTON KERMAN", "M.HAMILTON": "HAMILTON KERMAN", "MARGARET'S": "HAMILTON KERMAN'S",
    "DANIEL J. LICKLY": "LICKLY KERMAN", "D.J.LICKLY": "LICKLY KERMAN", "D. LICKLY": "LICKLY KERMAN",
    "FRED H. MARTIN": "MARTIN KERMAN",
    "NORMAN E.SEARS": "SEARS KERMAN", "N.E. SEARS": "SEARS KERMAN",
    "RICHARD H. BATTIN": "BATTIN KERMAN", "R.H. BATTIN": "BATTIN KERMAN",
    "DAVID G. HOAG": "HOAG KERMAN", "D.G. HOAG": "HOAG KERMAN",
    "RALPH R. RAGAN": "RAGAN KERMAN", "R.R. RAGAN": "RAGAN KERMAN",
    "R. R. BAIRNSFATHER": "BAIRNSFATHER KERMAN", "RR BAIRNSFATHER": "BAIRNSFATHER KERMAN",
    "BAIRNSFATHER": "BAIRNSFATHER KERMAN",
    "NORTH / BAIRNSFATHER": "NORTH KERMAN / BAIRNSFATHER KERMAN",
    "NORTH/BAIRNSFATHER": "NORTH KERMAN/BAIRNSFATHER KERMAN",
    "MORTH / BAIRNSFATHER": "MORTH KERMAN / BAIRNSFATHER KERMAN",
    "PETER ADLER": "ADLER KERMAN", "ADLER": "ADLER KERMAN",
    "D. EYLES": "EYLES KERMAN", "EYLES": "EYLES KERMAN",
    "ALLAN KLUMPP": "KLUMPP KERMAN", "KLUMPP": "KLUMPP KERMAN",
    "BOB COVELLI": "COVELLI KERMAN", "COVELLI": "COVELLI KERMAN", "MIKE HOUSTON": "HOUSTON KERMAN",
    "SAYDEAN ZELDIN": "ZELDIN KERMAN", "S. ZELDIN": "ZELDIN KERMAN", "S.ZELDIN": "ZELDIN KERMAN",
    "ZELDIN": "ZELDIN KERMAN",
    "HUGH BLAIR-SMITH": "BLAIR-SMITH KERMAN", "H. BLAIR-SMITH": "BLAIR-SMITH KERMAN",
    "KERNAN": "KERNAN KERMAN",
    "P. S. WEISSMAN": "WEISSMAN KERMAN", "P S WEISSMAN": "WEISSMAN KERMAN", "R. D. GOSS": "GOSS KERMAN",
    "ENGEL": "ENGEL KERMAN",
    "MOD BY - MILLER": "MOD BY - MILLER KERMAN", "MOD BY -- MILLER": "MOD BY -- MILLER KERMAN",
    "J S MILLER": "MILLER KERMAN",
    "WHITE.P": "WHITE KERMAN", "WHITE, P.": "WHITE KERMAN",
    "N.M.NEVILLE": "NEVILLE KERMAN", "NEVILLE": "NEVILLE KERMAN",
    "KEN VINCENT": "VINCENT KERMAN", "VINCENT": "VINCENT KERMAN",
    "DANFORTH": "DANFORTH KERMAN", "KOSMALA": "KOSMALA KERMAN", "SCHULENBERG": "SCHULENBERG KERMAN",
    "ELIASSEN": "ELIASSEN KERMAN", "TOM KNATT": "KNATT KERMAN", "STURLAUGSON": "STURLAUGSON KERMAN",
    "LONSKE": "LONSKE KERMAN", "A.W.BANCROFT": "BANCROFT KERMAN", "WILLMAN": "WILLMAN KERMAN",
    "RUDNICKI.S": "RUDNICKI KERMAN", "RUDNICKI, S": "RUDNICKI KERMAN",
    "BARNERT": "BARNERT KERMAN", "SCHLUNDT": "SCHLUNDT KERMAN",
    "W.H. VANDEVER": "VANDEVER KERMAN", "W.H.VANDEVER": "VANDEVER KERMAN",
    "RHODE": "RHODE KERMAN", "KILROY, SMITH": "KILROY KERMAN, SMITH KERMAN", "KILROY": "KILROY KERMAN",
    "FOLLETT": "FOLLETT KERMAN", "DEWITT": "DEWITT KERMAN", "DWWITT": "DWWITT KERMAN",
    "DEWOLF": "DEWOLF KERMAN", "DE WOLF": "DE WOLF KERMAN", "FAGIN": "FAGIN KERMAN",
    "KRAUSE": "KRAUSE KERMAN", "ROBERTSON": "ROBERTSON KERMAN", "GAUNTT": "GAUNTT KERMAN",
    "JOHN SUTHERLAND": "SUTHERLAND KERMAN", "R. HIRSCHKOP": "HIRSCHKOP KERMAN",
    "R.MELANSON": "MELANSON KERMAN", "R. MELANSON": "MELANSON KERMAN", "MELANSON": "MELANSON KERMAN",
    "N.BRODEUR": "BRODEUR KERMAN", "N. BRODEUR": "BRODEUR KERMAN", "JENNINGS BRODEUR": "JENNINGS BRODEUR KERMAN",
    "RAMA M.AIYAWAR": "AIYAWAR KERMAN", "RAMA M AIYAWAR": "AIYAWAR KERMAN", "RAMA AIYAWAR": "AIYAWAR KERMAN",
    "P. VOLANTE": "VOLANTE KERMAN", "J.D. COYNE": "COYNE KERMAN",
    "RICHARD TALAYCO": "TALAYCO KERMAN", "TALAYCO": "TALAYCO KERMAN",
    "JONATHON D. ADDELSTON": "ADDELSTON KERMAN", "JONATHON D. ADDLESTON": "ADDLESTON KERMAN",
    "JOHNATHAN D. ADDLELSTON": "ADDLELSTON KERMAN",
    "EDGAR M. OSHIKA": "OSHIKA KERMAN", "LOWELL G. HULL": "HULL KERMAN", "EDWIN D. SMALLY": "SMALLY KERMAN",
    "ROBERT F. STENGEL": "STENGEL KERMAN", "T. JAMES": "JAMES KERMAN",
    "CRAIG WORK": "WORK KERMAN", "C. WORK": "WORK KERMAN", "DON KEENE": "KEENE KERMAN", "D. KEENE": "KEENE KERMAN",
    "GEORGE SCHMIDT": "SCHMIDT KERMAN", "SCHMIDT": "SCHMIDT KERMAN",
    "FILENE": "FILENE KERMAN", "ALONSO": "ALONSO KERMAN", "COPPS": "COPPS KERMAN", "CHARLEY": "CHARLEY KERMAN",
    "Ron Burkey": "Burkey Kerman", "Paul Fjeld": "Fjeld Kerman", "images which Paul": "images which Fjeld Kerman",
    "Deborah Douglas": "Douglas Kerman", "Sergio Navarro": "Navarro Kerman",
    "Onno Hommes": "Hommes Kerman", "Onno's": "Hommes Kerman's", "Hartmuth Gutsche": "Gutsche Kerman",
    "Jim Lawton": "Lawton Kerman", "Fabrizio Bernardini": "Bernardini Kerman",
    "Magnificent Montague": "Montague Kerman", "Don Eyles": "Eyles Kerman", "Peter Adler": "Adler Kerman",
    "Dave Scott": "Scott Kerman", "Jim McDivitt": "McDivitt Kerman",
    "Alan I. Green": "Green Kerman", "Robert J. Filene": "Filene Kerman",
    "Green and Filene": "Green Kerman and Filene Kerman",
    "Ram&oacute;n Alonso": "Alonso Kerman", "Ram&oacute;n says": "Alonso Kerman says",
}
PEOPLE_PATTERN = re.compile(
    "|".join(r"(?<![\w.])" + re.escape(name) + r"(?!\w)" for name in sorted(PEOPLE, key=len, reverse=True)))

PLACES = [
    (r"the earth", "Kerbin"), (r"the sun", "Kerbol"), (r"lunar module", "Munar Excursion Module"),
    (r"trans-lunar", "Trans-Munar"), (r"translunar", "Transmunar"), (r"cislunar", "Cismunar"),
    (r"transearth", "Transkerbin"),
    (r"lunar", "Mun"), (r"moonwalk", "Munwalk"), (r"moons", "Muns"), (r"moon", "Mun"),
    (r"earth", "Kerbin"), (r"sun", "Kerbol"), (r"solar", "Kerbol"), (r"saturn", "Acapello"),
]
PLACES = [(re.compile(r"\b" + word + r"\b", re.I), name) for word, name in PLACES]


def same_case(found, name):
    if found.isupper():
        return name.upper()
    if found.islower():
        return name.lower()
    return name


def crew(program, source, line, comment):
    if re.search(r"[a-z]{3}", comment):
        # Virtual AGC notes talk about astronauts in general
        return re.sub(r"\bastronaut", "kerbonaut", comment)
    seat = "JEB" if program == "Luminary099" and (source, line) in JEB_LINES else SEAT[program]
    comment = re.sub(r"\bASTRONAUTS\b", "KERBONAUTS", comment)
    return re.sub(r"\b(THE )?ASTRONAUT\b", seat, comment)


def localize_comment(program, source, line, comment):
    edit = LINES.get((program, source, line))
    if edit:
        old, new = edit
        assert old in comment, (program, source, line, comment)
        comment = comment.replace(old, new, 1)
    comment = PEOPLE_PATTERN.sub(lambda found: PEOPLE[found.group(0)], comment)
    comment = crew(program, source, line, comment)
    for pattern, name in PLACES:
        comment = pattern.sub(lambda found: same_case(found.group(0), name), comment)
    return comment


def localize(program, source, line, text):
    if "#" not in text:
        return text
    code, comment = text.split("#", 1)
    return code + "#" + localize_comment(program, source, line, comment)
