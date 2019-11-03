#en el apartado6.R solapa el jittering y la estimación de densidad

ggplot(faithful, aes(x = eruptions, y = waiting), density = 1) + 
  geom_point(position = position_jitter(width = 0.5)) +
  geom_density2d() +
  theme_replace()

#He usado tambien el comando de density y se puede ver con mas claridad la dispersion
#de los datos.