#!/bin/bash

###########################################################################################
# Title: Script para establer conexión SSH y mostrar la versión del servidor SSH
# script: SshServerVersion.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script establece una conexión SSH con el servidor SSH en localhost y muestra la versión del servidor SSH.
# El script utiliza una conexión TCP para comunicarse con el servidor SSH en el puerto 22, que es el puerto predeterminado para SSH.
# Después de establecer la conexión, el script espera un segundo para recibir la respuesta del servidor SSH, que incluye la versión del servidor.
# Finalmente, el script cierra la conexión.
###########################################################################################

#Establecemos la conexión SSH sobre localhost
exec 3<> /dev/tcp/localhost/22

#Despues de un segundo, visualizamos la respuesta
# del servidor SSH y cerramos la conexión
timeout 5 cat <&3-
