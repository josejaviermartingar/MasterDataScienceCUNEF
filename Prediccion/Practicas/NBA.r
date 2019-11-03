
nba<-read.csv("C:/Users/Equipo/Desktop/CUNEF/Prediccion/Datos/nba.csv")
#Lo primero he cargado las librerias que iba a necesitar

library(MASS)
library(leaps)
library(dplyr)
library(tidyverse)
library(fBasics)
library(ISLR)
library(car)
library(gvlma)

#La base de datos contiene un total de 485 registros agrupados en 28 variables.
#Se va a tratar de dar explicacion a la relacion existente entre el salario de 
#cada jugador con sus estadisticas individuales y ase obtener un modelo de prediccion 
#tomando como variable dependiente el salario y como variables independientes dichas
#estadisticas. Sabemos que existen dos NAs

names(nba)

nba<-na.omit(nba)

#Regresion con todas las variables.

Model0 <- lm(Salary ~ Age + AST. + BLK. + BPM + DBPM + DRB. + DWS + FTr + G + MP + 
               NBA_DraftNumber + OBPM + ORB. + OWS + PER + Tm + STL. + TOV. + TRB. + TS. + USG. + 
               VORP + WS + WS.48 + X3PAr, data = nba)


#Esta regresión unicamente la he hecho para comprobar como explican las variables independientes
#a la variable salario y a la vista de los resultados obtenidos voy a descartar dicho modelo.

#Steep forward, esto lo he hecho descartando variables las cuales he considerado que no eran
#importantes.

regfit.fwd<-regsubsets(Salary~.-Player -NBA_Country -Tm, nba ,method ="forward")

resumen<-summary (regfit.fwd)

#Aqui he hecho un analisis del BIC del Steep forward y de los 8 que me han quedado he elegido 
#los tres que menor BIC tienen.

resumen$bic

#En este momento lo que hice fue hacer otra regresion con las variables que estaban presentes
#en los tres modelos con menor BIC.

modelo <-lm(formula = Salary ~ Age + NBA_DraftNumber + G + MP + USG.+ DBPM+ STL. + WS, data = nba)

summary(modelo)

#Este nuevo modelo lineal solo contiene las variables comunes a los 3 modelos que seleccione.
#Con este Steep forward de las variables que son comunes a los tres modelos he decidido quedarme
#solo con la variable edad, numero del draft y G y la variable WS, ya que son las tres que mas se repiten.

regfit.fwd2=regsubsets(Salary~.-Player -NBA_Country -ORB. -DRB.-Tm -PER -TS. -X3PAr -FTr -AST. -STL. -BLK. -TOV. -USG. -OWS -DWS -WS.48 -OBPM -DBPM -BPM -VORP, nba ,method ="forward")

modelo3<-lm(formula = Salary ~ Age + NBA_DraftNumber + G + WS, data = nba)
summary(modelo3)

qqPlot(modelo3, labels = row.names(nba),id.method="identify", simulate = T, main = "Q-Q Plot")

residmodel3<-resid(modelo3)
jbTest(residmodel3)

#No puedo asegurar que los residuos se distribuyan de una manera normal por tanto, no puedo
#aceptar la hipotesis nula, ademas este p-valor es menor que el nivel de significacion por
#tanto rechazo la hipotesis de normalidad sobre la distribucion de dichos residuos.

shapiro.test(residmodel3)

#Segun el Test de Shapiro - Wilk puedo asegurar que la muestra no sigue una distribucion 
#normal.

ncvTest(modelo3)
spreadLevelPlot(modelo3)

#Analizando el test de Breusch Pagan y el grafico puedo concluir diciendo que este modelo
#presenta un problema de heterocedasticidad.

gvmodelo3<-gvlma(modelo3)
summary(gvmodelo3)

#He utilizado diferentes formas de ver la presencia de heterocedasticidad y al ver que existe
#me surge la duda de si debo seguir estimando el modelo o cambiar de variables ya que segun el 
#Steep forward dichas variables eran las mas adecuadas.

vif(modelo3)
sqrt(vif(modelo3)) > 2

#Al menos no existe problema de multicolinealidad, cosa que he podido comprobar a traves del 
#Factor de Inflacion de la Varianza

#En este punto he hecho K-Fold Cross Validation manteniendo el modelo original (Modelo3) y
#otro modelo alternativo sin la variable "Age".

library(boot)
glm.fit1=glm(Salary ~ Age + G+ NBA_DraftNumber + WS, data = nba,family = gaussian())
cv.err =cv.glm(nba,glm.fit1,K=5)
cv.err$delta

glm.fit2=glm(Salary~  G + NBA_DraftNumber + WS, data = nba,family = gaussian())
cv.err2 =cv.glm(nba,glm.fit2,K=5)
cv.err2$delta

#A la vista de los resultados puedo decir que las variables que mejor predicen el salario que
#deben percibir los jugadores son: la edad (Age), la ronda en la que fueron seleccionados en el draft, 
#G la cual creo que es el numero de partidos
#jugados y la responsabilidad de victorias (WS). A traves de K-Fold Validation hice una regresion
#de dos modelos alternativos inicialmente uno con las 4 variables que he usado para el "Modelo3" y
#otro eliminando la variable edad, una vez calculada la delta (la cual he considerado que es un 
#termino de error) he decido quedarme con el modelo de 4 variables en vez de quedarme con el de 2
#ya que para el de 4 variables el coeficiente de delta es menor.

#Win Shares es una estadistica que se utiliza para subsanar la falta de datos sobre las  
#perdidas de balon y otras metricas que antes de la década de los 70 no se median.

#Para ello:  

#Calcular los puntos producidos (canastas, asistencias, perdidas de balon forzadas, etc).

#Calcular la cantidad de posesiones en las que se vio el jugador involucrado.

#Calcular la ofensiva marginal del jugador: Aqui entran en juego muchos 
#factores,  se toma la ofensiva del jugador y sus posesiones combinándose con el 
#promedio de posesiones de la liga.

#Calcular la ofensiva marginal por victoria: Se introducen factores como: 
#el ritmo de juego promedio, ritmo de juego del equipo y anotacion global de la liga.

#Para obtener Defensive Win Shares (DWS) estos son los pilares:
  
#Calcular el rating defensivo de jugador.

#Calcular el aporte marginal defensivo del jugador: Una vez mas, en defensa entran muchos 
#factores en la ecuacion pero para este cálculo nos centramos en puntos como: minutos jugados, 
#ritmo de juego, eficiencia ofensiva de la liga y cantidad de posesiones defensivas del equipo.

#Calcular defensiva marginal del jugador: Mismo calculo que en ofensiva, pero para defensiva.
#Se dividen los ultimos dos valores y asi obtenemos el Defensive WS (DWS).

#Al ser tanto OWS y DWS parte de WS solo he tomado la variable Ws como conjunto de ambas 
#y no he tomado por ello las variables OWS y DWS por ser consideradas marginales de WS.

#Fuente: https://rompimientodefensivo.com/2016/02/16/guia-de-estadisticas-avanzadas-nba-iii/
