#!/bin/bash

##############################################################
#	Fernando Arroyo Almodovar - ASIR
#############################################################
# 02/12/2025
# Práctica EndTerm
# Ejercicio 1:

while true; do #Iniciamos bucle infinito

#=======================================================
# MENU NAVEGACION PRINCIPAL
#=======================================================
#------------------------------------------------------
# Visualizacion del menu principal
#-----------------------------------------------------
echo -e "\n"
echo -e "############################################# \n MENU "
echo "   1. Log por fecha sin grep"
echo "   2. Log por fecha con grep"
echo "   3. Cantidad de logs por servicio"
echo "   4. Juntando logs de otros dias"
echo "   5. Salir"
echo -e "############################################ \n \n Introduce la opción deseada:"


#-------------------------------------------------------
# Variables
#-------------------------------------------------------
optionMenu=0 #Creamos la variable para navegar por el menú de opciones.
#----------------------------------------------------
# Leer valor de teclado
#----------------------------------------------------
read optionMenu #Insertamos mediante terminal la opción deseada.

case $optionMenu in  #Sentencia case para elegir el menú seleccionado
1) #OPCION 1
#============================================================
# MENU 1: Logs por fecha
#============================================================
# Si el usuario selecciona la opción 1, el programa pregunta al usuario si
# quiere  logs del Nov 11 o Nov 12. Según la opción elegida, el software
# filtra los logs del día elegido, los deja en otro fichero y muestra por
# pantalla la cantidad de líneas que se han guardado en el segundo fichero.
# Se realiza el filtrado mediante bucle.

#---------------------------------------------------
# Declaración de variables
#----------------------------------------------------
optionMenu1=0

#----------------------------------------------------
# Mostrar menú de OPCION 1
#----------------------------------------------------
echo -e "\n"
echo "#############################################"
echo " ** Ha seleccionado la OPCION 1 ** "
echo "#############################################"
echo " Quieres filtrar logs de?:"
echo "    a) 11 de Noviembre"
echo "    b) 12 de Noviembre"
echo "#############################################"

#-------------------------------------------------
# Leer el valor introducido
#-------------------------------------------------
read optionMenu1 #Leemos el valor introducido por terminal.

#------------------------------------------------------
# Condicion a: Logs del 11 de Noviembre mediante WHILE
#------------------------------------------------------
# +Mediante bucle while leeremos el documento línea a línea, en cada ciclo del bucle seleccionaremos los seis primeros carácteres de la línea.
# +Cuando estos seis carácteres seleccionados coincidan con la fecha elegida, se insertará la línea en el documento seleccionado.
# +Una vez finaliza el bucle de inserción de filas, realizamos otro bucle while para leer la cantidad de líneas que contiene el fichero generado

if [ "$optionMenu1" == "a" ]; then #Condición si la variable es igual a valor A
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
	echo "OK! ha seleccionado los logs del 11 de Noviembre, filtrando..." #Mostramos por pantalla el mensaje según opción seleccionada.
	numReg11=0 #Inicializamos el contador de registros a 0.
	logs11Nov="syslog_logs_5000.txt" #Cargamos el archivo que contiene los logs en la variable.
	regs11Nov="Registros11Noviembre.txt" #Fichero  donde insertaremos los logs filtrados.
	>"$regs11Nov" #Inicializamos fichero.
	while read linea; do  #Iniciamos el bucle while lectura linea por linea, almacenando la informacion en la variable linea.
		fecha="${linea:0:6}" #Leemos 6 posiciones desde la posicion inicial 0 y las almecenamos en la variable fecha.
		if [ "$fecha" == "Nov 11" ]; then #Comprobamos en cada ciclo del bucle si la variable empieza por Nov 11.
		echo -e "$linea" >> "$regs11Nov" #Insertamos nueva línea en el fichero.
		fi
	done < "$logs11Nov"
	echo -e "Se han guardado los log del 11 de Nov en el fichero $regs11Nov" #Mostramos por pantalla el fichero que se ha generado.
	while read linea2; do #Iniciamos la lectura linea por linea del fichero donde se almacenan los registros filtrados por 11 de Noviembre.
		numReg11=$((numReg11+1)) #Incrementamos la variable contador. Des esta manera registraemos cuantos recorridos realiza el bucle y así sabremos la cantidad de líneas que contiene el fichero.
	done < "$regs11Nov"
	echo -e "El fichero $regs11Nov contiene $numReg11 líneas del 11 de Nov." #Mostramos por pantalla las líneas que contiene el fichero.
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
fi #END_IF;

