#!/bin/bash

opcion=0

echo -e "\U0001F44B BUENAS \U0001F44B"

while [ $opcion -ne 7 ]; do
	echo
	echo ¿Que quieres realizar?
	echo
        echo 1. Crear un fichero y carpeta
	echo 2. Eliminar fichero y carpeta
	echo 3. Mover archivos
	echo 4. Adivinar el numero
	echo 5. Informacion de los archivos
	echo 6. Actualizacion de paquetes
	echo 7. Salir
	echo _________________________________

        read opcion
	echo ---------------------------------

        case $opcion in
                1) 	opcion1=0
			while [ $opcion1 -ne 3 ]; do

			echo 1. Crear fichero
			echo 2. Crear carpeta
			echo 3. Volver atrás
			echo ________________________

			read opcion1

			case $opcion1 in
				1) echo ¿Que nombre le quieres poner al fichero?
				   echo ----------------------------------------
				   read fichero1
				   touch "$fichero1" ;;

				2) echo ¿Que nombre le quieres poner a la carpeta?
				   echo -----------------------------------------
				   read carpeta1
				   mkdir "$carpeta1";;

				3) echo Volvemos al menu principal;;

				*) echo opcion no valida
				   opcion2 = 0
				;;
			esac
		   done;;
                2)	opcion2=0

			while [ $opcion2 -ne 3 ]; do

			echo 1. Eliminar fichero
			echo 2. Eliminar carpeta
			echo 3. Volver atrás
			echo _________________________

			read opcion2

			case $opcion2 in
				1) echo ¿Que fichero quieres eliminar?
				   echo ------------------------------
				   read fichero2
				   rm "$fichero2";;

				2) echo ¿Que carpeta quieres eliminar?
				   echo ------------------------------
				   read carpeta2
				   rm -r "$carpeta2";;

				3) echo Volvemos al menu principal;;

				*) echo opcion no valida
				   opcion2 = 0
				;;
			esac
		done;;
		3) echo Vamos a ordenar los archivos.
		   echo -------------------------------------------------
		   echo Ponga el nombre del archivo que desée mover.
		   read fichero3
		   echo --------------------------------------------------
		   echo Ponga el nombre de la carpeta donde lo desée meter.
		   read carpeta3
		   mv "$fichero3" "$carpeta3";;
		4) numero_aleatorio=$(( (RANDOM % 100) + 1 ))

		   intentos=0

		   while true; do
		   read -p "Adivina el número del 1 al 100: " intento_usuario
		   ((intentos++))
		   	if [ "$intento_usuario" -eq "$numero_aleatorio" ]; then
		   		echo "¡Felicidades! Adivinaste el número en $intentos intentos."
			break
		  	elif [ "$intento_usuario" -lt "$numero_aleatorio" ]; then
				echo "Intenta con un número más grande."
			else
				echo "Intenta con un número más pequeño."

			fi
		   done
			echo --------------------------
			;;

		5) export PS1="\[\e[32m\]\u@\h:\w\[\e[0m\] > "
		   echo "Uso de CPU:"
		   top -n 1 | grep "Cpu(s)"
		   echo "Uso de memoria:"
		   free -h
		   echo "Espacio en disco:"
		   df -h
		   alias ll='ls -l'
		   echo -e "\nArchivos en el directorio actual:"
		   ls -l 
		   echo "---------------------------------------------";;

		6) 	opcion3=0
		   	while [ $opcion3 -ne 5 ]; do

				echo ¿Que quieres actualizar?
				echo
				echo 1. Actualiza la lista de paquetes disponibles
				echo 2. Realiza la actualización de los paquetes instalados
				echo 3. Elimina paquetes innecesarios y sus dependencias
				echo 4. Realiza todas las actualizaciones y limpiezas indicadas anteriormente
				echo 5. Volver al menu principal
				echo ________________________________________________________________________

				read opcion3

				case $opcion3 in

					1)sudo apt update
					  echo __________________________;;

			   		2)sudo apt upgrade -y
					  echo __________________________;;

			   		3)sudo apt autoremove -y
					  echo __________________________;;

					4) sudo apt update
					   sudo apt upgrade -y
					   sudo apt autoremove -y
					   echo _________________________;;

					5) echo volviendo al menu principal;;

					*) echo opcion no valida
					   opcion3 = 0;;
			esac
		done
		   echo "---------------------------------------";;

		7) echo -e "\U0001F44B NOS VEMOS \U0001F44B"
		   ;;
                *) echo opcion no valida
                   opcion=0                ;;
        esac
done
