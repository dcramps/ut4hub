#!/bin/bash
cd /hub
mkdir config

ln -s server/LinuxServer/UnrealTournament/Content/Paks/ paks

cd config
ln -s /hub/server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Engine.ini Engine.ini
ln -s /hub/server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Game.ini Game.ini
ln -s /hub/server/LinuxServer/UnrealTournament/Saved/Config/Rulesets/DefaultRules_disable.json Rules.json
