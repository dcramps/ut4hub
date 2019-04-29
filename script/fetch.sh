#!/bin/bash

FORCE="false"

while getopts "f" OPTION; do
  case $OPTION in
    f)
      FORCE="true"
      ;;
  esac
done 


## Fetch Paks into Paks folder
cd ../paks

echo -en "\rFetching file list"
response=($(wget -SN "https://ut4pugs.us/media/redirect.txt" 2>&1 | grep "HTTP/" | awk '{print $2}'))
if [ $FORCE = "false" ] && [ $response -eq 304 ]; then
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
cd ../config

sed -i "/UnrealTournament.UTBaseGameMode/d" Game.ini
sed -i "/RedirectReferences/d" Game.ini

echo '[/Script/UnrealTournament.UTBaseGameMode]' > Game.ini.tmp
cat ../paks/redirect.txt >> Game.ini.tmp
cat Game.ini >> Game.ini.tmp
cat Game.ini.tmp > Game.ini
rm Game.ini.tmp
mv Game.ini ../server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer
ln -s ../server/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Game.ini Game.ini

## Done!

echo -en "\rDone!                           "
echo ""