#------------------------------------------------------
# Condición b: Logs del 12 de Noviembre mediante WHILE
#------------------------------------------------------
# +Mediante bucle while leeremos el documento línea a línea, en cada ciclo del bucle seleccionaremos los seis primeros carácteres de la línea.
# +Cuando estos seis carácteres seleccionados coincidan con la fecha elegida, se insertará la línea en el documento seleccionado.
# +Una vez finaliza el bucle de inserción de filas, realizamos otro bucle while para leer la cantidad de líneas que contiene el fichero generado

if [ "$optionMenu1" == "b" ]; then #Condición si la variable es igual a valor B
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
	echo "OK! ha seleccionado los logs del 12 de Noviembre, filtrando..." #Mostramos por pantalla  el mensaje correspondiente a la opción seleccionada.
	numReg12=0 #Inicializamos el contador de registros a 0.
	logs12Nov="syslog_logs_5000.txt" #Cargamos el archivo que contiene los logs en la variable.
	regs12Nov="Registros12Noviembre.txt" #Fichero donde insertaremos los logs filtrados.
	>"$regs12Nov" #Inicializamos fichero.
	while read linea; do #Iniciamos el bucle while para lectura línea por línea, almacenando la información en la variable línea.
		fecha="${linea:0:6}" #Leemos 6 posiciones desde la posición inicial 0 y la almacenamos en la variable fecha.
		if [ "$fecha" == "Nov 12" ]; then #Comprobamos en cada ciclo del bucle si la variable empieza por Nov 12.
		echo -e "$linea" >> "$regs12Nov" #Insertamos nueva linea en el  fichero.
		fi
	done < "$logs12Nov"
	echo -e "Se han guardado los logs del 12 de Nov en el fichero $regs12Nov" #Mostramos por pantalla el fichero que se ha generado
	while read linea2; do #Iniciamos la lectura línea a ínea del fichero donde se almacenan los registros filtrados por 12 de noviembre.
		numReg12=$((numReg12+1)) #Incrementamos la variable contador. de esta maner registraremos cuantos recorridos realiza el bucle y así sabremos la cantidad de líneas que contiene el fichero.
	done < "$regs12Nov"
	echo -e "El fichero $regs12Nov contiene $numReg12 líneas del 12 de Nov." #Mostramos por pantalla las líneas que contiene el fichero.
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
fi #END_IF;
;; #Finalización rama OPCION 1

2) #OPCION 2
#============================================================
# MENU 2: Logs por fecha mediante GREP
#============================================================
# Si el usuario selecciona la opción 2, el programa pregunta al usuario si
# quiere  logs del Nov 11 o Nov 12. Según la opción elegida, el software
# filtra los logs del día elegido, los deja en otro fichero y muestra por
# pantalla la cantidad de líneas que se han guardado en el segundo fichero.
# El filtrado se utiliza mediante el uso de grep.
 

#---------------------------------------------------
# Declaración de variables
#----------------------------------------------------
optionMenu2=0

#----------------------------------------------------
# Mostrar menú de OPCION 2
#----------------------------------------------------
echo -e "\n"
echo "#############################################"
echo " ** Ha seleccionado la OPCION 2 ** "
echo "#############################################"
echo " Quieres filtrar mediante grep logs de?:"
echo "    a) 11 de Noviembre"
echo "    b) 12 de Noviembre"
echo "#############################################"

#-------------------------------------------------
# Leer el valor introducido
#-------------------------------------------------
read optionMenu2

#------------------------------------------------------
# Condicion a: Logs del 11 de Noviembre mediante GREP
#------------------------------------------------------
if [ "$optionMenu2" == "a" ]; then #Condición si el usuario selecciona la opción a
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
	echo "OK! ha seleccionado los logs del 11 de Noviembre mediante grep, filtrando..." #Mostramos por pantalla  el mensaje correspondiente a la opción seleccionada.
	numReg11=0 #Inicializamos el contador de registros a 0.
	logs11Nov="syslog_logs_5000.txt" #Cargamos el archivo que contiene los logs en la variable
	regs11Nov="Registros11Noviembre.txt" #Fichero donde insertaremos los logs filtrados
	#A continuación, las lineas del fichero de logs son copiadas a fichero indicado.
	#	+Comando -i hace que el filtro no diferencia entre minusculas y mayúsculas.
	#	+ Añadir ^ hace que filtre las líneas que comiencen por el texto indicado.
	grep -i '^Nov 11' "$logs11Nov"  >  "$regs11Nov"
	echo -e "Se han guardado los logs del 11 de Nov en el fichero $regs11Nov Utilizando 'grep'" #Mostramos por pantalla el fichero que se ha generado
	while read -r linea; do #Iniciamos la lectura línea a ínea del fichero donde se almacenan los registros filtrados por 11 de noviembre.
		numReg11=$((numReg11+1)) #Incrementamos la variable contador. de esta maner registraremos cuantos recorridos realiza el bucle y así sabremos la cantidad de líneas que contiene el fichero.
	done < "$regs11Nov"
	echo -e "El fichero $regs11Nov contiene $numReg11 líneas del 11 de Nov." #Mostramos por pantalla las líneas que contiene el fichero
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
fi #END_IF;

