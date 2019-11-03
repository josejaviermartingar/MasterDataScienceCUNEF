#Crear un proyecto de RStudio que contenga un fichero de R distinto para cada apartado 
#respetando el nombre de cada uno:
  
#Usando el dataset economics y economics_wide (mirad ambos) de ggplot2 crea:

library(ggplot2)
library(ggthemes)

economics <- ggplot2::economics

faithfuld <- ggplot2::faithfuld

#1) en un fichero llamado apartado1.R una gráfica con una línea temporal 
#representando la variable "unemploy" (tiempo = eje X).

ggplot(economics, aes(x = date, y = unemploy )) + 
  geom_line(color = "red") + 
  ggtitle("US Unemploy 1967 - 2015") + 
  theme_solarized()
  
