#!/bin/bash

#####################################################################
# author: Fernando Arroyo
# date: 2026-03-08
####################################################################
#  Script para  realizar respuestas según comando
####################################################################
# + Se utilizara como puerto de recepcion de comandos: 49152
# + Se utilizara como puerto de respuesta: 49153
# + De los cliente se recibirá un MENSAJE compuesto por el comando + la IP del cliente que lo envia
# + Funcionamiento:
#	- Asignamos los puertos a las variables correspondientes
#	- Mediante bucle mantenemos el script escuchando el puerto de recpción a la espera de recibir el mensaje
#	- Separamos del mensaje el comando y la IP
#	- Según el comando de solicitud recibido ejecutamos el comando correspondiente
#	- Esperamos 500ms y el comando correspondiente ejecutado es enviado a traves de NC por el puerto de respuesta a la IP del cliente que envío el mensaje
#
#
####################################################################

#-----------------------------------------
# Asignación de puertos
#-----------------------------------------
port=49152 #Asignamos el valor del puerto a través del cual se reciben los comando
portResponse=49153 #Asignamos el valor del puerto para el envío de las respuestas.

#-------------------------------------------
#Bucle de escucha
#-------------------------------------------
# +Mediante el bucle infinito vamos manteniendo la escucha a la espera de recibir el MENSAJE

while true; do #Bucle con condición siempre TRUE

	query=$(nc -l $port) #Capturamos el resultado del mensaje recibido por el puerto de recepcion
	cmd=$(echo $query | awk '{print $1}') #imprimimos el valor del mensaje y mediante awk adquirimos la primera palabra, que contiene el comando
	clientIp=$(echo $query | awk '{print $2}') #Imprimimos el valore del mensaje y mediante awk adquirimos la segunda palabra que contiene la ip.
	echo -e "Comando: $cmd recibido del cliente: $clientIp" #Imprimos mensaje por pantalla de servidor para visualizar que comando se solicita y quien lo solicita.
		#Mediante CASE ejecutamos un valor según el comando recibido
		#Consultamos el valor de la varieble entre comillas para reducir fallos en el case
		case "$cmd" in
			disk) #Petición de porcentaje de ocupación de discos
				sleep 0.5
				df -h | nc -N $clientIp $portResponse #Comando corresponciente a la petición
				echo "Respuesta enviada" #Mensaje de confirmación respuesta
				echo -e "\n" #Salto de linea para aumentar la legibilidad del siguiente comando
			;;
			memory) #Petición de uso de memoria
				sleep 0.5
				free -h | nc -N $clientIp $portResponse #Comando corresponciente a la petición
				echo "Respuesta enviada" #Mensaje de confirmación respuesta
				echo -e "\n" #Salto de linea para aumentar la legibilidad del siguiente comando
			;;
			users) #Petición de usuarios conectados
				sleep 0.5
				who | nc -N $clientIp $portResponse #Comando corresponciente a la petición
				echo "Respuesta enviada" #Mensaje de confirmación respuesta
				echo -e "\n" #Salto de linea para aumentar la legibilidad del siguiente comando
			;;
			*) #Si el comando no es valido
				sleep 0.5
				echo "Comando no reconocido" | nc -N $clientIp $portResponse
				echo "Respuesta enviada" #Mensaje de confirmación respuesta
				echo -e "\n" #Salto de linea para aumentar la legibilidad del siguiente comando
			;;

		esac #Fin CASE
done #Fin bucle WHILE

