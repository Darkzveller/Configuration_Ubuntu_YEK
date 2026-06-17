    #!/bin/bash
# Le script suivant permet a l'ordinateur de ne jamais se mettre en veille 
# De le laisser constamment eveiller mais pouvoir eteindre ou allumer l'écran via la commande ecran on/off

# A utiliser sur un systeme GNome, dans mon cas c'est Ubuntu 24.04 lts

# Désactive le délai d'inactivité avant mise en veille de l'interface GNOME
# 600 signifie que le système se mettra  en veille automatiquement apres 10 min de non utilisation

gsettings set org.gnome.desktop.session idle-delay 600

# Réactive les mécanismes système de mise en veille profonde via systemd :
# (annule le "mask" appliqué précédemment)
# - sleep.target : cible générale de sommeil
# - suspend.target : mise en veille en RAM
# - hibernate.target : hibernation sur disque
# - hybrid-sleep.target : combinaison veille + hibernation
# "unmask" supprime le blocage total et permet de nouveau leur activation (manuelle ou automatique)
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
# Vérifie si tous les services de mise en veille NE SONT PAS masqués
# systemctl is-masked renvoie "masked" si le service est bloqué
# donc ici on vérifie qu'ils ne sont pas "masked"

if [ "$(systemctl is-masked sleep.target)" != "masked" ] \
   && [ "$(systemctl is-masked suspend.target)" != "masked" ] \
   && [ "$(systemctl is-masked hibernate.target)" != "masked" ] \
   && [ "$(systemctl is-masked hybrid-sleep.target)" != "masked" ]
then
    # Si aucun service n'est masqué, la mise en veille est réactivée
    echo "OK - La mise en veille est réactivée (démasquage actif)."
else
    # Sinon, au moins un service est encore bloqué
    echo "ERREUR - Certains services sont encore masqués."
fi