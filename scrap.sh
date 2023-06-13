#!/bin/bash

url="https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops"

html=$(curl -s "$url")

# Utiliser grep pour extraire les informations souhaitées du HTML
links=$(echo "$html" | grep "description" | sed 's/<[^>]*>//g' | sed 's/,.*//')
price=$(echo " $html" | grep " price" | sed 's/<[^>]*>//g')


echo "Infos trouvés :"
printf "%-50s| %s\n" "Nom" "Prix"
printf "%-50s| %s\n" "----" "----"

printf "$links | $price"
