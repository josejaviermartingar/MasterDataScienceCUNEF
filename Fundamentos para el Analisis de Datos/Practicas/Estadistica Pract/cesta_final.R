#Carga del dataset.
cesta<-LA_CESTA

#Calculamos la media de la variable para poder hallar el parametro Lambda y despues
#calcular las correspondientes distribuciones.
mean(cesta$x)
lambda<-mean(cesta$x)

#Calculamos las diferentes distribuciones de Poisson para calcular las diferentes
#probabilidades. En el ultimo hemos tenido que cambiar lambda que estaba por minuto
#a una nueva lambda que es por cinco minutos.
dpois(0, lambda)
sum(dpois(2:5, lambda))
1-ppois(10, 5*lambda)
lambda2<-lambda*5



#El intervalo de confianza al 95% de confianza nos da unos valores entre [0.7089066 - 0.8510934]
#por lo que podremos decir que el valor medio de clientes que acceden por cola unica esta
#dentro del intervalo. 
t.test(cesta$x, conf.level = .95)


#Los datos que tenemos de la competencia son n=500 media=0.69 y sd=0.96 y nuestros datos
#son n=600 media=0.78 y sd=0.96.

#Para hallar la diferencia de medias del ultimo apartado necesitaremos los siguientes
#paquetes
library("dplyr")
library("ggpubr")
library("PairedData")

#He generado 500 numeros aleatorios mediante la distribucion normal con una semilla(77)
#para crear los 500 registros de la competencia
set.seed(77)
comp<-rnorm(500, mean = 0.69, sd = 0.96)
comp<-as.data.frame(comp)


dif_mean <- t.test(comp, cesta$x)
dif_mean

#A la vista de los resultados obtenidos no podemos asegurar que la diferencia de medias
#sea distinta de cero, incluso podemos afirmar lo mismo guiandonos por el p-valor, ya
#que este nos da un valor muy superior al nivel de significacion (0.05).