#definimos los valores
a<-0
b<-0
h<-0
#definimos la funcion que generara los triplet de Pitagoras 
terna <-function (a, b, h){
  if (a*a+b*b==h*h) {print('Eureka es un triplet de Pitagoras')}
  else {print(' Esta vez no ha habido suerte, no es un triplet de Pitagoras')}
}
#definimos la serie de Fibonacci (20 primeros numeros)
fibon<-c(0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1579,2584,4163)
v1<-610; v2<-610+377; v3<-v2+v1; v4<-v2+v3; #definomos la 4-secuencia
a<- v1*v4
b<-2*v2*v3
h<-v2*v2+v3*v3
# Comprobamos el resultado
terna(a,b,h)


#####Esta funcion genera numeros de la serie de Fibonacci 
#########"fib(0,1,1,2,3,5,8,13,21,34,55,89)
fib <- function(n) {
  a = 0
  b = 1
  for (i in 1:n) {
    tmp = b
    b = a
    a = a + tmp
  }
  return(a)
}
print(fib(6))

