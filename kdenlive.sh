#!/bin/bash
installedver=$(cat /opt/kdenlive/version)
releasever=$(curl --silent "https://api.github.com/repos/KDE/kdenlive/tags" | grep -Po '"name": "\K.*?(?=")' | head -1 | cut -d'v' -f2)

if [ $installedver != $releasever ]; then
    echo "Kdenlive: téléchargement de la version $releasever ..."
    releasebranch=$( echo $releasever | cut -c1-5)
    wget -q https://download.kde.org/stable/kdenlive/$releasebranch/linux/kdenlive-$releasever-x86_64.appimage
    if [ -e kdenlive-$releasever-x86_64.appimage ]; then
        mv kdenlive-$releasever-x86_64.appimage /opt/kdenlive/kdenlive-x86_64.appimage
        chmod +x /opt/kdenlive/kdenlive-x86_64.appimage
        echo "$releasever" > /opt/kdenlive/version
        echo "Kdenlive: mis à jour vers $releasever"
    else
        echo "Kdenlive: échec de la mise à jour"
    fi
else
    echo "Kdenlive: déjà à jour ($installedver)"
fi