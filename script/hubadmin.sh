#!/bin/bash
cd /hub
echo "Init..."
if [ ! -d "/hub/server" ]; then
  echo "Extracting server package"
  tar -xzf /hub/server.tar.gz
fi

echo "Updating paks"
#./script/fetch.sh

echo "Updating rules"
./script/updaterules.sh

echo "Done"
exit 0
