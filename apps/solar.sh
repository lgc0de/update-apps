#!/bin/bash
installedver=$(cat /opt/solar-wallet/version)
releasever=$(curl --silent "https://api.github.com/repos/satoshipay/solar/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)

if [ $installedver != $releasever ]; then
    echo "Solar Wallet: téléchargement de la version $releasever ..."
    mkdir solar
    cd solar
    wget -q https://github.com/satoshipay/solar/releases/download/v$releasever/Solar-Wallet-$releasever.deb
    ar x Solar-Wallet-$releasever.deb
    tar -xvf data.tar.xz
    cp -a "opt/Solar Wallet/." /opt/solar-wallet/
    cd ..
    rm -rf solar
    echo "$releasever" > "/opt/solar-wallet/version"
    echo "Solar Wallet: mis à jour vers $releasever"
else
    echo "Solar Wallet: déjà à jour ($installedver)"
fi