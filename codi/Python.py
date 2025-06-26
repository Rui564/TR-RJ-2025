
# Operation #

''''
print("Hola">"Python")
print(  True if "Hola" >= "Python" else print(False))
print(not(3>4))
print(3>4 and "hola"<"python")
print(3>4 or "hola">"python")
'''


# String #

'''''
my_string = "Mi String"
my_other_string = "Mi Otro String"

print(len("Mi String")) 
print(len("Mi Otro String"))
print(my_string + " " + my_other_string)

my_new_line_string = "Este es un String \n con salto de línea"
print(my_new_line_string)

my_tab_string = "\tEste es un String con tabulación"
print(my_tab_string)
'''
''''
name,surname,age = 'Jiajun' , 'Xia' , 35
print('Mi nombre es {} {} y mi edad es {}'.format(name,surname,age))
print('Mi nombre es %s %s y mi edad es %s'%(name,surname,age))
print(f'Mi nombre es {name} {surname} y mi edad es {age}')
print('Mi nombre es ' + name + ' ' + surname + ' y mi edad es ' + str(age))
'''
''''
language = "Python"
a,b,c,d,e,f = language
print(a)
print(b)
print(c)
print(d)
print(e)
print(f)
''' 
''''
language = 'Python'
Language_slice = language[::-1]
print(Language_slice)
Language_slice = language[1:2:4]
print(Language_slice)
o = "Python"
print(o.capitalize())
print(o.upper())
print(o.count('o'))
'''
# List #
''''
my_list = list([1, 2, 3, 4, 5])
my_other_list = [6, 7, 8, 9, 10]
print(len(my_list))
print(my_list[1])
print(my_list + my_other_list)

My_list = [1, 2,'Jiajun']
age,height,name = My_list[1],My_list[0],My_list[2]
My_list.append('Xia')
My_list.insert(1, 'Python')
My_list.remove('Jiajun')
My_list.pop(2)
del My_list[2]
My_list[0] = 2
print((type(My_list)))
'''
# Tuple #
''''
my_tuple = (1, 2, 3, 4, 5)
print(my_tuple[2])
'''
# set #
'''''
my_set = set()
my_other_set = {"Jiajun", "Xia", 16} 
'''
# Dictionary
'''''
my_dict = dict()
my_other_dict = {}
my_dict = {"name": "Jiajun", "surname": "Xia", "age": 16}
my_other_dict = {
    "name": "Jiajun",
    "surname": "Xia",
    "age": 16,
    "hobbies": {"Python", "JavaScript", "C++"}
                 }
print(my_dict["name"] )
my_new_dict = dict.fromkeys(my_dict,("name","surname"))
'''
# Conditions #
'''
my_condition = 5*2
if my_condition > 10 and my_condition < 20:
    print("El resultado está entre 10 y 20")
elif my_condition < 10:
    print("El resultado es menor que 10")
elif my_condition == 10:
    print("El resultado es igual a 10")
else:
    print("El resultado es mayor que 20")

my_string = ""
if not my_string:
    print("La cadena está vacía")    
'''

# Loops #
'''
my_count = 0

while my_count < 10:
    print(my_count)
    my_count += 0.1
else:
    print("El bucle ha terminado")

my_count = 0

while my_count < 10:
    print(my_count)
    my_count += 0.1
if my_count >= 5:
    print("El bucle es mayor o igual a 5")
else:
    print("El bucle es menor a 5")

my_count = 0

while my_count < 10:
    my_count += 1
    print(my_count)
    if my_count == 5:
      print("El bucle es  igual a 5")
      break
print(my_count)         

my_list = [22,24,23,33,32,21,45]                                  
for element in my_list:
    print(element)  
    if element % 2 == 0:
        print(f"El número {element} es par")
        continue
    print(f"El número {element} es impar")
else:
    print("El bucle ha terminado")


my_list = [22,24,23,33,32,21,45]
for element in my_list:
    print(element)
    if element % 2 == 0:
        print(f"El número {element} es par")
    else:
        print(f"El número {element} es impar")
print("El bucle ha terminado")
'''
# Functions #
'''''
def Happy_birthday(name, age):
    print(f"Feliz cumpleaños {name}, hoy cumples {age} años")
Happy_birthday("Jiajun", 35)
Happy_birthday("Jhon", 16)

def subtract(a, b):
    z= a - b
    return z
def add(a, b):
    z = a + b
    return z
def multiply(a, b):
    z = a * b
    return z
def divide(a, b):
    z = a / b
    return z
print(add(5, 10))
print(subtract(5, 10))
print(multiply(5, 10))
print(divide(5, 10))

name = input("Introduce tu nombre: ")
surname = input("Introduce tu apellido: ")
def create_name(name, surname):
    full_name = name + " " + surname
    return full_name
print(create_name(name, surname))
'''
# Classes #
'''
class Coche:
  def __init__(self, marca, modelo, color):
      self.marca = marca
      self.modelo = modelo  
      self.color = color
      self.velocidad = 0
  def acelerar(self, incremento):
        self.velocidad += incremento
        return self.velocidad
  def frenar(self, decremento):
        self.velocidad -= decremento
        if self.velocidad < 0:
            self.velocidad = 0
        return self.velocidad
    
Lamborghini = Coche("Lamborghini", "Aventador", "Rojo")
# Fernando aquí hi es el teu Lamborghini de color vermell
Tesla = Coche("Tesla", "Model S", "Blanco")
print(f"Marca: {Lamborghini.marca}, Modelo: {Lamborghini.modelo}, Color: {Lamborghini.color}, Velocidad: {Lamborghini.velocidad} km/h")
print(Lamborghini.marca, Lamborghini.modelo, Lamborghini.color, )
Lamborghini.acelerar(50)
print(f"Velocidad después de acelerar: {Lamborghini.velocidad} km/h")
Lamborghini.frenar(30)
print(f"Velocidad después de frenar: {Lamborghini.velocidad} km/h")
print(type(Lamborghini))
'''
      

# Exception #
'''
try:
    print(5+'5')
except:
    print("Ha ocurrido un error")
else:
    print("No ha ocurrido ningún error")
finally:
    print("La ejecución continua")

try:
    print(5+'5')
except TypeError as e:
    print(f"Ha ocurrido un TypeError: {e}")

try:
    print(5+'5')        
except Exception as e:
    print(f"Ha ocurrido un error: {e}")
'''
# Modules #
''''
import math
print(math.log(100,10))

from math import pi, sqrt
print(pi)
print(sqrt(16))

import binaryOperations as bo  
print(bo.equacio())    
'''


