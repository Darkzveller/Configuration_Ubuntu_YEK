#!/bin/bash 

echo "Installation de waydroid en cours"


sudo apt install curl ca-certificates -y
curl https://repo.waydro.id | sudo bash
sudo apt install waydroid -y
echo "L'installation brut des fichiers est fini \n"
echo "Choisissez une image :"
echo "1) Vanilla"
echo "2) GApps"

# read -rp "Votre choix : " choix
# 
# case "$choix" in
    # 1)
        # sudo waydroid init -s VANILLA
        # printf "Tu as choisi Vanilla \n"
        # ;;
    # 2)
        # sudo waydroid init -s GAPPS
        # printf "Tu as choisi GAPPS \n"
# 
        # ;;
    # *)
        # echo "Choix invalide"
        # exit 1
        # ;;
# esac

read -rp "Votre choix : " choix

case "$choix" in
    1)
        printf "Initialisation Vanilla...\n"
        if sudo waydroid init -s VANILLA; then
            printf "Tu as choisi Vanilla\n"
        else
            printf "Erreur lors de l'installation Vanilla\n"
            exit 1
        fi
        ;;

    2)
        printf "Initialisation GAPPS...\n"
        if sudo waydroid init -s GAPPS; then
            printf "Tu as choisi GAPPS\n"
        else
            printf "Erreur lors de l'installation GAPPS\n"
            exit 1
        fi
        ;;

    *)
        echo "Choix invalide"
        exit 1
        ;;
esac

sudo waydroid status

echo "Activation de waydroid"
sudo systemctl enable --now waydroid-container
sudo waydroid container start
waydroid show-full-ui

ANDROID_ID=$(sudo waydroid shell -- sh -c \
"sqlite3 /data/data/*/*/gservices.db \
'select value from main where name=\"android_id\";'")

echo "Android ID : $ANDROID_ID"
echo
echo "Ouvertur de la page en cours (si elle ne s'ouvre voici le bon lien) :"
echo "https://www.google.com/android/uncertified"

xdg-open "https://www.google.com/android/uncertified"
