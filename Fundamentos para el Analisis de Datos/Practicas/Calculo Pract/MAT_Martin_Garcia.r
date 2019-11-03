g = mosaicCalc::D(3*x^2-2*x+4 ~ x)
g(0)
#Para x=0 el valor es -2

plotFun(g, x.lim = range(0,10))
#La respuesta es "A positive sloping line"

d = mosaicCalc::D(5*exp(.2*x)~x)
d(0)
#Para que x=0 el valor debe ser 1

plotFun(d, x.lim = range(0,10))
d1 = mosaicCalc::symbolicAntiD(5 * (exp(0.2 * x) * 0.2)~x)




#Ejercicio 4
f = mosaicCalc::D(fred^2 ~ginger)
#la respuesta es "0 everywhere"

#Ejercicio 5
j = mosaicCalc::D(cos(2*t)~t) #Primera derivada
j

dj = mosaicCalc::D(j(t) ~t) #Segunda derivada
dj

djj = mosaicCalc::D(dj(t)~t ) #Tercera derivada
djj

#La respuesta es 8sin(2*t)

djjj = mosaicCalc::D(djj(t)~t ) #Cuarta derivada
djjj

#La respuesta es 16cos(2*t)

#Ejercicio 6
h = mosaicCalc::D(cos(2*t^2)~t) #Primera derivada
h

dh = mosaicCalc::D(h(t) ~t) #Segunda derivada
dh

dhh = mosaicCalc::D(dh(t)~t ) #Tercera derivada
dhh

#La respuesta es 8sin(2*t)

dhhh = mosaicCalc::D(dhh(t)~t ) #Cuarta derivada
dhhh


plotFun(dhhh, x.lim = range(0,5)) 

#La respuesta es "A cosine whose amplitude increases and whose
#period decreases as t gets bigger.
#In thise complicated expression appear sin and cos functions

#Ejercicio 7

x1 = mosaicCalc::D(x*sin(y)~ x)
x1

x2 = mosaicCalc::D(x*sin(y)~ x+x)
x2

y1 = mosaicCalc::D(x*sin(y)~ y)
y1

y2 = mosaicCalc::D(x*sin(y)~ y+y)
y2

#Parciales mixtas

xy = mosaicCalc::D(x*sin(y)~ x+y)
xy

yx = mosaicCalc::D(x*sin(y)~ y+x)
yx

#####Respuestas

#False

#False

#True

