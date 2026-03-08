#!/bin/bash

###########################################################################################
# Title: Script para introducir fecha desde terminal y que te devuelva un mensaje
# script: fecha_script.sh
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Funcionamiento del script: El script pide al usuario que introduzca el día, el mes y el año por terminal. 
# Luego muestra un mensaje con la fecha introducida por el usuario.
###########################################################################################

#Script para introducir fehca desde terminal y que te devuelva un mensaje

dia= 0
mes= 0
year= 0

echo -e "Introduce el dia:" #Mensaje en terminal: Introduce  el dia
read dia #asignamos a lavariable dia el valor introducido por pantalla

echo -e "Introduce el mes:" #Mensaje en terminal: Introduce el mes.
read mes #asignamos la variable mes el valor introducido por pantalla.

echo -e "Introduce el año:" #Mensaje en terminal: introduce el año
read year #asignamos a la variable año el valor introducido por pantalla.

echo -e "La fecha de hoy es: \t  $dia/$mes/$year"

