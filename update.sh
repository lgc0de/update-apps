#!/bin/bash

cd /home/ludo/workspace/update-apps

echo "Recherche des mises à jour ..."
./heroic.sh
./pdfsam.sh
./kdenlive.sh
./solar.sh
# ./proton-ge.sh
./wine-ge.sh
./vkd3d.sh