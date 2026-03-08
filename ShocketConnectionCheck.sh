#!/bin/bash

###########################################################################################
# Title: Script para comprobar la conexión a un host remoto mediante sockets
# script: ShocketConnectionCheck.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script intenta establecer una conexión con un host remoto utilizando sockets.
# El script toma como argumento el nombre del host remoto al que se desea conectar y el puerto al que se desea conectar 
# (en este caso, el puerto 80). Luego, el script verifica si la conexión se ha establecido correctamente o no, y muestra un mensaje en consecuencia.
###########################################################################################

HOST=$1 #Asignamos a la variable HOST el valor del primer argumento introducido por el usuario al ejecutar el script, que se espera que sea el nombre del host remoto al que se desea conectar.
PORT=80 #Asignamos a la variable PORT el valor 80, que es el puerto al que se desea conectar en el host remoto. Este puerto es comúnmente utilizado para conexiones HTTP, pero puede ser modificado según las necesidades del usuario.

#Intentamos establecer una conexión con el host remoto
# aunque solo queremos ver si se ha establecido la conexión o no

echo > /dev/tcp/$HOST/$PORT &> /dev/null #Intentamos establecer una conexión TCP con el host remoto utilizando el puerto especificado.

#Si el comando ejecutado ha sido satisfactorio, esto significa
# que se establecido la conexión. En caso contrario significa
# que no se ha establecido

if [ $? -eq 0 ] #Verificamos el valor de retorno del comando anterior utilizando la variable especial $?. 
				#Si el valor es igual a 0, esto indica que el comando se ejecutó correctamente y se estableció la conexión. 
				#En este caso, se muestra un mensaje indicando que la conexión se ha establecido. Si el valor no es igual a 0, 
				#esto indica que hubo un error al intentar establecer la conexión, y se muestra un mensaje indicando que no se ha podido establecer la conexión.
then
	echo -e "Conexion establecida" #Print para informar al usuario que la conexión se ha establecido correctamente.
else
	echo -e "No se ha podido establecer la conexión" #Print para informar al usuario que no se ha podido establecer la conexión.
fi
