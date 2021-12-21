#!/bin/bash
echo "Recherche des mises à jour ..."

###################
# Apps
###################
./apps/heroic.sh
./apps/pdfsam.sh
./apps/kdenlive.sh
./apps/solar.sh
# ./gaming/proton-ge.sh
./gaming/wine-ge.sh
./gaming/vkd3d.sh

###################
# Thèmes
###################
./theme/theme-qogir.sh