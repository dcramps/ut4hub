#!/bin/bash

cd $SERVERBIN

startHub() {
  ./UE4Server-Linux-Shipping UnrealTournament UT-Entry?game=lobby -log
}

# Acts as a watchdog - as soon as the server process dies, this will restart it.
#while :; do startHub; done
startHub;
