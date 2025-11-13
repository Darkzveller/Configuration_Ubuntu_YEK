# Tuto_configuration_Ubuntu


- Explication UNIX/LINUX
    Voir dossier Explication UNIX-LINUX 

- Scanneur :
    NAPS2 : https://www.naps2.com/

- Disque virtuel google drive :
    Video : https://www.youtube.com/
 
- VPN -> Wireguard : https://www.wireguard.com/install/
    Voir également le dossier wireguard qui contient des lignes de commandes pour problèmes rencontré

- Installation de github :

           sudo apt install git

   Voir également dépot suivant : https://github.com/Darkzveller/config-memo_git/blob/main/README.md

- Installation de gcc/gdb/make    

            sudo apt install build-essential        ou        sudo apt install gdb && sudo apt install gcc

- Installation de g++ , xorg-dev (pour afficher sur une machine windows avec xming), libx11 

            sudo apt install g++ xorg-dev libx11-dev -y
  
- Installation d'un zippeur (comme winrar)

            sudo apt install zip -y

- Installation d'un utilitaire en ligne de commande pour télécharger ou envoyer des données via des protocoles comme HTTP, HTTPS, FTP…

            sudo apt install curl -y
Pour tester libx11, xorg, zip ainsi que curl : https://www.youtube.com/watch?v=S15AtboQjg0

- Lire un disque virtuel (google drive) depuis la ligne de commande (typiquement wsl) :

    k étant le disque virtuel qu'on souhaite accèder
  
     Monter manuellement le disque :
  
          sudo mkdir /mnt/k                → crée un point de montage.
          sudo mount -t drvfs K: /mnt/k    → monte le disque K: dans WSL
  
    Accèder au disque :
  
          cd /mnt/k
