#!/bin/bash
installedver=$(cat /opt/heroic/version)
releasever=$(curl --silent "https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)

if [ $installedver != $releasever ]; then
    echo "Heroic Games Launcher: téléchargement de la version $releasever ..."
    wget -q https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v$releasever/heroic-$releasever.tar.xz
    tar -xf heroic-$releasever.tar.xz
    cp -a heroic-$releasever/. /opt/heroic/
    rm heroic-$releasever.tar.xz
    rm -rf heroic-$releasever
    echo "$releasever" > /opt/heroic/version
    echo "Heroic Games Launcher: mis à jour vers $releasever"
else
    echo "Heroic Games Launcher: déjà à jour ($installedver)"
fi
