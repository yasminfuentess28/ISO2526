# Trabaja con ficheros y directorios.
# Autor: Yasmin Fuentes
# Fecha: 25/03/2026
import shutil as s
import os
f=open("rutas.txt", "r")

directorios=[]
ficheros=[]

for i in f:
    linea=i.strip()
    ruta=os.path.abspath(linea)

    if os.path.isfile(ruta):
        ficheros.append(ruta)
    elif os.path.isdir(ruta):
        directorios.append(ruta)

opt=1
while opt != 'E':
    print()
    print("--------------------------------")
    print("-                              -")
    print("-      Lista de Opciones       -")
    print("-                              -")
    print("-    A. Eliminar ficheros      -")
    print("-    B. Info directorios       -")
    print("-    C. Copiar ficheros        -")
    print("-    D. Mostrar lista          -")
    print("-    E. Salir                  -")
    print("-                              -")
    print("--------------------------------")
    print()
    opt=input("Elija una opción: ")
    print()
    match opt:
        case 'A':
            fich=input("Dime el nombre de un fichero: ")
            if fich in ficheros:
                os.remove(fich)
                print("Fichero eliminado correctamente.")
            else:
                print("Error. El nombre introducido no es de un fichero.")

        case 'B':
            dir=input("Dime el nombre de un directorio: ")
            if dir in directorios:
                print("Contenido del directorio: ")
                print()
                os.listdir(dir)
            else:
                print("Error. El directorio no existe.")

        case 'C':
            fich=input("Dime el nombre de un fichero: ")
            dest=input("Dime el nombre de un destino: ")
            if fich in ficheros:
                s.copy(fich, dest)
            else:
                print("Error. No existe el fichero")

        case 'D':
            lista=input("¿Desea ver la lista 'ficheros' o la lista 'directorios'? ")
            if lista == 'directorios':
                print(directorios)
            elif lista == 'ficheros':
                print(ficheros)

        case 'E':
            print("Saliendo...")
            break

f.close()