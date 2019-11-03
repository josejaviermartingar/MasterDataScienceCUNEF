mi_nota<-function(a=10, p, e){
  nota <- a*0.1 + p*0.4 + e*0.5
  if(e<5) {print("Suspenso")
    return(min(4, nota))}
  else{print("Aprobado")
    return(nota)}
}
mi_nota(3,5,5)
mi_nota(6, 2)
mi_nota(p=1, e=2)
10*.1+7*.4+2*.5

#!= significa distinto a

nombres<-c("Marta", "Maria", "Javier", "Alvaro", "Beltran")
nota_calculada<-c(4.5, 6, 7.3, 2.5, 5.6)
nota_definitiva<-c(4, 4, 7.3, 2.5, 4)
notas_alumnos<-data.frame(nombres, nota_calculada, nota_definitiva)

no_superan<-function(notas_alumnos){
  p<-0
  nom<-rep(FALSE,nrow(notas_alumnos))
  for(i in 1: length(notas_alumnos$nombres)){
    if(nota_calculada[i]!= nota_definitiva[i]|nota_definitiva[i]<5){ 
      p=p+1
    nom[i]<-TRUE}
  }
  print(p)
  return(as.character(notas_alumnos$nombres[nom]))
}

no_superan(notas_alumnos)

 
