cesta<-LA.CESTA
mean(cesta$x)
lambda<-mean(cesta$x)
dpois(0, lambda)
sum(dpois(2:5, lambda))
1-ppois(10, 5*lambda) #IGUAL A LA DE ABAJO
ppois(10, lower.tail = FALSE, lambda2)
lambda2<-lambda*5
fit <- fitdistr(cesta$x, densfun="normal") 
fit
curve(dnorm(x, fit$estimate[1], fit$estimate[2]), col="red", lwd=2, add=T)
hist(cesta$x, pch=20, breaks=25, prob=TRUE, main="HISTOGRAMA")
fitMME <- fitdistr(cesta$x, "normal", method="mme")
fitMME
curve(dnorm(x, fitMME$estimate[1], fitMME$estimate[2]), col="blue", lwd=2, add=T)
fitMGE <-fitdistr(cesta$x, "normal", method="mge")
fitMGE
t.test(cesta$x, conf.level = .95)
