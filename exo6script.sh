#!/bin/bash

# Couleurs
green='\033[0;32m'
yellow='\033[0;33m'
red='\033[0;31m'
reset='\033[0m'

# Fonction pour afficher le menu de sélection
afficher_menu() {
  echo "=== ${green}Menu de sélection${reset} ==="
  echo "1. Une blague"
  echo "2. Time"
  echo "3. Calcule"
  echo "4. Météo" 
  echo "5. Quitter"
}

# Fonction pour traiter l'option sélectionnée
traiter_option() {
  local option=$1
  case $option in
    1)
      echo "${yellow}Vous avez sélectionné une blague.${reset}"
      shuf -n 1 listb # | espeak -p 20 -s 40
      ;;
    2)
      echo "${yellow}Vous avez sélectionné voir l'heure.${reset}"
      date +%T # espeak -p 20 -s 40
      ;;
    3)
      echo "${yellow}Vous avez sélectionné calcule.${reset}"
	# input
	echo "Entrez un chiffre : "
	read a
	echo "Entrez un deuxième chiffre : "
	read b
	 
	# operation
	echo "Entrez un chiffre selon la liste :"
	echo "1. Addition"
	echo "2. Subtraction"
	echo "3. Multiplication"
	echo "4. Division"
	read ch
	 
	# calculator
	case $ch in
	  1)res=`echo $a + $b | bc`
	  ;;
	  2)res=`echo $a - $b | bc`
	  ;;
	  3)res=`echo $a \* $b | bc`
	  ;;
	  4)res=`echo "scale=2; $a / $b" | bc`
	  ;;
	esac
	echo "Resultat : $res"
      ;;
    4)
	echo "${yellow}Vous avez sélectionné la météo.${reset}"
	curl wttr.in?0
      ;;
    5)
      echo "${green}Au revoir !${reset}"
      exit 0
      ;;
    *)
      echo "${red}Option invalide. Veuillez sélectionner une option valide.${reset}"
      ;;
  esac
}

# Vérifier si l'argument est un nombre
is_number() {
  re='^[0-9]+$'
  if ! [ "$1" -eq "$1" ] 2> /dev/null ; then
    return 1
  fi
  return 0
}

# Mode interactif
if [ $# -eq 0 ]; then
  echo "=== ${green}Mode interactif${reset} ==="
  while true; do
    afficher_menu
    read -p "Veuillez sélectionner une option : " choix
    if is_number $choix; then
      traiter_option $choix
      echo
    else
      echo "${red}Veuillez entrer un nombre valide.${reset}"
    fi
  done
else
  # Mode non interactif
  echo "=== ${green}Mode non interactif${reset} ==="
  for choix in "$@"; do
    if is_number $choix; then
      traiter_option $choix
      echo
    else
      echo "${red}Option invalide : $choix. Ignorée.${reset}"
      echo
    fi
  done
fi
