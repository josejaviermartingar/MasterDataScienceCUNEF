#2) en un fichero llamado apartado2.R una gráfica con todas las variables con líneas de
#distintos colores a lo largo del tiempo (tiempo = eje X)




ggplot(economics_long, aes(x = date)) + 
  geom_line(aes(y = value01, color = variable)) +
  theme_economist()
  
  
  
#Al principio para introducir diferentes variables como en este caso necesite 
#usar geom_line tantas veces como variables tiene el grafico de lineas. Despues ya he
#usado la variable value01 con los datos [0-1] mucho mas "vistosos" a la hora de representar
#la grafica.


