#!/bin/bash

###########################################################################################
# Title: Script para recibir el código HTML de una página web y guardarlo en un fichero
# script: WebReceiver.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script recibe como argumento el nombre de una página web (por ejemplo, www.google.com) 
# y establece una conexión TCP con el servidor web en el puerto 80, que es el puerto predeterminado para HTTP. 
# Luego, el script envía una solicitud HTTP al servidor web para obtener el código HTML de la página. 
# Finalmente, el script guarda la respuesta del servidor web en un fichero llamado Web.txt y cierra la conexión.
###########################################################################################

#Creamos el mensaje 
mensajeEnviar="GET /HTTP/1.1\r\nhost: $1\r\nConection: close\r\n\r\n"

#Establecemos la conexion a traves del socket a traves del descriptor 3
exec 3<> /dev/tcp/$1/80

#Enviamos la orden
echo -ne $mensajeEnviar >&3

#Visualizamos el mensaje recibido y cerramos la conexion
cat <&3- >Web.txt
