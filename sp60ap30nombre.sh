#!/bin/bash

while true; do			#Bucle para que se repita el menu de opciones, aunque seleccionemos una opcion (Menos la de salir)
	echo ""
	echo "1. Servicios loaded"
	echo "2. Servicios not found"
	echo "3. Servicios active"
	echo "4. Servicios inactive"
	echo "5. Servicios dead"
	echo "6. Servicios running"
	echo "7. salir"
	echo ""
	read -p "Seleccione una opcion [1-7]: " opcion

	case $opcion in		#Configuracion de cada opcion
	1)
		clear
		echo "Mostrando los servicios loaded..."
		echo ""
		systemctl list-units --type=service --all | grep "loaded" | less	#Usamos systemctl para ver los servicios junto a un grep
											#para filtrar por lo que queremos ver y usamos un less para poder
											#ver los servicios sin que nos salgan todos de golpe
		;;
	2)
		clear
		echo "Mostrando los servicios not found..."
		echo ""
		systemctl list-units --type=service --all | grep "not-found" | less
		;;
	3)
		clear
		echo "Mostrando los servicios active..."
		echo ""
		systemctl list-units --type=service --all | grep  -w "active" | less
		;;
	4)
		clear
		echo "Mostrando los servicios inactive..."
		echo ""
		systemctl list-units --type=service --all | grep "inactive" | less
		;;
	5)
		clear
		echo "Mostrando los servicios dead..."
		echo ""
		systemctl list-units --type=service --all | grep "dead" | less
		;;
	6)
		clear
		echo "Mostrando los servicios running..."
		echo ""
		systemctl list-units --type=service --all | grep "running" | less
		;;
	7)
		echo "Saliendo..."		#Hacemos la salida del bucle con un break
		echo ""
		break
		;;
	*)
		echo ""
		echo "Opcion invalida"		#Hacemos la opcion por defecto en caso de que no seleccionemos un valor entre 1 y 7
		;;
	esac
done
