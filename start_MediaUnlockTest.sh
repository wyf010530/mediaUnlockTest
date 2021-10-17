#!/bin/bash
echo "Node ID,Country Code,Steam Currency,Netflix,MyTVSuper,YouTube Region,HBO Now,BBC,Now E,Viu TV,Abema.TV,Disney Plus,Paravi,U Next,Dazn,Hulu Japan,Kancolle Japan,Pretty Derby Japan,Princess Connect Re:Dive Japan,BiliBili China Mainland Only,BiliBili Hongkong/Macau/Taiwan,Bilibili Taiwan Only" > output.csv

if [ ! -f "./ip.txt" ]; then
  echo "Please generate "ip.txt" file..."
  exit
fi

for i in $(cat ip.txt)
do
    ssh -p 16028 -D 1080 -C -q root@${i} "bash <(curl -sSL "https://raw.githubusercontent.com/wyf010530/mediaUnlockTest/main/mediaUnlockTest.sh")" | tr "\n" ","|sed -e 's/,$/\n/' >> output.csv
done
