# EJERCICIO  1
#1. INTRODUCIR DATOS Y CREAR OBJETOS CON METADATOS
edad <- c(18,19,NA,18,24,17,22,15,22,25,NA,16,23,16)
sexo <- c(0,1,0,0,1,0,0,1,1,0,0,1,0,1)
estudios <- c(1,2,0,1,3,2,3,1,2,3,1,2,3,0)
#factores para variables categoricas se a?aden tantos niveles como variables categoricas haya
sexo <- factor(sexo, levels = c(0,1),
            labels = c("Hombre","Mujer"))
estudios <- factor(estudios, levels = c(0,1,2,3),
                labels = c("Ninguno","Primarios",
                         "Secundarios","Superiores"))
#2. ESTUDIAR LOS DATOS: TABLA DE FRECUENCIAS UNIDIMENSIONALES
table(edad)
prop.table(table(edad))
table(edad,useNA = "ifany")

#3.ESTUDIAR LOS DATOS:  TABLA DE REFERENCIAS CRUZADAS
table(estudios,sexo)
prop.table(table(estudios,sexo))
prop.table(table(estudios,sexo),1)
prop.table(table(estudios,sexo),2)

#4. ESTUDIAR LOS DATOS: SIMPLIFICACAR USANDO OBJETOS DE ALMACENAMIENTO
#Este apartado hace lo mismo que el apartado anterior pero en menos tiempo x3
tabla <- table(estudios,sexo)
prop.table(t)
prop.table(t,1)
prop.table(t,2)

#5. AGRUPAR DATOS PARA VARIABLES CONTINUAS
range(edad,na.rm = TRUE)
nc <- nclass.Sturges(edad)  # N. de intervalos+1 (limites)
nc
lc <- seq(15,25,length = nc)  # Limites de los intervalos-clases
lc


#6. CONSTRUIR INTERVALOS CON cut():

?cut

intervalosEdad <- cut(edad,breaks = seq(15,25,length = nc),include.lowest = TRUE)
intervalosEdad # Se muestran los intervalos de edad, uno correspondiente a cada edad observada

table(intervalosEdad)
tintervalos <- table(intervalosEdad)


#7. ESTADISTICOS DESCRIPTIVOS
mean(edad, na.rm = TRUE)
sd(edad, na.rm = TRUE)
# ya trae true por defecto no como lo anterior que hicimos
summary(edad)
summary(estudios)
summary(sexo)
misDatos = data.frame(edad,estudios,sexo)
summary(misDatos)

#8. DATOS AGREGADOS POR GRUPOS
aggregate(edad,by = list(sexo),mean)

aggregate(edad,by = list(sexo),mean,na.rm = TRUE)



#9. REPRESENTACIONES GRAFICAS
#help(pie)
pie(table(estudios))
#help(barplot)
barplot(table(sexo))
#help(hist)
hist(edad)
#help(boxplot)
boxplot(edad~sexo)

