#!/bin/bash

echo "=== Installation de Samba ==="

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y samba

sudo systemctl enable smbd

CONF="/etc/samba/smb.conf"

echo "=== Sauvegarde de la configuration ==="
sudo cp $CONF ${CONF}.bak

echo "=== Modification automatique de [homes] ==="
echo "1. Ouverture du fichier  de configuration :"
echo "   sudo nano /etc/samba/smb.conf  le code utilise quelque chose de similaire avec sed"
echo ""
echo "2. Dans la section [homes] :"
echo "   - Décommentez la section [homes]"
echo "   - Mets : browseable = yes"
echo "   - Décommentez : read only"
echo "   - Décommentez : create mask"
echo "   - Décommentez : directory mask"
echo ""

# comment = Home Directories
sudo sed -i '/\[homes\]/,/\[/ s/^[;# ]*comment.*/   comment = Home Directories/' $CONF

# Décommente [homes] et active browseable = yes
sudo sed -i 's/^[; ]*\[homes\]/[homes]/' $CONF

# Décommente et modifie browseable
sudo sed -i '/\[homes\]/,/\[/ s/^[; ]*browseable.*/   browseable = yes/' $CONF

# Décommente read only et le force à no (souvent recommandé)
sudo sed -i '/\[homes\]/,/\[/ s/^[; ]*read only.*/   read only = no/' $CONF

# Décommente create mask
sudo sed -i '/\[homes\]/,/\[/ s/^[; ]*create mask.*/   create mask = 0700/' $CONF

# Décommente directory mask
sudo sed -i '/\[homes\]/,/\[/ s/^[; ]*directory mask.*/   directory mask = 0700/' $CONF

echo "=== Redémarrage Samba ==="
sudo systemctl restart smbd

echo ""
echo "=== CRÉATION UTILISATEUR ==="
echo "Exécute cette commande :"
echo "sudo smbpasswd -a nom_utilisateur"