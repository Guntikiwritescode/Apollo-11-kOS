// Load with RUNONCEPATH from an archive with these scripts in wiring/.
for wModule in list("scaling","sensors","actuators","dsky","crew","padload","frame") {
    runoncepath("0:/wiring/"+wModule+".ks").
}
