#!/bin/bash

cd ../server/LinuxServer/Engine/Binaries/Linux

startHub() {
  ./UE4Server-Linux-Shipping UnrealTournament UT-Entry?game=lobby -log
}

# Acts as a watchdog - as soon as the server process dies, this will restart it.
while :; do startHub; done
