#!/bin/bash
cd /hub

echo "Making links"
./script/makelinks.sh

echo "Updating paks"
#./script/fetch.sh

echo "Updating rules"
./script/updaterules.sh

echo "Launching hub"
./script/runhub.sh

