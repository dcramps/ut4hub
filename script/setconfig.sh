#!/bin/bash

mkdir -p $CONFIGDIR

# Base Game.ini
echo [/Script/UnrealTournament.UTGameState] >> $GAMECFG
echo ServerMOTD= >> $GAMECFG
echo ServerName=Chicago UT+ UTPUGS >> $GAMECFG

# Base Server.ini

echo [/Script/UnrealTournament.UTGameEngine] >> $ENGINECFG
echo RconPassword= >> $ENGINECFG

sed -i "s/RconPassword=.*/RconPassword=$SERVERRCON/g" $ENGINECFG
sed -i "s/ServerMOTD=.*/ServerMOTD=$SERVERMOTD/g" $GAMECFG
sed -i "s/ServerName=.*/ServerName=$SERVERNAME/g" $GAMECFG
