#!/bin/bash

FORCE=0

while getopts "f" OPTION; do
  case $OPTION in
    f)
      FORCE=1
      ;;
  esac
done 


## Fetch Paks into Paks folder
cd /hub/paks

echo -en "\rFetching file list"
response=($(wget -SN "https://ut4pugs.us/media/redirect.txt" 2>&1 | grep "HTTP/" | awk '{print $2}'))
if [ $FORCE = 1 ] && [ $response -eq 304 ]; then
  echo ""
  echo "No new paks"
  exit 0
fi

files=($(awk -F ',' '{print $2,$3}' redirect.txt | awk -F ' ' '{print $1, $2}' | awk -F '=' '{print $2, $3}' | awk -F ' ' '{print $1,$3}' | sed 's/"//g' | sed 's/ /:\/\//g'))

for var in "${files[@]}"
do
  wget -bNqc ${var} &> /dev/null
done

count=($(ps aux | grep wget | wc -l))

while [ $count -gt 1 ]
do
  ((left = count - 1))
  echo -en "\rDownloading. $left files left."
  count=($(ps aux | grep wget | wc -l))
  sleep 0.250
done

## Update Game.ini in Config folder
cd /hub/config

sed -i "/UnrealTournament.UTBaseGameMode/d" Game.ini
sed -i "/RedirectReferences/d" Game.ini

echo '[/Script/UnrealTournament.UTBaseGameMode]' > Game.ini.tmp
cat /hub/paks/redirect.txt >> Game.ini.tmp
cat Game.ini >> Game.ini.tmp
cat Game.ini.tmp > Game.ini
rm Game.ini.tmp
mv Game.ini /hub/server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer
ln -s /hub/server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Game.ini Game.ini

## Done!

echo -en "\rDone!                           "
echo ""
