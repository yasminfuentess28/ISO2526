#!/bin/bash
# Autor: Yasmin Fuentes Sánchez
# Fecha: 10/02/26

clear

salida=$1
dir=$2

if [ $# -ne 2 ]; then
	echo "Error. El número de parámetros introducidos no es correcto. Saliendo..."
	exit
fi
if [ -f $salida ]; then
	echo "Error. El fichero de salida ya existe. Saliendo..."
	exit
fi
if [ ! -d $dir ]; then
	echo "Error. El directorio no existe. Saliendo..."
	exit
fi
if [ -z "$(ls -A $dir)" ]; then
	echo "Error. El directorio está vacío. Saliendo..."
	exit
fi
echo
echo "------Yasmin Fuentes Sánchez------"
echo
echo " Identificando ficheros .txt que "
echo " contengan más de 5 líneas...    "
echo

total=0
for i in "$dir"/*.txt; do
	if [ -f $i ]; then
		lin=$(wc -l < $i)
			if [ $lin -ge 5 ]; then
				echo "$i"
				echo "$i" >> "$salida"
				total=$((total+1))

				palabras=$(wc -w < "$i")
				nuevo="$i.q"
				function linea(){

					echo "El fichero original tiene $palabras palabras"
					cat "$i"
				}
				linea > "$nuevo"
			fi
	fi
done

echo "El número de ficheros identificados es $total" >> "$salida"

