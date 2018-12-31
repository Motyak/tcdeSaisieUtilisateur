#!/bin/sh

WIDTH_DEFAULT=500
HEIGHT_DEFAULT=200

nomTcde=$(zenity --entry \
--title="Création d'une télécommande" \
--width=$WIDTH_DEFAULT --height=$HEIGHT_DEFAULT \
--text="Nom télécommande?" \
--entry-text="telecommande")
#si le nom de telecommande existe deja,prévenir...
if [ -f $nomTcde.txt ]; then
	rm $nomTcde.txt
fi
choix=0
nCmde=0
while [ $choix -eq 0 ]; do
	nCmde=$((nCmde+1))
	nomCmde=$(zenity --entry \
	--title="Création d'une commande pour $nomTcde" \
	--width=$WIDTH_DEFAULT --height=$HEIGHT_DEFAULT \
	--text="Nom commande?" \
	--entry-text="commande$nCmde")
	codeCmde=$(zenity --entry \
	--title="Création d'une commande pour $nomTcde" \
	--width=$WIDTH_DEFAULT --height=$HEIGHT_DEFAULT \
	--text="Code commande \"$nomCmde\"?" \
	--entry-text="Ex:\"0x0A9F\"")
	echo "$nomCmde\n$codeCmde\n" >> $nomTcde.txt
	zenity --question \
	--text="Voulez-vous ajouter d'autres commandes?"
	choix=$?
done
exit 0
