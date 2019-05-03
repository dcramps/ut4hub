#!/bin/bash
cd $HUBROOT
echo "Init..."
if [ ! -d "$HUBROOT/server" ]; then
  echo "Extracting server package"
  mkdir $HUBROOT/server
  unzip $HUBPACKAGE -d server/
fi

chmod +x $HUBROOT/server/LinuxServer/Engine/Binaries/Linux/UE4Server-Linux-Shipping

echo "Done"
