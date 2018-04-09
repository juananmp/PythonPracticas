import math
#Primer ejercicio con float redondeo y truncamiento, necesitamos
#libreria math
"""a = "2"
b = "3"
c = 1
d = 6.49
suma = int(a) +float(b) + c + round(d, 1)
e = math.trunc(suma)
print(e)"""

#division, multiplicacion,potencia,resto y cociente
"""albert = 5
raul = 2
multiplicacion = albert * raul
print ("El resultado es: " + str(multiplicacion))
division = float(albert) / float(raul)
print(division)
potencia = albert ** raul
print(potencia)
resto = albert % raul
print(resto)
cociente = albert // raul
print(cociente)"""

#solicitar datos por el terminal al usuario
#print("Escribe tu nombre")
#sintaxis python 2 raw_input
#name = raw_input("Please enter your name: ")
#input() version 3

#Condicionales AND--> & OR --> |
"""a = 5
b= 2
if (a<b):
    print(a,"a es menor que b", b)
elif(a>b):
    print(a, "a es mayor que b", b)
else:
    print("ERROR")"""
#Calculadora
#Primer Operador de la Calculadora
#por defecto input y raw_input toman strings por ello lo
#convertimos a float y a input en las opciones
"""a = float(input("Introduce el primer operador: "))
print("Primer numero introducido: " , a)

#Segundo operador de la calculadora
b = float(input("Introduce el segundo operador: "))
print("Segundo numero introducido: " , b)

print("Si quiere sumar introduzca 1")
print("Si quiere restar introduzca 2")
print("Si quiere multiplicar introduzca 3")
print("Si quiere dividir introduzca 4")
print("Si quiere salir introduzca 5")

resultado = int(input(""))

while True:

    if resultado == 1:
	       suma = float(a+b)
	       print("Has sumado los dos operadores y el resultado es:" , suma)


    elif resultado == 2:
	       resta = float(a-b)
	       print("Has restado los dos operadores y el resultado es: " , resta)
    elif resultado == 3:
	       multiplicar = float(a*b)
	       print("Has restado los dos operadores y el resultado es: " , multiplicar)
    elif resultado == 4:
	       dividir = float(a/b)
	       print("Has restado los dos operadores y el resultado es: " , dividir)
    elif resultado == 5:
           print("que te folllllen")
           break
    else:
	       print("La opcion que has elegido no es valida") """



#bucle while, contador de segundos
#la tupla al ser inmutable es la mas rapida luego diccionario y luego lista

i = [1,2,3,4,5,6]
j= 0

while j<5:

    print(i[j])
    j +=1
