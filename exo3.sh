#!/bin/bash

# Vérifier si un argument a été passé
if [ $# -eq 0 ]; then
  echo "Veuillez spécifier un chemin en argument."
  exit 1
fi

# Vérifier si le chemin existe
if [ ! -d "$1" ]; then
  echo "Le chemin spécifié n'existe pas."
  exit 1
fi

# Parcourir les fichiers dans le répertoire spécifié
for file in "$1"/*; do
  # Vérifier si le fichier existe
  if [ -f "$file" ]; then
    echo "$file"
  fi
done
