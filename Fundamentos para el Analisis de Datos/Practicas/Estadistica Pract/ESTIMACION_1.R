#####################  INFERENCIA PARAMETRICA #######################

###########################  ESTIMACION  ###########################


library(MASS)



set.seed(1)   #No fijar semilla y comentar los resultados

x<- rnorm(250, mean=1, sd=0.45)     


#Ajuste m?xima verosimilitud de distribuciones univariables
fit <- fitdistr(x, densfun="normal") 
fit

hist(x, pch=20, breaks=25, prob=TRUE, main="HISTOGRAMA")
curve(dnorm(x, fit$estimate[1], fit$estimate[2]), col="red", lwd=2, add=T)



#Estimaci?n por el m?todo de los momentos 
fitMME <- fitdistr(x, "normal", method="mme")
fitMME
curve(dnorm(x, fitMME$estimate[1], fitMME$estimate[2]), col="blue", lwd=2, add=T)



#Estimaci?n m?xima bondad del ajuste
#Diversos estudios destacan la mejor estimaci?n param?trica 

fitMGE <-fitdistr(x, "normal", method="mge")
fitMGE



