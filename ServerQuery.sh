#!/bin/bash

#####################################################################
# Scripta para enviar comando a servidor y recibir una respuesta
#####################################################################
# +Se utilizará como puerto de envío: 49152
# +Se utilizará como puerto de recepción: 49153
# +Se enviará a traves del puerto correspondiente el MENSAJE: [Comando]+[IP]
# +Funcionamiento:
#	-Asignamos los parametro 1 y 2 a las variables correspondiente.
#	-Asignamos los puertos correspondientes de ENVIO y RECEPCION a las variables
#	-Adquirimos la IP de la interface enp0s3 del cliente
#	-Comprobamos que la sintaxis introducida es correcta:
#		. si no es correcto imprimimos mensaje de error y cerramos el script
#		. Si la sintaxis es correcta continuamos el script.
#	-Montamos el mensaje y lo enviamos a través de el puerto de ENVIO (cerramos el puerto)
#	-Abrimos escucha sobre el puerto de RECEPCION.
#
#####################################################################

#-------------------------------------------------
# Asignacion variables
#-------------------------------------------------
server=$1 #asignamos a la variable el valor del parámetro 1
comand=$2 #Asignamos a la variable el valor del parámetro 2
portSend=49152 #Asignamos el puerto utilizado para el envio a la variable
portRcv=49153 #Asignamos el puerto utilizado para la recepción a la variable
#-------------------------------------------------
# IP cliente
#-------------------------------------------------
# +Mediante comando ifconfig consultamos la ip del interface, con grep filtramos la parte de inet
#mediante awk separamos el inet en columnas y nos quedamos con la columan 2 que contiene la ip.
#por ultimo asignamos el resultado a la variable.
myIp=$(ifconfig enp0s3 | grep 'inet' | awk '{print $2}')

#-------------------------------------------------
# Comprobación sintaxis
#-------------------------------------------------
if [ -z "$server" ] || [ -z "$comand" ]; then #Comprobamos la sintaxis de la solicitud sea correcta
	#Mostramos por pantalla el mensaje de error junto al uso correcto
	echo "Error de sintaxys, uso correcto: $0 <IP> <disk|memory|users>"
	exit 1 #Cerramos el script si la sintaxis no es correcta, indicando que se cerró por un error.
fi
#-------------------------------------------------
# Envío de mensaje
#-------------------------------------------------
# +Montamos el MENSAJE compuesto por el comando + IP y lo enviamos a través del puerto de envío.
#Cerramos la conexión tras el envío del comando
echo -e "$comand $myIp" | nc -N $server $portSend

#-------------------------------------------------
# Escucha de puerto de recepción
#-------------------------------------------------
nc -l $portRcv #Apertura de puerto para la escucha
