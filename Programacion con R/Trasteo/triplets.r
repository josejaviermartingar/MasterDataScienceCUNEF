fibon<-c(0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1579,2584,4163)
terna <-function (a, b, h){
  if (a*a+b*b==h*h) {print('Yes, it is a pythagoras triplet')}
  else {print(' No, this is not a p.t.')}
}
n<-1
v1<-n; v2<-1+n; v3<-2+n; v4<-2*v3; #definomos la 4-secuencia
a<- v1*v4
b<-2*v2*v3
h<-v2*v2+v3*v3
# Comprobamos el resultado
terna(a,b,h)




n=3  [(3,4,5), (5,12,13), (16,30,34)]

1-1-2-3, la segunda de la secuencia 1-2-3-5 y la tercera de 2-3-5-8. 