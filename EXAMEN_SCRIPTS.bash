#EJERCICIO 1: OPCION A (Lista_Ficheros.sh)

	#!/bin/bash
	j=1
	for i in `ls -a` 						#Coge todos los elementos incluyendo los ocultos
		do
			echo Fichero $j: $i				#Escribe el numero ($j) y el nombre ($i) del fichero
			if test -d $i					#Si es un directorio (-d) te lo dice
			then
				echo "Es un directorio!"
			elif test -f $i					#Si es un fichero (-f) te lo dice
			then
				echo "Es un fichero ordinario!"
			fi
			let j++							#Pasa al siguiente elemento de la lista
			echo"-----------"
		done

#EJERCICIO 1: OPCION B (OrdenArgumentos.sh)

	#!/bin/bash
	echo "Este script ordenará alfabeticamente los parámetros"
	for i in $* 							#Coge la lista de todos los parámetros introducidos tras la ejecución, y se va moviendo en orden
	do
		echo $i >> resultado.txt 			#Va metiendo las distintas palabras en un fichero (en distinta línea)
	done
	sort resultado.txt 						#Te muestra ordenado el contenido de las filas del fichero
	rm resultado.txt						#Borramos el fichero usado

#EJERICIO 2

	#!/bin/bash
	echo -n "Introduzca el primer operando: "
	read op1									#Introduces el primer operando
	until [ $salir ]							#Hasta que no vea la opcion salir no se sale
	do
		echo -n "Introduzca el segundo operando: "
		read op2								#Te pide el segundo operando
		echo "Los operandos son: $op1 $op2"
		echo "OPERACIONES DISPONIBLES:"
		echo "1)suma 2)resta 3)multiplicación 4)division 5)resto"
		echo -n "Seleccione la operacion que desea"
		read operacion							#Te pide la operacion a realizar
		case $operacion in
			1)									#Segun el numero que le metas, saca un resultado a partir de una operacion diferente
				resultado= `expr $op1 + $op2`
			;;
			2)
				resultado= `expr $op1 - $op2`
			;;
			3)
				resultado= `expr $op1 \* $op2`
			;;
			4)
				resultado= `expr $op1 / $op2`
			;;
			1)
				resultado= `expr $op1 % $op2`
			;;
			*)									#Si metes algun valor no valido, sale con error
				echo "Operación no válida"
				exit 1
			;;
		esac
		echo "El resultado es $resultado"
		echo -n "¿Realizar otra operacion? (s/n) "
		read otra								#Te pregunta si quieres repetir otra operacion
		if [ $otra = "s" ]						#Si le dices que si, pasa el resultado a op1 y vuelve al principio
		then
			operador1=$resultado
		else									#Si le dices que no, le da un valor a salir, y al volver de nuevo (y cumplir la operacion del until) sale
			salir=1
		fi
	done

#EJERCICIO EXTRA (Biblioteca.sh)

		#!/bin/bash
		echo "Buscador de libros"
		until [ $salir ]
		do
			ehco -n "Introduzca el codigo de libro: "
			read codigo
			echo "El codigo elegido es $codigo"
			echo TITULO: `grep $codigo biblioteca.txt | cut -f2`
			echo AUTOR: `grep $codigo biblioteca.txt | cut -f3`
			echo NUMERO DE PAGINAS: `grep $codigo biblioteca.txt | cut -f4`
			echo EDITORIAL: `grep $codigo biblioteca.txt | cut -f5`
			echo -n "¿Consultar otro? (s/n) "
			read otra								#Te pregunta si quieres repetir otra operacion
			if [ $otra = "s" ]						#Si le dices que si, pasa el resultado a op1 y vuelve al principio
			then
				operador1=$resultado
			else									#Si le dices que no, le da un valor a salir, y al volver de nuevo (y cumplir la operacion del until) sale
				salir=1
			fi
		done
