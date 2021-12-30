#!/bin/bash
installedver=$(cat /opt/pdfsam/version)
releasever=$(curl --silent "https://api.github.com/repos/torakiki/pdfsam/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)

if [ $installedver != $releasever ]; then
    echo "Pdfsam: téléchargement de la version $releasever ..."
    wget -q https://github.com/torakiki/pdfsam/releases/download/v$releasever/pdfsam-$releasever-linux.tar.gz
    tar -xf pdfsam-$releasever-linux.tar.gz -C /opt/pdfsam/
    #cp -a pdfsam-$releasever-linux/. /opt/pdfsam/ &> /dev/null
    rm pdfsam-$releasever-linux.tar.gz
    rm -rf pdfsam-$releasever-linux
    echo "java -jar /opt/pdfsam/pdfsam-basic-$releasever.jar" > /opt/pdfsam/start_pdfsam.sh
    echo "$releasever" > /opt/pdfsam/version
    echo "Pdfsam: mis à jour vers $releasever"
else
    echo "Pdfsam: déjà à jour ($installedver)"
fi
