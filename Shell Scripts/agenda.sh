#!/bin/bash
# Autor: Yasmin Fuentes Sánchez
# Fecha: 29/01/26
# Descripción: El script utiliza un fichero txt para ejecutar las funciones de una agenda.

clear
while true; do
	echo
	echo "=========================="
	echo "=        OPCIONES        ="
	echo "=                        ="
	echo "= a) Añadir una entrada  ="
	echo "= b) Buscar por DNI      ="
	echo "= c) Ver agenda completa ="
	echo "= d) Eliminar entradas   ="
	echo "= e) Finalizar           ="
	echo "=                        ="
	echo "=========================="
	echo
	read -p "Elija una opción: " opt
	echo
	case $opt in

		a) read -p "Escriba el DNI del usuario que desea dar de alta: " dni
			if grep "$dni" "usuarios.txt" >/dev/null ; then
				echo "El usuario ya está dado de alta."
			else
				read -p "Indique el nombre del usuario: " nom
				read -p "Indique sus apellidos: " ap ape
				read -p "Indique su localidad: " loc
				echo "$dni:$nom:$ap $ape:$loc" >> usuarios.txt
				echo "El usuario ha sido dado de alta."
			fi
		;;

		b) read -p "Escriba el DNI del usuario que desea buscar: " dni
			nombre=$(grep "$dni" "usuarios.txt" | cut -d ":" -f 2)
			apellidos=$(grep "$dni" "usuarios.txt" | cut -d ":" -f 3)
			localidad=$(grep "$dni" "usuarios.txt" | cut -d ":" -f 4)
			if [ grep "$dni" "usuarios.txt" ]; then
				echo "La persona con DNI número $dni es: $nombre $apellidos, y vive en $localidad"
			else
				echo "Error. El usuario no existe."
			fi
		;;


		c) if [ -s "usuarios.txt" ]; then
			cat "usuarios.txt"

		   else
			echo "Agenda vacía"
		   fi

		;;

		d) echo -n "" >> "usuarios.txt"

		;;

		e) echo "Saliendo..."
			exit

		;;

		*) echo "Error. La opción introducida no existe"

	esac
done

