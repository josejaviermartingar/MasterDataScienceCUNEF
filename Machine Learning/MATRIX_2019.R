
##################FUNDAMENTOS DE ALGEBRA MATRICIAL##################



#A, B, C, D,... ser?n nombres de  matrices
#x, y, z, .... ser?n nombres de vectores (fila/columna)

#Vectores

x<-c(1,2,3,4)

length(x) #Devuelve la dimensi?n (N? elementos)

x  #Devuelve un vector fila




#Matrices
A<-matrix(c(1,2,3,4,5,6),nrow=2,ncol=3)
B<-matrix(c(1,2,3,4,5,6),2,3,byrow=TRUE)
A
B

dim(A) #Devuelve la dimensi?n
length(A) #Devuelve el n? de elementos


#EXTRACCIONES

A[1,2]  #Devuelve el elemento de la posici?n seleccionada
B[2,2]
A[1,]  #Devuelve la primera fila 
B[,2]  #Devuelve la segunda columna



#CALCULOS

D <- A+B

c <- A-B

A*2

t(A) #Matriz traspuesta
t(B)

t(x)  #Matrix de x (dimensi?n 1*4). 

dim(t(B)) #Devuelve la dimensi?n de la traspuesta

dim(t(x))
matrix(x)  #Matrix de x (dimensi?n 4*1). 
dim(matrix(x))


# MULTIPLICACION

#Multiplica elemento por elemento  - OJO -

A*B


#Multiplicaci?n de matrices

Q<-matrix(c(1,2,3,4,5,6),2,3,byrow=T) 
W<-matrix(c(7,8,9,10,11,12),3,2,byrow=T)
Q
W

Q%*%W
W%*%Q


#Multiplicar obligatorio usar %*% aqui no las multiplica porque son de diferente
#dimension
A%*%B # ?
B%*%A # ?


#Uniendo matrices

A
E<-matrix(c(1,2,3,4,5,6),2,3,byrow=F)
E


cbind(A,E)  #Junta las columnas
rbind(A,E)  #Junta las filas

t(rbind(t(A),t(E)))
t(cbind(t(A),t(E)))


#Diagonales y trazas


H<-matrix(c(1,2,3,4,5,6,7,8,9),3,3,byrow=T)
H

diag(H)  #Devuelve la diagonal de la matriz
sum(diag(H))  #Devuelve la traza


diag(c(1,2,3))  #Matriz diagonal

diag(diag(E))   #Devuelve la matriz diagonal con los elementos de la diagonal D





#Determinantes

W<-matrix(c(1,-2,2,2,0,1,1,1,-2),3,3,byrow=T)
W
det(W)


#Inversas

#MATRIZ NO SINGULAR

K<-matrix(c(2,3,3,4), 2,2,byrow=T)
K
solve(K) #Calculo para matrices no singulares



#DIAGONALIZACION DE MATRICES

L<-matrix(c(1,4,9,1), 2,2,byrow=T)
L
eigen(L) #Proporciona autovalores y autovectores asociados





# APLICANCION EN PROCESOS ESTOCASTICOS

PE<-matrix(c(1,2,1,-1), 2,2,byrow=T)
PE
solve(PE) 



#Matriz de transici?n

PE<-matrix(c(0.5, 0.5, 0.25, 0.75), 2,2,byrow=T)
PE

a<-eigen(PE) #autovalores y autovectores asociados
a


#MATRIZ H DE LOS AUTOVECTOREs

h<-matrix(c(-0.7071068,-0.8944272,-0.7071068,0.4472136),2,2,byrow=TRUE)
h


# O tmbi?n se pueden extraer de a

autovec<-a$vectors 
h<-matrix(autovec,2,2)
h


#calculo de la inversa
h; solve(h)
hI<-matrix(c(-0.4714045,-0.942809,-0.7453560,0.745356),2,2,byrow=T)
hI




# Matrix J de autovalores

J<-matrix(c(1,0,0,0.25),2,2,byrow=T)
J
# Calculo de Pn=HJ^nH^(-1)  donde en J^n hacemos n=100

h%*%J^100%*%hI

#El proceso se estabiliza en DP=1/3  y en RV=2/3 

# Conclusi?n .........



