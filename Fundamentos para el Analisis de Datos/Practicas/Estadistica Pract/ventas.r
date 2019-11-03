
################### EJERCICIO CLIMA #####################################

library("markovchain")

estados<- c("A", "B", "C")
situacion_inicial<-c(0.35, 0.375, 0.275)
byRow <- TRUE
mt <- matrix(data = c(0.9, 0.04, 0.06, 0.14, 0.76, 0.1, 0.1, 0.08, 0.82), byrow = byRow,
             nrow = 3,dimnames = list(estados, estados))
cmventas <- new("markovchain", states = estados, byrow = byRow,
               transitionMatrix = mt, name = "ventas")
cmventas

plot(cmventas)

sinicial <- c(700, 750, 550)
sinicial<-sinicial/2000
marzo<-sinicial*cmventas

dosdespues <- sinicial * (cmventas * cmventas)
mayo <- sinicial * (cmventas ^ 3)

###es un proceso evolutivo, a l/p se pueden estabilizar cuando podamos determinar la solucion
#(M1,M2,M3) = (M1 M2 M3)*P

#Estado estacionario
steadyStates(cmventas)

#Simulacion aleatoria del estado del clima durante 1000 d?as (comprobar que >n... <DS)
simulacionventas <- rmarkovchain(n = 1000, object = cmventas, t0 = "B")

#simulacion del estado del tiempo proxima semana
simulacionventas[1:7]
simulacionventas

#Estimador maxima verosimilitud (mle=maximum likelihood estimator)
emvclima <- markovchainFit(data = simulacionclima, method = "mle", name = "EMVclima")                                 
#markovchainFit, devuelve una CM de una secuencia dada.

emvclima$estimate

emvclima$standardError


#######mirar el ejercicio de Markov de publicidad#######

