#3) en un fichero llamado apartado3.R haz un scatterplot de waitings (eje Y) 
#con eruptions (eje X)
faithful <- faithful

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_point(color = "slategray3") +
  theme_stata()
