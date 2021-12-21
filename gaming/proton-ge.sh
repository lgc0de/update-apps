#!/bin/bash
installedver=$(cat /home/$USER/.local/share/Steam/compatibilitytools.d/version)
releasever=$(curl --silent "https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)

if [ $installedver != $releasever ]; then
    echo "Proton GE: téléchargement de la version $releasever ..."
    wget -q https://github.com/GloriousEggroll/proton-ge-custom/releases/download/$releasever/proton-$releasever.tar.gz
    tar -xf proton-$releasever.tar.gz
    cp -r Proton-$releasever /home/$USER/.local/share/Steam/compatibilitytools.d/
    rm proton-$releasever.tar.gz
    rm -rf Proton-$releasever
    echo "$releasever" > /home/$USER/.local/share/Steam/compatibilitytools.d/version
    echo "Proton GE: mis à jour vers $releasever"
else
    echo "Proton GE: déjà à jour ($installedver)"
fi