#------------------------------------------------------
# Condicion b: Logs del 12 de Noviembre mediante GREP
#------------------------------------------------------
if [ "$optionMenu2" == "b" ]; then #Condición si el usuario selecciona la opción b.
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
	echo "OK! ha seleccionado los logs del 12 de Noviembre mediante grep, filtrando..." #Mostramos por pantalla  el mensaje correspondiente a la opción seleccionada.
	numReg12=0 #Inicializamos el contador de registros a 0.
	logs12Nov="syslog_logs_5000.txt" #Cargamos el archivo que contiene los logs en la variable
	regs12Nov="Registros12Noviembre.txt" #Fichero donde insertaremos los logs filtrados
	#A continuación, las lineas del fichero de logs son copiadas a fichero indicado.
	#	+Comando -i hace que el filtro no diferencia entre minusculas y mayúsculas.
	#	+ Añadir ^ hace que filtre las líneas que comiencen por el texto indicado.
	grep -i '^Nov 12' "$logs12Nov"  >  "$regs12Nov"
	echo -e "Se han guardado los logs del 12 de Nov en el fichero $regs12Nov Utilizando 'grep'" #Mostramos por pantalla el fichero que se ha generado
	while read -r linea; do #Iniciamos la lectura línea a ínea del fichero donde se almacenan los registros filtrados por 12 de noviembre.
		numReg12=$((numReg12+1)) #Incrementamos la variable contador. de esta maner registraremos cuantos recorridos realiza el bucle y así sabremos la cantidad de líneas que contiene el fichero.
	done < "$regs12Nov"
	echo -e "El fichero $regs12Nov contiene $numReg12 líneas del 12 de Nov." #Mostramos por pantalla las líneas que contiene el fichero
	echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
fi #END_IF;
;; #Finalizacion rama OPCION 2

3)  #OPCION 3:
#=========================================================
# MENU 3: Cantidad de LOGS por cada servicio
#=========================================================
# Mediante esta opción mostramos los logs de cada servicio contenidos en
# el fichero. Se mostraran por pantalla los distintos servicios y la cantidad
# de líneas o registros que ha generado dicho servicio.
#----------------------------------------------------
# Mensaje inicial
#----------------------------------------------------
echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
echo "#############################################"
echo "ha elegido la cantidad de logs que ha generado cada servicio."
echo "#############################################"


#---------------------------------------------------------
# Proceso mediante bucle FOR (palabra por palabra)
#--------------------------------------------------------- 
logsFile="syslog_logs_5000.txt" #Cargamos el archivo que contiene los logs del sistema.
mkdir -p auxResultados #Creamos el directorio donde guardaremos los ficheros temporales.
for contenido in $(cat $logsFile); do #Bucle for consultando el fichero de logs.
	if [[ "$contenido" == *: ]]; then #Condición la palabra adquirida termina en :
		contFiltrado="${contenido::-7}" #Eliminamos los ultimos siete carácteres y lo trasferimos a la variable de contenido filtado.
		echo -e "$contFiltrado" >> "auxResultados/$contFiltrado" #Guardamos los logs en el fichero correspondiente en cada recorrido del bucle.
	fi #END_IF;
done #reinicio bucle for

