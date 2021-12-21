#!/bin/bash
dir="$PWD"

# Installation du thème GTK au niveau system (/usr)
install_theme() {
    sudo ./install.sh -c dark -t default
}

# Installation du thème d'icone au niveau user (/home)
install_icon() {
    ./install.sh
}

if [ ! -d $dir/Qogir ]; then
    mkdir Qogir
fi

# Téléchargement du thème gtk depuis git si sources absentes
if [ ! -d $dir/themes/Qogir/Qogir-theme ]; then
    cd $dir/themes/Qogir
    git clone https://github.com/vinceliuice/Qogir-theme.git
    cd Qogir-theme
    install_theme
fi

# Vérification des mises à jour du thème gtk depuis git
cd $dir/themes/Qogir/Qogir-theme/
vargit=$(git pull)
# gnome + gdm variant
# sudo ./install.sh -g -c dark -t default -l manjaro -w square
if [ "$vargit" != "Déjà à jour." ]; then
    install_theme
    echo "Qogir theme: mis à jour vers git master"
else
    echo "Qogir theme: déjà à jour (git master)"
fi

# Téléchargement du thème d'icone depuis git si sources absentes
if [ ! -d $dir/themes/Qogir/Qogir-icon-theme ]; then
    cd $dir/themes/Qogir
    git clone https://github.com/vinceliuice/Qogir-icon-theme.git
    cd Qogir-icon-theme
    install_icon
fi

# Vérification des mises à jour du thème d'icone depuis git
cd $dir/themes/Qogir/Qogir-icon-theme
vargit=$(git pull)
if [ "$vargit" != "Déjà à jour." ]; then
    install_icon
    echo "Qogir icon theme: mis à jour vers git master"
else
    echo "Qogir icon theme: déjà à jour (git master)"
fi