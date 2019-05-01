#!/bin/bash

sed -i "s/RconPassword=.*/RconPassword=$SERVERRCON/g" $ENGINECFG
sed -i "s/ServerMOTD=.*/ServerMOTD=$SERVERMOTD/g" $GAMECFG
sed -i "s/ServerName=.*/ServerName=$SERVERNAME/g" $GAMECFG
