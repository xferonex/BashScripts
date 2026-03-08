#!/bin/bash

###########################################################################################
# Title: Script para realizar busqueda de un fichero en el sistema
# script: search.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script realiza una busqueda de un fichero en el sistema.
# El script solicita al usuario el nombre del fichero a buscar, luego muestra el nombre introducido 
# por el usuario y finalmente el resultado de la busqueda se guarda en un fichero .txt
###########################################################################################

#Script de busqueda de archivos.
#	1º Consulta valor de busqueda.
#	2º Se introduce valore de busqueda.
#	3º Se muestra el valor introducido.
#	4º El resultado de busqueda se guarda en un fichero .txt
#	5º Se realiza consulta del fichero .txt

echo -e "introduce el fichero que desea buscar: \n" #Print para solicitar al usuario el nombre del fichero a buscar.
read nameSearch #Leemos el nombre del fichero introducido por el usuario y lo asignamos a la variable nameSearch.

echo -e "el fichero que desea buscar se llama: \t $nameSearch" #Print para mostrar al usuario el nombre del fichero que ha introducido para buscar.

sudo updatedb #Ejecutamos el comando updatedb para actualizar la base de datos de ubicaciones de archivos en el sistema, 
				#lo que permite que el comando locate funcione correctamente y pueda encontrar el fichero buscado por el usuario.

locate $nameSearch > resultado_busqueda.txt #con > cada busqueda el fichero es borrado y vuelto a generar.
					   #Con >> la busqueda se guarda al final del fochero, siendoe ste ampliado.

cat resultado_busqueda.txt #Print del contenido del fichero resultado_busqueda.txt para mostrar al usuario el resultado de la busqueda realizada.
