# Individual work with  DATA FRAME

#1. Creating a new data frame creamos el data frame para tabular las variables.
edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25)
tiempo <- c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92)
sexo <- c("M","H","H","M","M","H","M","M","H","H")
misDatos <- data.frame(edad,tiempo,sexo)
misDatos
#Elimina los valores de esas variables sin eliminar los del dataframe
rm(list=c("edad", "tiempo", "sexo"))
str(misDatos)    # Estructura de 'misDatos' con str vemos como estan ordenados los datos y de que esta compuesta cada viariable. 
#ademas como podemos observar a las variables categoricas las convierte en factor ya que R ha diferenciado las numericas de las categoricas
names(misDatos)  # Nombre de las variables contenidas en 'misDatos'
#2. Checking variables and data within the data frame
#Muestra los datos de todas las variables de los registros del intervalo comprendidos entre el 3 y el 6 (conjunto cerrado)
misDatos[3:6,]
#Muestra los datos de la variable 1 en ese caso es la edad (diferentes maneras)
misDatos[,1]
misDatos$edad
misDatos[,"edad"]

#3. Some operations 
#Muestra la media de la variable 1 (edad) con diferentes maneras de ejecutar la funcion pero con mismo resultado
mean(misDatos[,1])
#Con $ extrae los datos de la variable que quieres medir
mean(misDatos$edad) 
#Otra manera de ver la media, media de los datos pero especificamente solo los de la edad
mean(misDatos[,"edad"])
#Media de los datos de la lista cuyo nombre es edad.
mean(misDatos[["edad"]])

#4. Functions ATTACH and DETACH
#Selecciona los datos y si haces cambios te cambian los datos tambien en el data frame pero si desaparecen 
#los puedes recuperar 
attach(misDatos)
#Muestra las frecuencias absolutas de las direntes variables
table(tiempo)
table(sexo)
table(edad)
table(sexo,edad)
#Calculo de la media de una variable respecto a la otra, es decir excluye los valores que no son de la condicion
mean(edad[sexo=="M"])
mean(edad[sexo=="H"])
#Remueve los datos y si desaparece una parte del data frame no se puede recuperar
detach(misDatos)

#5. New dataframe 'currencies' store some currencies
currencies = data.frame(amount=c(1,2),currency=c("Dolar", "Euro"), exchange=c(1, 0.9))
currencies
Countries<-data.frame(names=c("UK","Spain","Russia"),currency=c("Pound", "Euro", "Rublo"), exchange=c(1.2, 1, 0.02))
attach(currencies) #Fija los datos de el dataframe currencies
currency        
#Este nuevo attach superpone al anterior entonces los campos comunes se superponen tambien.
#Los no comunes siguen apareciendo
attach(Countries)  #  'detach' to  'currencies' in common fields
currency          # from Countries campo comun superpuesto por el nuevo attach
exchange           
amount   # from currencies campo no comun

detach(Countries)  # 
currency          # from currencies
detach(currencies) # 
#currency          # error

#6. In short
longitud=c(12,10,11,13,14,17)
medidas=data.frame(longitud=c(6,4,7), peso=c(240,326,315), diametro=c(8,9,9))
mean(longitud) #hace la media de la variable que no esta dentro del dataframe
#Hace la media de la variable dentro del dataframe
mean(medidas$longitud)
mean(medidas$peso)
mean(medidas$diametro)

attach(medidas)
mean(peso)
mean(diametro)
#Hace la de fuera a pesar del attach y es porque primero busca en el entorno global y si no la encuentra
#la busca ya en el dataframe
mean(longitud)
detach(medidas)

# 7. Function WITH
#Realiza un flujo de formulas anidandolas, de esta manera con los datos que tenemos de (medidas) podemos
#hallar el resto de valores y finalmente nos muestra el valor de la variable (dens) relacionada con  
# los valores de (peso, volumen) del dataframe medidas, es decir con cada volumen hayamos la densidad para cada peso.
with(medidas,{
  vol=longitud*pi*(diametro/2)^2  # volume
  dens=peso/vol               # density
  dens       # local variable                     # 
})

#Incluye la variable (dens) dentro del dataframe (medidas)
medidas
medidas$dens<-with(medidas,{
  vol=longitud*pi*(diametro/2)^2  # volume
  dens=peso/vol               #  density
  dens                          # 
})
medidas # 

#8. SUBSET
#sustrae los datos por los filtros que queramos poner para consultar informacion sobre nuestros datos
hombres<-subset(misDatos,sexo=="H") #quienes de mis datos son hombres ("H")
hombres
mujeres<-subset(misDatos,sexo=="M") #quienes de mis datos son mujeres ("M")
mujeres

mayores<-subset(misDatos,sexo=="H" & edad>30)
mayores #muestra que hombres son mayores de 30 a?os dentro de mis datos

jov_habladores<-subset(misDatos,sexo=="H" & edad<30 & tiempo>12)
jov_habladores #muestra que hombres son menores de 30 a?os y hablan mas de 12u.t.

extremos<-subset(misDatos,edad<25|edad>30)
extremos #muestra a los hombres y a las mujeres que son menores de 25 y mayores de 30

hombres<-subset(misDatos,sexo=="H", select=c(edad, tiempo))
hombres #datos de edad y tiempo solo de los pertenecientes al sexo hombre


# 9. MERGE - RBIND

animales1 = data.frame(animal=c("vaca","gato","perro","rana","lagarto","mosca","jilguero"), 
                       clase=c("mamífero","mam","mamífero","anfibio","reptil","insecto","ave"))
animales1
animales2 = data.frame(animal=c("atún", "cocodrilo", "gato","rana"), clase=c("pez", "reptil", "mamífero","anfibio"))
animales2
#Concatena por filas de los datos  ambos dataframes en este caso de animales 1 y anmales 2 en este caso
animales3 = rbind(animales1,animales2)
animales3
#concatena y devuelve los datos comunes de ambos dataframes.
animales4=merge(animales1,animales2)
animales4
#Nos devuelve la concatenacion pero esta vez solo muestra una vez los registros repetidos
animales5=merge(animales1,animales2,all=TRUE)
animales5
superficieAnimales=data.frame(animal=c("perro","tortuga","jilguero", 
                                       "cocodrilo","vaca","lagarto","sardina"),
                              superficie=c("pelo","placas óseas","plumas",
                                           "escamas","pelo","escamas","escamas"))

superficieAnimales
merge(animales3,superficieAnimales) # Muestra sólo los animales comunes a ambos dataframes
merge(animales3,superficieAnimales, all.x=TRUE) # Muestra todos los animales del primer dataframe.
merge(animales3,superficieAnimales, all.y=TRUE) # Muestra todos los animales del segundo dataframe.
merge(animales3,superficieAnimales, all=TRUE) # Muestra todos los animales de ambos dataframes.

# 10. sorting DATAFRAMES
ordenacion=order(animales1$animal) #ordena los animales por orden alfabetico
ordenacion  # Posiciones dentro del dataframe 'animales1' de los animales ordenados alfabéticamente
animales1=animales1[ordenacion,]  # Se reordenan las filas del dataframe animales1
animales1
animales1<-animales1[order(animales1$animal),]  
misDatos<-misDatos[order(misDatos$edad,misDatos$tiempo),]
misDatos