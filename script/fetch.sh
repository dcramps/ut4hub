#!/bin/bash

FORCE=0

while getopts "f" OPTION; do
  case $OPTION in
    f)
      FORCE=1
      ;;
  esac
done 

## Check if there are seeded paks
cd $PAKSEEDDIR

echo "Checking for seeded Paks"
seeded=($(ls $PAKSEEDDIR | wc -l))
if [ $seeded -gt 0 ]; then
  echo "Found $seeded Paks"
  cp $PAKSEEDDIR/* $PAKSDIR
fi
echo "Done"
echo ""

## Fetch Paks into Paks folder
cd $PAKSDIR

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
echo ""
echo "Writing redirect config"
sed -i "/UnrealTournament.UTBaseGameMode/d" $GAMECFG
sed -i "/RedirectReferences/d" $GAMECFG

echo '[/Script/UnrealTournament.UTBaseGameMode]' > Game.ini.tmp
cat $PAKSDIR/redirect.txt >> Game.ini.tmp
cat $GAMECFG >> Game.ini.tmp
cat Game.ini.tmp > $GAMECFG
rm Game.ini.tmp

## Done!

echo ""
