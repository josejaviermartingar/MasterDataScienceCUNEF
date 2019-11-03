calificaciones <- read.csv("C:/Users/Equipo/Desktop/CUNEF/Programacion con R/Proyecto/Practica2/calificaciones.csv", 
                           sep = ";", dec = ",")
names(calificaciones) = c("Alumno", "Parcial1a", "Parcial1b", "Parcial2a", "MediaParc","NotaLabs", "Asistencia", "ExamFinal", "NotaFinal", "Calificacion")
alumnos_total<-length(calificaciones$NOMBRE.ALUMNO)
#revisar a partir de aqui
calificaciones$Ex..JUNIO.12P

mean(calificaciones$Ex..JUNIO.12P, na.rm = TRUE)
mean<-4.728571

aprobadosasistbaja<-calificaciones[,c("NOMBRE.ALUMNO", "Asistencia..1P", "Ex..JUNIO.12P")]
aprobadosasistbaja<-subset(aprobadosasistbaja, aprobadosasistbaja$Asistencia..1P<0.5&aprobadosasistbaja$Ex..JUNIO.12P>=5)
print(aprobadosasistbaja)

for(i in 1:length(calificaciones$NOMBRE.ALUMNO)){
  if(is.na(calificaciones$CALIFICACION[i]))
    {
    if(calificaciones$Nota_FINAL[i]>5 & calificaciones$Nota_FINAL[i]<=6.99)
    {
      calificaciones$CALIFICACION[i]<-"Aprobado"
  } else
    if(calificaciones$Nota_FINAL[i]>=7 & calificaciones$Nota_FINAL[i]<=8.99){
      calificaciones$CALIFICACION[i]<-"Notable"
    }
    if(calificaciones$Nota_FINAL[i]>=9 & calificaciones$Nota_FINAL[i]<=10){
      calificaciones$CALIFICACION[i]<-"Sobresaliente"
    }
    if(calificaciones$Nota_FINAL[i]<5){
      calificaciones$CALIFICACION[i]<-"Suspenso"
  }
}
}


write.csv(calificaciones, file =  "CalificacionesFinal.csv", row.names = FALSE)
