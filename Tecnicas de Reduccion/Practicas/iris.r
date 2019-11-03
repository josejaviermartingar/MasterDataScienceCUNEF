#Cargamos la base de datos IRIS para proceder al posterior analisis de sus datos.
 iris <- iris

#A la vista del significado del nombre de las variables podemos decir que la base de datos esta
#compuesta por una muestra de 150 plantas del genero Iris segmentadas por sus tres tipos de
#especie (Setosa, Versicolor, Virginica)
names(iris)

iris <- rename(iris, Longitud_sepalo = Sepal.Length, Longitud_petalo = Petal.Length, Anchura_sepalo = Sepal.Width, Anchura_petalo = Petal.Width, Especies = Species)

#El motivo de hacer un filter en este momento no es otro que poder averiguar cuantas plantas de 
#cada especie hay y a su vez poder trabar con dichas muestras por separado.
setosa <- filter(iris, iris$Especie == "setosa")
versicolor <- filter(iris, iris$Especie == "versicolor")
virginica <- filter(iris, iris$Especie == "virginica")


#Gracias a los resumenes se puede sacar en claro lo siguiente:
#La especie versicolor y la especie virginica son mayores que la especie setosa en cuanto a 
#longitud del sepalo y del petalo asi como de la anchura del petalo pero no pasa lo mismo con la
#anchura del sepalo la cual la especie setosa es mayor que las de las otras dos especies.
#Por lo que podria ser posible que ambas especies, Virginica y Versicolor estuvieran mas 
#relacionadas entre si entre ellas que con respecto a las plantas de la especie Setosa.

ggplot(data = iris) + 
    geom_boxplot(mapping = aes(x = Especies, y = Longitud_sepalo, fill = Especies))

ggplot(data = iris) + 
  geom_boxplot(mapping = aes(x = Especies, y = Anchura_sepalo, fill = Especies))

ggplot(data = iris) + 
  geom_boxplot(mapping = aes(x = Especies, y = Longitud_petalo, fill = Especies))

ggplot(data = iris) + 
  geom_boxplot(mapping = aes(x = Especies, y = Anchura_petalo, fill = Especies))

#Gracias a estos graficos podemos ver de una manera mas clara como estan distribuidos las 
#maginitudes tomadas dentro de cada especie y ademas se puede comprobar que la especie Setosa
#presenta varios datos atipicos.

sd(versicolor$Longitud_sepalo)
sd(versicolor$Anchura_sepalo)
sd(versicolor$Longitud_petalo)
sd(versicolor$Anchura_petalo)

cov(iris$Longitud_sepalo, iris$Anchura_sepalo)

cov(iris[,1:4])
cor(iris[,1:4])

scatterplotMatrix(iris[,1:4], groups=iris$Especies, legend = )
#Por tanto, vistos los resultados podemos afirmar que la especie Setosa tiene menos relacion que
#que las otras dos especies entre si, por eso a la hora de clasificarlas podriamos reducir la 
#dimension a dos grupos en vez de a tres y asi nos sera mas facil analizar dichas especies
#pertenecientes al genero Iris.