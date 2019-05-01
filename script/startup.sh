#!/bin/bash
cd $HUBROOT

echo "Updating paks"
./script/fetch.sh

echo "Updating rules"
./script/updaterules.sh

echo "Setting config"
./script/setconfig.sh

echo "Launching hub"
./script/runhub.sh

