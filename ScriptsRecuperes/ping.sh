#!/bin/bash

# Définir l'adresse du serveur sur lequel effectuer le ping
SERVEUR=192.168.1.254

# Envoyer 2 pings au serveur correspondant à la variale serveur
ping -c 2 $SERVEUR > /dev/null



#Determiner si le serveur est en ligne

if [ $? -ne 0 ]
then 
    echo "Erreur - le serveur $SERVEUR n'a pas répondu au ping !"
else
    echo "Ok - le serveur $SERVEUR est en ligne"
fi