#!/bin/bash
cd $HUBROOT
echo "Init..."
if [ ! -d "$HUBROOT/server" ]; then
  echo "Extracting server package"
  mkdir $HUBROOT/server
  unzip $HUBPACKAGE -d server/
fi

echo "Setting up config directory"

if [ -d "$RULESDIR" ]; then
    echo "Removing existing rules directory at $RULESDIR"
    rmdir $RULESDIR
fi

echo "Linking config directory"
mkdir -p $HUBROOT/server/LinuxServer/UnrealTournament/Saved/Config/
ln -s /rules $HUBROOT/server/LinuxServer/UnrealTournament/Saved/Config/Rulesets

chmod +x $HUBROOT/server/LinuxServer/Engine/Binaries/Linux/UE4Server-Linux-Shipping

echo "Done"
