#Lògica
a = 9
b = 11
c = 12
d = 9

Resultat = ((a>b)or(a<c))and((a==c)or(a>=b))
print (Resultat)

#Dades
llista = ["Rui Chen", "16 anys", "Barcelona"] #Modificable
print(llista[0])
tupla = ("Rui Chen", "16 anys", "Barcelona") #No Modificable

conjunt = {"Rui Chen", "16 anys", "Barcelona"}#No Modificble ni es repeteixen dades i estan desordenats

diccionari = {
    'Nom' : "Rui Chen",
    'Edat' : 16,
    'Localitat' : "Barcelona"
}
print(diccionari["Nom"]), print(diccionari["Edat"] + 2)

#Condicions

edat = int(input("Quina es la teva edat? "))
if edat == 18:  #Primera Condició
    print("Ets major d'edat")

elif edat >18:  #Segona Condició
    print("Ets molt jove")
else:  #Si les condicions no son True, s'executa else
    print("Ets menor d'edat")


Salari = int(input("Quant guanyes? ")) 
Gastos = int(input("Quant gastes ? "))

if Salari > 20000:
    print("Tens molts diners")
    if Salari - Gastos <2000:
        print("Estas gastant molts diners")
    else:
        print("Estas bé de diners")
else:
    print("Ets pobre")