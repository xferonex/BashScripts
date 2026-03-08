#!/bin/bash

###########################################################################################
# Title: Script para realizar busqueda de un fichero en el sistema
# script: search.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script realiza una busqueda de un fichero en el sistema.
# El script solicita al usuario el nombre del fichero a buscar, luego muestra el nombre introducido 
# por el usuario y finalmente muestra el resultado de la busqueda.
###########################################################################################

#Scrip de busqueda de fichero:
#  1º Consulta busqueda
#	2º se introduce valor de busqueda
#	3º Mustra el valor introducido
#	4º Se muestra por pantalla el resultao de la busqueda

echo -e "introduce el fichero que desea buscar: \n" #Print para solicitar al usuario el nombre del fichero a buscar.
read nameSearch #Leemos el nombre del fichero introducido por el usuario y lo asignamos a la variable nameSearch.

echo -e "el fichero que desea buscar se llama: \t $nameSearch" #Print para mostrar al usuario el nombre del fichero que ha introducido para buscar.

sudo updatedb #Ejecutamos el comando updatedb para actualizar la base de datos de ubicaciones de archivos en el sistema, 
                #lo que permite que el comando locate funcione correctamente y pueda encontrar el fichero buscado por el usuario.

locate $nameSearch #Ejecutamos el comando locate seguido del nombre del fichero introducido por el usuario para realizar la búsqueda y mostrar los resultados en pantalla.
