#!/bin/bash
cd $HUBROOT
echo "Init..."
if [ ! -d "/hub/server" ]; then
  echo "Extracting server package"
  tar -xzf server.tar.gz
fi

echo "Done"
