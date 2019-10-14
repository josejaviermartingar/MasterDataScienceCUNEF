#Funcion de Fibonacci para generar tuplas aleatorias
fibo <- function(n){
  f1 <- 0;
  f2 <- 1;
  aux <- f1 + f2
  while (n > 1) {f1 <- f2;f2 <- aux;aux <- f1 + f2;n <- n - 1}
  return(f2)
}
 
n <- 6
   i <- 1
   while (i < n) {
    v <- c(fibo(i), fibo(i + 1), fibo(i + 2), fibo(i + 3))
    a <- v[1]*v[4]
    b <- 2*v[2]*v[3]
    h <- v[2]^2 + v[3]^2
    i <- i + 1
    print(c(a,b,h))
    }
  





    
    
  