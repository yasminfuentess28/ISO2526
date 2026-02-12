#!/bin/bash
# Autor: Yasmin Fuentes Sánchez
# Fecha: 12/02/26

clear

if [ $# -eq 1 ]; then
	uid=$1
else
	uid=1000
fi

if [ $# -gt 1 ]; then
	echo "Error. Se ha introducido más de un parámetro."
	exit
fi
if [ $USER != "root" ]; then
	echo "Error. El script debe ser ejecutado por el root."
	exit
fi

dia=$(date +"%d-%m-%Y")
hora=$(date +"%H:%M")

echo "=========================================================="
echo
echo "Informe de usuarios el dia $dia a las $hora"
echo
total=0
lineas=$(cat /etc/passwd)

for l in $lineas; do
	nom=$( echo $l | cut -f 1 -d ":" )
	num=$( echo $l | cut -f 3 -d ":" )
	if [ $num -gt $uid 2>/dev/null ]; then
		echo "$nom - $num"
		total=$((total+1))
	fi
echo "$dia - $hora - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
done
echo
echo "Total: $total usuarios."
echo
echo "=========================================================="
