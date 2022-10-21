#!/bin/bash
#Il faut choisir un fichier csv, partons du principe qu'il est similaire à celui de la semaine dernière.
#Le script est donc identique au précédent car les caractéristiques demandées sont les mêmes.
export IFS=','
cat Shell_Userlist.csv | sed 1d Shell_Userlist.csv | sed -e 's/ //g' | while read Id Prenom Nom Mdp Role || [ -n "$Role" ];
	do
	sudo echo "\n\n\n\n\n\o" |  adduser $Prenom-$Nom
	echo "$Prenom-$Nom:$Mdp" | sudo chpasswd
	sudo usermod -u $Id "$Prenom-$Nom"
		if [[ "$Role" = *"$Admin"* ]]
		then
		sudo usermod -aG sudo "$Prenom-$Nom"
		fi
	done
