
################### EJERCICIO CLIMA #####################################

library("markovchain")

estados<- c("soleado", "nublado", "lluvioso")
byRow <- TRUE
mt <- matrix(data = c(0.60, 0.3, 0.1,0.4, 0.4, 0.2,0.25, 0.45, 0.30), byrow = byRow,
             nrow = 3,dimnames = list(estados, estados))
cmclima <- new("markovchain", states = estados, byrow = byRow,
               transitionMatrix = mt, name = "clima")
cmclima

plot(cmclima)

sinicial <- c(0, 1, 0)
sinicial <- c(1, 0, 0)
dosdespues <- sinicial * (cmclima * cmclima)
sietedespues <- sinicial * (cmclima ^ 7)
dosdespues
sietedespues
###es un proceso evolutivo, a l/p se pueden estabilizar cuando podamos determinar la solucion
#(M1,M2,M3) = (M1 M2 M3)*P

#Estado estacionario
steadyStates(cmclima)

#Simulacion aleatoria del estado del clima durante 1000 d?as (comprobar que >n... <DS)
simulacionclima <- rmarkovchain(n = 1000, object = cmclima, t0 = "nublado")

#simulacion del estado del tiempo proxima semana
simulacionclima[1:7]
simulacionclima

#Estimador maxima verosimilitud (mle=maximum likelihood estimator)
emvclima <- markovchainFit(data = simulacionclima, method = "mle", name = "EMVclima")                                 
#markovchainFit, devuelve una CM de una secuencia dada.

emvclima$estimate

emvclima$standardError

