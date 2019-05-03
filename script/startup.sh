#!/bin/bash
cd $HUBROOT

echo "Setting config"
./script/setconfig.sh

echo "Launching hub"
./script/runhub.sh

