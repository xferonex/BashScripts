#!/bin/bash
###########################################################################################
# Title: Script para realizar un escaneo de puertos sobre un host
# script: PortCheck.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: Este script realiza un escaner de puertos sobre un determinado host.
# Hacemos el escaneo sobre los puertos 1 al limite introducido
###########################################################################################



echo "Introduce el puerto final (limite de la lista de puertos a escanear)" #Print para solicitar al usuario el puerto final a escanear.
read inPort #Leemos el puerto final introducido por el usuario y lo asignamos a la variable inPort

HOST=$1 #Asignamos a la variable HOST el valor del primer argumento introducido por el usuario al ejecutar el script.
initialPort=1 #Asignamos a la variable initialPort el valor 1, que es el puerto inicial a escanear.
finalPort=$inPort #Asignamos a la variable finalPort el valor introducido por el usuario, que es el puerto final a escanear.
echo -e "/n" #Print salto de linea para mejorar la visualizacion del resultado.
echo -e "el puerto final será: $finalPort" #Print para informar al usuario del puerto final que se va a escanear.
echo -e "/n" #Print salto de linea para mejorar la visualizacion del resultado.

#Hacemos la lista de los puertos a analizar
listaDePuertos=$(seq $initialPort $finalPort) #Asignamos a la variable listaDePuertos el resultado del comando seq, que genera una secuencia de números desde el puerto inicial hasta el puerto final introducido por el usuario.

# Hacemos el escaneo de puertos
for puerto in $listaDePuertos #Hacemos un bucle for para iterar sobre cada puerto en la lista de puertos a analizar.
do 
	echo -ne "$puerto \r" #Print del puerto que se está analizando en cada iteración, con el uso de -ne para evitar el salto de línea y \r para volver al inicio de la línea y sobreescribir el puerto anterior.
	(echo > /dev/tcp/$HOST/$puerto) > /dev/null 2>&1 && echo "$puerto abierto" #Intentamos establecer una conexión TCP con el puerto actual del host. 
																			#Si la conexión es exitosa, se imprime un mensaje indicando que el puerto está abierto. 
																			#El comando se ejecuta en segundo plano y redirige la salida estándar y de error a /dev/null para evitar mostrar mensajes de error en caso de que el puerto esté cerrado.
done

