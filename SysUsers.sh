#!/bin/bash

###########################################################################################
# Title: Script para obtener los usuarios del sistema
# script: SysUsers.sh 
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script obtiene la lista de usuarios del sistema que tienen un UID entre 1000 y 2000.
# El script lee el archivo /etc/passwd, que contiene información sobre los usuarios del sistema,
# y utiliza el comando awk para filtrar los usuarios que cumplen con el criterio de UID. Luego, 
#el script muestra la lista de usuarios encontrados y el total de usuarios que cumplen con el criterio.
###########################################################################################



#Script para obtener los usuarios del sistema.
#Estos usuarios tiene un uid >= 1000
#Buscaremos usuarios con uid entre 1000 y 2000
#El ficehro /etc/passwd tiene como separador de campos :
#	+Campo 1: login
# 	+Campo 3: uid

count=0 #Inicializamos la variable count en 0 para contar el número de usuarios que cumplen con el criterio de UID entre 1000 y 2000.
echo -e "\n" #Print salto de linea para mejorar la visualizacion del resultado.
echo "***************************************" #Print para mostrar una línea de separación antes de la lista de usuarios.
#echo -e "Usuarios del sistema con UID entre 1000 y 2000:" #Print para informar al usuario que se mostrarán los usuarios del sistema que tienen un UID entre 1000 y 2000.

listaUsuarios=$(cat /etc/passwd | awk -F: '(1000 <= $3) && ($3 <= 2000) {print $1}') #Asignamos a la variable listaUsuarios el resultado del comando cat /etc/passwd combinado con awk para filtrar los usuarios que tienen un UID entre 1000 y 2000. 
                                                                    #El comando awk utiliza el separador de campos ":" para dividir cada línea del archivo /etc/passwd en campos, y luego verifica si el valor del campo 3 (UID) cumple con el criterio especificado. 
                                                                    #Si el criterio se cumple, se imprime el valor del campo 1 (login) correspondiente a ese usuario.
for usuario in $listaUsuarios
do
 count=$((count+1)) #Incrementamos la variable count en 1 para contar el número de usuarios que cumplen con el criterio de UID entre 1000 y 2000.
 echo -e "nº$count: $usuario" #Print para mostrar el número de usuario y el nombre de usuario correspondiente a cada usuario que cumple con el criterio de UID entre 1000 y 2000.
 
done
echo -e "\n" #Print salto de linea para mejorar la visualizacion del resultado.
echo "***************************************" #Print para mostrar una línea de separación después de la lista de usuarios.
echo -e "Total de usuarios: $count" #Print para mostrar el total de usuarios que cumplen con el criterio de UID entre 1000 y 2000, utilizando la variable count que se ha incrementado en cada iteración del bucle for.
echo "***************************************" #Print para mostrar una línea de separación después del total de usuarios.
echo -e "\n" #Print salto de linea para mejorar la visualizacion del resultado.
