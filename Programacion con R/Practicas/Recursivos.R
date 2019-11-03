


# Recursive programming
# 1. ###-------------------------------------------------------------------------
# 

#  FACTORIAL : recursive function para calcular numeros factoriales

fact <- function(n){
  if (n<=1) return (1)
  else return (n*fact(n-1))
}
# checking for some examples
fact(5)
# of with another variable
n<-8
print(fact_recur(n))

# ITERATIVE code for factorial:

fact_iter <- function(n){
  total <- 1
  for (num in n:1){
    total <- total * num
  }
  return(total)
}

# Checking 
print(fact_iter(5))
print(fact_iter(n))


### 2. ###-------------------------------------------------------------------------

## Fibonacci double recursion, no efficient, exponential complexity
fib<-function (n){
  if ((n==0)|(n==1)) return(n)
  else return(fib(n-1)+fib(n-2))
}
print(fib(5))
# bur 36 take its time: 
print(fib(36))

# esc Escape from the long executions
# computing times
t1<-Sys.time()
print(fib(25))
t2<-Sys.time()
print(t2-t1)


operaciones<- 2^50
#  11239000000000000000 OPERATIONS, 


### 3. Linear complexity ##-------------------------------------------------------------------------
# Iterative version of Fibonacci:
fib_iter<-function(n){
  f1<-0;
  f2<-1;
  aux<-f1+f2
  while (n>1){f1<-f2;f2<-aux;aux<-f1+f2;n<-n-1}
  return(f2)
}

# quickly
t1<-Sys.time()
fib_iter(80)
t2<-Sys.time()
print(t2-t1)
 

# linear Complexity also with simple recursion

fib_final<- function(n, f1=0, f2=1){
  if (n==0) return(f1)
    
  else if (n==1) return(f2)
   return(fib_final(n-1,f2, f1+f2))
  
}
# examples
fib_final(5,0,1)
# 
fib_final(187,0,1) # por ejemplo.
# Computing times and compare:
t1<-Sys.time()
fib(32)
t2<-Sys.time()
fib_iter(32)
t3<-Sys.time()
fib_final(32,0,1)
t4<-Sys.time()

t2-t1
t3-t2
t4-t3

# the end.