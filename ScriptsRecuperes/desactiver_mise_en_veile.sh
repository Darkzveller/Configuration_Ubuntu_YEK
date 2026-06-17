#!/bin/bash
# Le script suivant permet a l'ordinateur de ne jamais se mettre en veille 
# De le laisser constamment eveiller mais pouvoir eteindre ou allumer l'écran via la commande ecran on/off

# A utiliser sur un systeme GNome, dans mon cas c'est Ubuntu 24.04 lts

# Désactive le délai d'inactivité avant mise en veille de l'interface GNOME
# 0 signifie que le système ne se mettra jamais en veille automatiquement à cause de l'inactivité utilisateur

gsettings set org.gnome.desktop.session idle-delay 0


# Désactive les mécanismes système de mise en veille profonde via systemd :
# - sleep.target : cible générale de sommeil
# - suspend.target : mise en veille RAM
# - hibernate.target : hibernation disque
# - hybrid-sleep.target : combinaison veille + hibernation
# "mask" empêche complètement leur activation (même manuellement)
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
# Vérifie si tous les services de mise en veille sont bien "masked"
# systemctl is-enabled renvoie "masked" si le service est désactivé de manière forcée
if [ "$(systemctl is-enabled sleep.target)" = "masked" ] \
   && [ "$(systemctl is-enabled suspend.target)" = "masked" ] \
   && [ "$(systemctl is-enabled hibernate.target)" = "masked" ] \
   && [ "$(systemctl is-enabled hybrid-sleep.target)" = "masked" ]
then
    # Si tout est correctement désactivé, on affiche un message de confirmation
    echo "OK - La mise en veille est désactivée."
else
    # Sinon, cela signifie qu'au moins un mode de veille n'a pas été correctement bloqué
    echo "ERREUR - Certains services ne sont pas masqués."
fi  



