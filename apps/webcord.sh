#!/bin/bash
installedver=$(cat /opt/webcord/version)
releasever=$(curl --silent "https://api.github.com/repos/SpacingBat3/WebCord/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)

if [ "$installedver" != "$releasever" ]; then
    echo "WebCord: téléchargement de la version $releasever ..."
    wget -q https://github.com/SpacingBat3/WebCord/releases/download/v$releasever/WebCord-$releasever-x64.AppImage
    mv WebCord-$releasever-x64.AppImage /opt/webcord/WebCord.AppImage
    chmod +x /opt/webcord/WebCord.AppImage
    echo "$releasever" > /opt/webcord/version
    echo "WebCord: mis à jour vers $releasever"
else
    echo "WebCord: déjà à jour ($installedver)"
fi