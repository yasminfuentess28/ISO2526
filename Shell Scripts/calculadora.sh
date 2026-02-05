#!/bin/bash
# Autor: Yasmin Fuentes Sánchez
# Fecha: 04/02/26
# Calculadora sencilla.

clear

echo
echo "Yasmin Fuentes Sánchez"
echo

if [ $# -ne 2 ]; then
	exit
fi
if [ -f $1 ]; then
	echo "Error. El fichero ya existe."
	exit
else
	touch $1
fi
lim=0
while [ $lim -lt $2 ]; do
	lim=$((lim+1))
	echo "-----------------------------------------------"
	echo
	echo "Operación Op1 Op2"
	echo
	read -p "¿Qué operación desea realizar (S, R, M, D)? " ope
	echo
	read -p "Introduzca el primer número: " op1
	echo
	read -p "Introduzca el segundo número: " op2
	echo
	echo "$ope $op1 $op2" >> $1
	echo "------------------------------------------------"
	echo
	echo "El resultado de la operación es:"
	case $ope in

		"S")

			echo "$op1 + $op2 = $((op1+op2))"

		;;


		"R")

			echo "$op1 - $op2 = $((op1-op2))"

		;;


		"M")

			echo "$op1 x $op2 = $((op1*op2))"

		;;


		"D")

			echo "$op1 / $op2 = $((op1/op2))"

		;;


		"X")

			echo "Saliendo..."
			break

		;;


		*)

			echo "La opción introducida no existe. Saliendo..."
			break

		;;
	esac
done
	echo
        echo "La ruta del fichero es $(pwd)/$1"
        echo
        echo "El contenido del fichero es:"
        cat $1
	echo
        echo "Ha alcanzado el límite de operaciones. Saliendo..."
	echo "-------------------------------------------------"
