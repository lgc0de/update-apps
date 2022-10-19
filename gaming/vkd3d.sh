#!/bin/bash
dxvkver=$(curl --silent "https://api.github.com/repos/lutris/dxvk/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)
vkd3dver=$(curl --silent "https://api.github.com/repos/lutris/vkd3d/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | cut -d'v' -f2)

cd /home/$USER/workspace/vkd3d-proton/
git submodule update --recursive --remote
vargit=$(git pull)
if [ "$vargit" != "Déjà à jour." ]; then
    sudo rm -rf /home/$USER/workspace/vkd3d-proton/lutris/vkd3d-proton-master
    sudo ./package-release.sh master lutris --no-package
    cp lutris/vkd3d-proton-master/x86/d3d12.dll /home/$USER/.local/share/lutris/runtime/dxvk/v$dxvkver/x32/
    cp lutris/vkd3d-proton-master/x64/d3d12.dll /home/$USER/.local/share/lutris/runtime/dxvk/v$dxvkver/x64/

    cp lutris/vkd3d-proton-master/x86/d3d12.dll /home/$USER/.local/share/lutris/runtime/vkd3d/v$vkd3dver/x86/
    cp lutris/vkd3d-proton-master/x64/d3d12.dll /home/$USER/.local/share/lutris/runtime/vkd3d/v$vkd3dver/x64/
    echo "Vkd3d: mis à jour vers git master"
else
    echo "Vkd3d: déjà à jour (git master)"
fi