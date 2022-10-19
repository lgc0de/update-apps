#!/bin/bash
installedver=$(cat /opt/solar-wallet/version)
releasever=$(curl --silent "https://api.github.com/repos/satoshipay/solar/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)

if [ $installedver != $releasever ]; then
    echo "Solar Wallet: téléchargement de la version $releasever ..."
    mkdir solar
    cd solar
    wget -q https://github.com/satoshipay/solar/releases/download/v$releasever/Solar-Wallet-v$releasever.AppImage
    if [ -e Solar-Wallet-$releasever-x86_64.AppImage ]; then
        mv Solar-Wallet-$releasever-x86_64.AppImage /opt/solar-wallet/Solar-Wallet-x86_64.AppImage
        chmod +x /opt/solar-wallet/Solar-Wallet-x86_64.AppImage
        echo "$releasever" > /opt/solar-wallet/version
        echo "Solar Wallet: mis à jour vers $releasever"
    else
        echo "Solar Wallet: échec de la mise à jour"
    fi
else
    echo "Solar Wallet: déjà à jour ($installedver)"
fi