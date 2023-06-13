#!/bin/bash

# Récupérer la liste des groupes
groupes=$(cut -d: -f1 /etc/group)

# Parcourir les groupes
for groupe in $groupes; do
  # Récupérer le premier utilisateur du groupe
  utilisateur=$(grep "^$groupe:" /etc/group | cut -d: -f4)
  # Afficher le groupe et l'utilisateur associé
  echo "Groupe : $groupe | Utilisateur : $utilisateur"
done

