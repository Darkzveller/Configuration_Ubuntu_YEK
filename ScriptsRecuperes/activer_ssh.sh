#!/bin/bash

sudo apt update
sudo apt install -y openssh-server

# Vérifie si le service SSH est actif
if systemctl is-active --quiet ssh; then
    echo "SSH est déjà actif"
else
    echo "SSH n'est pas actif, démarrage en cours..."
    sudo systemctl enable --now ssh
fi

# Affiche le statut final
systemctl status ssh