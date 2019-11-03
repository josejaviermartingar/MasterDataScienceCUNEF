library(ISLR)
library(boot)
library(gam)

bikes <- read.csv("C:/Users/Equipo/Desktop/CUNEF/Prediccion/Datos/day.csv")

#Lo primero que he hecho ha sido eliminar las columnas que no voy a usar, la razon de no
#usar "Casual" y "Registered" es porque "Count" es la suma de ambas.

names(bikes)
bikes <- select(bikes, -dteday, -instant, -casual, -registered)


#Fijo una semilla 

set.seed(88)

#Y calculo los coeficientes de error y posteriormente hago la raiz cuadrada de los coeficientes
#de error ya que dicho valor aparece al cuadrado. Se ha usado al relacion de variables Count y Temperatura.

cv.errors <- data.frame(degree = seq(1,5,1), 
                        error = rep(NA, 5))

for (i in 1:5) {  
  glm.fit <- glm(cnt~poly(temp, i), data = bikes)
  cv.errors$error[i] <- cv.glm(bikes, glm.fit, K = 10)$delta[1]
  
}

sqrt(cv.errors$error)

#En este caso me quedo con el polinomio de grado tres ya que es el que menor termino de
#error me da.

#En este caso me quedo con el polinomio de grado cinco ya que es el que menor termino de
#error me da.

#Y calculo los coeficientes de error y posteriormente hago la raiz cuadrada de los coeficientes
#de error ya que dicho valor aparece al cuadrado. Se ha usado al relacion de variables Count y Humedad.

cv.errors1 <- data.frame(degree = seq(1,5,1), 
                         error = rep(NA, 5))

for (i in 1:5) {  
  glm.fit <- glm(cnt~poly(hum, i), data = bikes)
  cv.errors1$error[i] <- cv.glm(bikes, glm.fit, K = 10)$delta[1]
  
}

sqrt(cv.errors1$error)

#En este caso me quedo con el polinomio de grado tres ya que es el que menor termino de
#error me da.

#Y calculo los coeficientes de error y posteriormente hago la raiz cuadrada de los coeficientes
#de error ya que dicho valor aparece al cuadrado. Se ha usado al relacion de variables Count y Velocidad del viento.

cv.errors2 <- data.frame(degree = seq(1,5,1), 
                         error = rep(NA, 5))

for (i in 1:5) {  
  glm.fit <- glm(cnt~poly(windspeed, i), data = bikes)
  cv.errors2$error[i] <- cv.glm(bikes, glm.fit, K = 10)$delta[1]
  
}

sqrt(cv.errors2$error)

#En esta caso me quedo con el tercer grado del polinomio porque es el que menor error me da.

tempLims <- range(temp)

plot(temp, cnt, xlim = tempLims, col = "gray")
title("Smoothing Spline")
fit1 <- smooth.spline(temp, cnt, df = 16)
fit2 <- smooth.spline(temp, cnt, cv = TRUE)

fit2$df

#Mediante Cross Validation ha escogido 9.103704 grados de libertad optimos para la
#variable temperatura como explicativa de cnt.

windspeedLims <- range(windspeed) #Calculo los limites de la variable 

plot(windspeed, cnt, xlim = windspeedLims, col = "gray")
title("Smoothing Spline")
fit3 <- smooth.spline(windspeed, cnt, df = 16)
fit4 <- smooth.spline(windspeed, cnt, cv = TRUE)

fit4$df

#Mediante Cross Validation ha escogido 6.007664 grados de libertad optimos para la
#variable windspeed como explicativa de cnt.

HumLims <- range(hum) #Calculo los limites de la variable 

plot(hum, cnt, xlim = HumLims, col = "gray")
title("Smoothing Spline")
fit5 <- smooth.spline(hum, cnt, df = 16)
fit6 <- smooth.spline(hum, cnt, cv = TRUE)

fit6$df

#Mediante Cross Validation ha escogido 4.548876 grados de libertad optimos para la
#variable humedad como explicativa de cnt.

#Una vez hecho lo anterior he creado un modelo con las variables explicativas que mas
#me convencian y sus correspondientes grados de libertad optimos, que fueron calculados 
#anteriormente.

gam1 <- gam(cnt~s(temp, 9.103704) + s(windspeed, 6.007664) + s(hum, 4.548876), data = bikes)
gam1

#Ahora voy a hacer el modelo spline para polinomios.

glm.fit <- glm(cnt ~ poly(temp, 3) + poly(windspeed, 3) + poly(hum, 3) , data = bikes)
glm.fit

####Hacer cross validation del modelo gam1

cross_val <- cv.glm(bikes, gam1, K = 10)
sqrt(cross_val$delta)

#Con la formula anterior he podido comprobar los valores de delta que corresponden 
#con el error estimado de la prediccion (1240.548) y el valor ajustado del estimador por
#cross validation (1238.970).