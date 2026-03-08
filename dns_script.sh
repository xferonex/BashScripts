 #!/bin/bash

###########################################################################################
# Title: Script para añadir un nuevo DNS al fichero host de Linux
# script: dns_script.sh
#
# Author: Fernando Arroyo
# Date: 2026-03-08
###########################################################################################
# Script para añadir un nuevo DNS al fichero host de Linux.
# El script hace una copia de seguridad del fichero host, luego pregunta al usuario por el número
# de lineas superiores que se quieren mantener, el nombre del nuevo DNS y su IP. Después genera un nuevo
# fichero host con la información introducida por el usuario y finalmente borra el fichero de backup.
###########################################################################################

cat /etc/hosts > backup_dns.txt # Creamos un backup del contenido del fichero host.
cat backup_dns.txt # Print del contenido del backup para poder contar manualmente las lineas superirores.
echo "-"
echo "Introduce la cantidad de lineas en la parte superior:" # Print consulta linea superiores.
read lineas # Leemos el contenido introducido por el usuario.

head -n $lineas backup_dns.txt > nuevo_dns.txt
# Leemos las lineas superiores indicadas por el usuario y las copiaos al fichero nuevo_dns.txt
echo "-"
echo "Introduce el nombre DNS:" # Print consulta nombre del DNS. 
read name # Leemos el valor introducido por terminal.
echo "-"
echo "Introduce ip:" # Print consulta IP del DNS.
read ip # Leemos el valor introducido en el terminal.

echo -e "$ip $name" >> nuevo_dns.txt #Realizamos print de los valores de ip y dns y los guardamos en el fichero nuevo_dns.txt
ntotales=`wc -l < backup_dns.txt` #Leemos las lineas totales  del fichero backup
linf=$[ntotales-lineas]  # Calculamos las lineas inferiores.

#Leemos las lineas inferiores calculdas del fichero backup y las copiamos en nuevo_dns.txt
tail -n $linf backup_dns.txt >> nuevo_dns.txt
echo "-"
echo "-"
echo "******Esto ha generado:*******" #Print para informar de nuevo ficehro host que se ha generado
cat nuevo_dns.txt #Consulta fichero nuevo dns.
echo "-"
echo "-"
echo "-"
#Movemos el fichero nuevo_dns.txt a la carpeta donde se encuentra el fichero host. Com el mismo nobre lo sobrescribimos.
sudo mv nuevo_dns.txt /etc/hosts
echo "**** Fichero Hosts generado ****"
echo "-"
echo "-"
rm backup_dns.txt # Borramos el fichero backup_dns.txt
echo "**** Ficheros temporales eliminados ****"
echo "-"
echo "-"
echo "-"
echo "******* END *******" #Print indicacion final de script.
