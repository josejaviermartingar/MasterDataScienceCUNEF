library(ggplot2)
#mpg es una base de datos de modelos de coche entre 1999 y 2008 y nos facilita datos sobre 
#consumo de combustible
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#facetas son otra capa que se puede añadir usando la base de datos, para decir como queremos que nos
#muestre los datos en el grafico.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "darkblue") +
               facet_wrap(~ class, nrow = 2)


#anhade la escala cosa que face_wrap no hace y detecta la falta de elementos (coches) que
#que tengan esas caracteristicas
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv~cyl)

#muestra los valores (var~.) por filas
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv~.)

#(.~var) lo muestra por columnas
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(.~cyl)

#con smooth method puede ser de varias clases loess lm auto glm gam
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), formula = y ~ x, method = "gam")


#por clases 
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), formula = y ~ x, method = "loess")
