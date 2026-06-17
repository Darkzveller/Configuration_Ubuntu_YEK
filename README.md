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

- Installation de l'utilitaire permettant d'afficher l'arborescence des dossiers et fichiers du répertoire courant 

           sudo apt install tree
  
- Installation de gcc/gdb/make    

            sudo apt install build-essential        ou        sudo apt install gdb && sudo apt install gcc

- Installation de g++ , xorg-dev (pour afficher sur une machine windows avec xming), libx11 

            sudo apt install g++ xorg-dev libx11-dev -y
  
- Installation d'un zippeur (comme winrar)

            sudo apt install zip -y

- Installation d'un utilitaire en ligne de commande pour télécharger ou envoyer des données via des protocoles comme HTTP, HTTPS, FTP…

            sudo apt install curl -y
Pour tester libx11, xorg, zip ainsi que curl : https://www.youtube.com/watch?v=S15AtboQjg0

- Configuration bashrc, qui détient la commande simplifier pour tout installer

        ###############################################################################################
        #                                       Ma configuration 
        
        alias maj="echo -e 'J effectue l update...\n' && sudo apt update -y && echo -e '\n\nJ effectue l upgrade...\n' && sudo apt upgrade -y"
        alias majg="echo -e 'J effectue l update du get ...\n' && sudo apt-get update -y && echo -e '\n\nJ effectue l upgrade du get ...\n' && sudo apt-get upgrade -y"

        alias install_all="sudo apt install neofetch build-essential gdb make g++ libx11-dev git stress xorg-dev xbase-clients tree zip curl x11-apps lldb htop -y"

        alias disqueH="sudo mkdir /mnt/h && sudo mount -t drvfs H: /mnt/h &&  cd /mnt/h"  
        alias disqueG="sudo mkdir /mnt/g && sudo mount -t drvfs G: /mnt/g &&  cd /mnt/g" 

        alias change_password="passwd"

        alias droit_exec='chmod +x'
        export PATH="$HOME/bin:$PATH"

        #neofetch
Pensez bien a choisir entre wsl et unbunut desktop pour la version :

        alias arret="wsl.exe --shutdown"
        alias go_to_github="cd /mnt/c/Users/elkat/Documents/Github "

ou 
    
        alias arret='sudo poweroff'
        alias restart='sudo reboot'

- Script d'automatisation installation et configuration du petit pc portable en mode "serveur"

        Télécharger le dossier ScriptsRecuperes

- Lire un disque virtuel (google drive) depuis la ligne de commande (typiquement wsl) :

    k étant le disque virtuel qu'on souhaite accèder
  
     Monter manuellement le disque :
  
          sudo mkdir /mnt/k                → crée un point de montage.
          sudo mount -t drvfs K: /mnt/k    → monte le disque K: dans WSL
     Accèder au disque :
  
          cd /mnt/k
  ou en une seule ligne
  
      sudo mkdir /mnt/k && sudo mount -t drvfs K: /mnt/k &&  cd /mnt/k

     Démonter manuellement le disque :
  
          sudo umount /mnt/k               → démonte le disque K:

    Supprimer le dossier qui a permis "d'heberger" le disque virtuel

          sudo rmdir /mnt/H
- Vs Code

    Si l'on souhiate ouvrir un dossier ou un code sans que cela ouvre une nouvelle fenetre/instance, il faut taper cela suivi dossier ou fichier

      code --reuse-window
