#!/bin/bash
dir="$PWD"
github_repo="https://github.com/vinceliuice/Qogir-kde"
project_name="Qogir-kde"
working_dir="$dir/themes"

# Installation du thème d'icone au niveau user (/home)
# option -c: install les places suivant le coloscheme du thème
do_install() {
    ./install.sh -c
}

if [ ! -d $working_dir ]; then
    mkdir $working_dir
fi

# Téléchargement du thème d'icone depuis git si sources absentes
if [ ! -d $working_dir/$project_name ]; then
    cd $working_dir
    git clone $github_repo
    cd $project_name
    do_install
fi

# Vérification des mises à jour du thème d'icone depuis git
cd $working_dir/$project_name
vargit=$(git pull)
if [ "$vargit" != "Déjà à jour." ]; then
    do_install
    echo "$project_name: mis à jour vers git master"
else
    echo "$project_name: déjà à jour (git master)"
fi
