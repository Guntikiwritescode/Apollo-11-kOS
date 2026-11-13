// runoncepath this with the wiring scripts in 0:/wiring
for wModule in list("scaling","sensors","actuators","dsky","crew","padload","frame") {
    runoncepath("0:/wiring/"+wModule+".ks").
}
