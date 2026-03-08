#!/bin/bash

###########################################################################################
# Title: Script para establecer conexión con servidor NTP y mostrar la hora actual
# script: TimeNTP.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script establece una conexión con el servidor NTP en time.nist.gov 
# utilizando el puerto 13, que es el puerto predeterminado para el servicio de hora. 
# Después de establecer la conexión, el script muestra la respuesta del servidor NTP, que incluye la hora actual proporcionada por el servidor. 
#Finalmente, el script cierra la conexión.
###########################################################################################

#Estabecemos una conexión de entrada con el servidor ntp
# Network Time Protocol
# El servidor esta en la url time.nist.gov y la establecemos
# a traves del puerto 13

exec 3< /dev/tcp/time.nist.gov/13

#Visualizamos la respuesta y cerramos la conexión

cat <&3-
