#!/bin/bash
# Script d'installation d'une commande personnalisée "ecran"
# Permet de contrôler la luminosité de l'écran via une commande simple :
# ecran on / ecran off
echo "réation de la commande ecran..."

# 1. Création du dossier ~/bin si besoin
# Ce dossier sert à stocker des scripts personnels exécutables par l'utilisateur
mkdir -p "$HOME/bin"

# 2. Création du script ecran
# Le contenu est écrit dans un fichier grâce à un "here document" (EOF)
cat > "$HOME/bin/ecran" << 'EOF'

#!/bin/bash
# Script principal exécuté lors de la commande "ecran"

# IMPORTANT :
# Ici on détecte automatiquement le dossier du rétroéclairage (backlight)
# correspondant à l'écran du système (utile sur Linux/Ubuntu)

# Récupère le premier dossier de contrôle de luminosité disponible
# Lit la valeur maximale de luminosité supportée par l'écran
BACKLIGHT_DIR=$(ls -d /sys/class/backlight/* 2>/dev/null | head -n 1)
MAX_BRIGHTNESS=$(cat "$BACKLIGHT_DIR/max_brightness")

# Si l'utilisateur tape "ecran on"
if [ "$1" = "on" ]; then
    # On met la luminosité au maximum
    echo "$MAX_BRIGHTNESS" | sudo tee /sys/class/backlight/*/brightness
    echo "Ecran allumé !"

# Si l'utilisateur tape "ecran off"
elif [ "$1" = "off" ]; then
    # On met la luminosité à 0 (écran éteint)
    echo 0 | sudo tee /sys/class/backlight/*/brightness
    echo "Ecran éteint !"

# Si aucun argument valide n'est fourni
else
    # Message d'aide pour l'utilisateur
    echo "Utilisation: ecran on ou ecran off"
fi

EOF

# 3. Permissions
# Rend le script exécutable pour pouvoir l'utiliser comme une commande
chmod +x "$HOME/bin/ecran"

# 4. Vérification du PATH
# On vérifie si ~/bin est déjà dans le PATH
# (sinon la commande "ecran" ne sera pas reconnue directement)
if ! echo "$PATH" | grep -q "$HOME/bin"; then
    # Ajoute ~/bin au PATH dans le fichier ~/.bashrc
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    echo "🔧 PATH mis à jour, recharge avec : source ~/.bashrc"
fi
# Message final indiquant que l'installation est terminée
echo "Installation terminée !"
