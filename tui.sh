#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Utilisation : \$./tui.sh *nomTelecommande*"
	exit 1
else
	nomTcde=$1
	echo "Télécommande $nomTcde créee!"
	#si le nom de telecommande existe deja,prévenir...
	if [ -f $nomTcde.txt ] ; then
		rm $nomTcde.txt
	fi
	choix='o'
	nCmde=0
	echo "Ajout de commandes pour la télécommande $nomTcde :"
	while [ $choix = 'o' ]; do
		nCmde=$((nCmde+1))
		echo "Nom commande $nCmde?"
		read nomCmde
		echo "\nCode commande $nomCmde? (Ex:\"0x0A9F\")"
		read codeCmde
		echo "$nomCmde\n$codeCmde\n" >> $nomTcde.txt
		echo "\nCommande $nomCmde avec le code $codeCmde assigné à la télécommande $nomTcde! \
		\nVoulez-vous ajouter d'autres commandes? (o/n)"
		read choix
	done
fi
exit 0