for fichero in auxResultados/*; do #Bucle que recorrera el contenido de todos los ficheros dentro del directorio auxiliar.
	lineas=$(wc -l < "$fichero") #Cargamos a la variable el conteo de lineas de cada fichero dentro del directorio.
					# +Mediante comando WC, Word Count o conteo de palabras.
					# +Mediante comando -l, Indicamos que el conteo se ha de realizar de líneas. 
	echo -e "$(basename "$fichero") ha generado $lineas logs" #Mensaje a cada recorrido del bucle indicando el fichero y el conteo de lineas y por lo tanto logs.
									# +Mediante basename indicamos que solo se muestre el nombre del fichero sin su directorio.

done #Reinicio del bucle for

echo -e "\n" #Aplicamos un salto de línea para que la visualización sea mas clara.
rm -rf auxResultados #Borrado de fichero auxiliar con too su contenido eliminando sin pedir confirmación.
			# +Mediante comando -r borramos todo el contenido, archivos y subdirectorios.
			# +Mediante comando -f  forzamos a que pedir confirmación.

;; #Finalización rama OPCION 3


4)  #OPCION 4:
#=========================================================
# MENU 4: Unir logs de otros dias
#=========================================================
#Deseamos juntar en un solo fichero los logs del dia 11 al 16.
#	+syslog_logs_5000.txt contiene dias 11 y 12
#	+syslog_logs_5000_2.txt contiene días 13 y 14
#	+syslog_logs_5000_3.txt contiene días 15 y 16

#----------------------------------------------------
# Mensaje inicial
#----------------------------------------------------
echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.
echo "######################################################"
echo "ha elegido unir los logs de los dias 11 al 16 de nov"
echo "######################################################"
echo -e "\n" #Instroducimos un salto de línea para mejorar la visualización.

#----------------------------------------------------
# Asignación ficheros a variables
#----------------------------------------------------
log1="syslog_logs_5000.txt"  #log1 contendrá los dias 11 y 12.
log2="syslog_logs_5000_2.txt" #log2 contendrá los días 13 y 14.
log3="syslog_logs_5000_3.txt" #log3 contendrá los días 15 y 16.

#----------------------------------------------------
# Asignación fichero de salida
#----------------------------------------------------
logTotal="logs_todos.txt" #Contendrá todos los logs unidos y en orden de inserción.

#----------------------------------------------------
# Inicialización
#----------------------------------------------------
>"$logTotal" #Inicializamos el fichero dejandolo en blanco a cada ejecución de la opción 4.
nLogs1=0 #Inicializamos a 0 el contador de todos los registros de log 1.
nLogs2=0 #Inicializamos a 0 el contador de todos los registros de log 2.
nLogs3=0 #Inicializamos a 0 el contador de todos los registros de log 3.
nTotal=0 #Inicializamos a 0 el contador total de logs en el fichero fusionado.
#----------------------------------------------------
# Bucle inserción log dia 11 y 12
# ---------------------------------------------------
echo -e "Insertando $log1 ..." #Mensaje mostrado en pantalla
while read  linea; do #Iniciamos el bucle while para lectura línea por línea, almacenando la información en la variable línea.
	echo -e "$linea" >> "$logTotal" #Insertamos nueva linea en el fichero. Si no existe, es creado.
	nLogs1=$((nLogs1+1)) #Incrementamos el contador de logs a cada recorrido del bucle.
done < "$log1"
echo -e "Se han insertado $nLogs1 logs procendentes de  $log1" #Cantidad de logs extraidos del 11 al 12 de Nov.
echo -e "\n" #Introducimos un salto de línea para mejorar la visualización.
#----------------------------------------------------
# Bucle inserción log dia 13 y 14
# ---------------------------------------------------
echo -e "Insertando $log2 ..." #Mensaje mostrado en pantalla
while read  linea; do #Iniciamos el bucle while para lectura línea por línea, almacenando la información en la variable línea.
	echo -e "$linea" >> "$logTotal" #Insertamos nueva linea en el fichero. Si no existe, es creado.
	nLogs2=$((nLogs2+1)) #Incrementamos el contador de logs a cada recorrido del bucle.
done < "$log2"
echo -e "Se han insertado $nLogs2 logs procendentes de  $log2" #Cantidad de logs extraidos del 13 al 14 de Nov
echo -e "\n" #Introducimos un salto de línea para mejorar la visualización.
#----------------------------------------------------
# Bucle inserción log dia 15 y 16
# ---------------------------------------------------
echo -e "Insertando $log3 ..." #Mensaje mostrado en pantalla
while read  linea; do #Iniciamos el bucle while para lectura línea por línea, almacenando la información en la variable línea.
	echo -e "$linea" >> "$logTotal" #Insertamos nueva linea en el fichero. Si no existe, es creado.
	nLogs3=$((nLogs3+1)) #Incrementamos el contador de logs a cada recorrido del bucle.
done < "$log3"
echo -e "Se han insertado $nLogs3 logs procendentes de  $log3" #Contidad de logs extraidos del 15 al 16 de Nov.


nTotal=$((nLogs1+nLogs2+nLogs3)) #Sumamos los tres contadores de logs para obtener la cantidad total de logs
echo -e "\n" #Introducimos un salto de línea para mejorar la visualización.
echo -e "Se han insertado un total de $nTotal logs en $logTotal" #Mensaje con la cantidad total de logs en el fichero correspondiente.

;; #Finalización rama OPCION 4


esac #END_CASE;



 #Condicion romper bucle infinito si valor introducido es igual a 5
 if [ $optionMenu -eq 5 ]; then
	echo -e "\n"
	echo "/////////////////////////////////////////////////////////////////"
	echo "            has elegido la opción 5: SALIR DE SCRIPT"
	echo "////////////////////////////////////////////////////////////////"
	echo -e "\n"
	echo " Fernando Arroyo Almodóvar  - ASIR "
	echo " 03/12/2025 "
	echo -e "\n"
	echo "///////////////////////////////////////////////////////////////"
	break #Salimos del bucle infinito.
 fi #END_IF;
done #Reinicio del bucle infinito


