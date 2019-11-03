                  ############FOR#####################
                  ############FOR#####################
      #los mas utilizados en R toman una variable a la que se le asignan los elementos 
      #de un objeto (en general vectores o listas) sucesivamente a medida que se 
      #recorren los ciclos.
                  
perros<-c("danco", "jarana", "fandinho", "campero", "bambu", "chispa")
perros<-data.frame(perros)
for(i in 1:length(perros)){
  print(paste("Mi perro se llama:", perros[i]))
}

m<-matrix(rnorm(24, 5), nrow = 4)
for(i in 1:nrow(m)){
  print(mean(m[i,]))
}

####Si queremos rellenar un objeto con valores obtenidos en cada iteracion
#Primero creamos el conjunto vacio y luego con el bucle for ejecutamos los comandos
#para hacer el rellenado.

promfila<-numeric(nrow(m))
for (i in 1:nrow(m)){
  promfila[i]<-mean(m[i,])
  
}


##las matrices son estructuras de varias dimensiones (1 dimension es un vector) si 
#queremos recorrer mas de una estructura hay que anidar bucles con for
x<-matrix(6:11, 2, 3)

for(i in seq(nrow(x))){
  for(j in seq((ncol(x)))){
    print(x[i,j])
  }
}


                          ############WHILE#####################
                          ############WHILE#####################

  #Los bucles while comienzan comprobando una condicion si esta es verdadera entonces
 #se entra al cuerpo del bucle, una vez completada una ejecucion de ese bloque, se 
  #se comprueba la condicion nuevamente y asi sucesivamente hasta que la comprobacion
  #llegue a la condicion de falso.   while (<condicion>){
                                       #codigo}

contador<-0
while(contador < 10){
  print(contador)
  contador <- contador + 1
}

                                ####Repeat######

contador<-0
repeat{
  print(contador)
  contador <- contador + 1
  if(contador == 8) break
}


                             #####Next######

#se utiliza para terminar un ciclo del bucle en ejecucion y pasar al siguiente 
#dentro de un FOR lo que sucederia al ejecutar NEXT es que saltaria al siguiente elemento 
#sobre el que se esta iterando.

#imprime solo los impares

for(i in 1:10){
  if(i %% 2 == 0) next
  print(i)
}

                             #######Break#####

#Sirve para detener un bucle y salir de el inmediatamente

for(i in mtcars$mpg){
  print(i)
  if(i < 15) break
}