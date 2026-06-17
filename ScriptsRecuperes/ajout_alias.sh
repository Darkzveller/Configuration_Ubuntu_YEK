
#!/bin/bash

cat << 'EOF' >> ~/.bashrc


###############################################################################################
#                                       Ma configuration 
  
alias maj="echo -e 'J effectue l update...\n' && sudo apt update -y && echo -e '\n\nJ effectue l upgrade...\n' && sudo apt upgrade -y"
alias majg="echo -e 'J effectue l update du get ...\n' && sudo apt-get update -y && echo -e '\n\nJ effectue l upgrade du get ...\n' && sudo apt-get upgrade -y"

alias install_all="sudo apt install neofetch build-essential gdb make g++ libx11-dev git stress xorg-dev xbase-clients tree zip curl x11-apps lldb htop -y"

alias disqueH="sudo mkdir /mnt/h && sudo mount -t drvfs H: /mnt/h &&  cd /mnt/h"  
alias disqueH="sudo mkdir /mnt/g && sudo mount -t drvfs G: /mnt/g &&  cd /mnt/g" 

alias go_to_github="cd /mnt/c/Users/elkat/Documents/Github "
alias change_password="passwd"

alias arret='sudo poweroff'
alias restart='sudo reboot'
alias droit_exec='chmod +x'

export PATH="$HOME/bin:$PATH"
EOF

echo "Configuration ajoutée à ~/.bashrc"
echo "Recharge le fichier avec : source ~/.bashrc"