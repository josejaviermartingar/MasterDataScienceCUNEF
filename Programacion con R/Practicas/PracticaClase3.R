babymales<-("ontario_top_baby_names_male_1917-2016_english")
head(babymales, 20)
tail(babymales)
str(babymales)
max(babymales$Year)  #año mas reciente
lastyear<-babymales[babymales$Year==max(babymales$Year),] #selecciona solo los del ultimo año
nrow(lastyear) #numero de filas y/o observaciones de la variable
sum(lastyear$Frequency) #numero de niños que se han registrado
año2010<-subset(babymales, babymales$Year==2010) #obtenemos el subconjunto del año 2010
lastyear<-lastyear[,c("Name", "Frequency")] #seleccionamos solo las columnas nombre y frecuencia y eliminamos el año
lastyear<-lastyear[order(lastyear$Frequency, decreasing = TRUE),] #ordena los nombres de manera decreciente
write.csv(lastyear, file = "2016_male_popular_names.csv", row.names=FALSE)
name.in<-readline(prompt = "Que nombre quieres :")#obtenemos el nombre del usuario que queremos
name.in<-"Zorawar"
freq.year<-babymales[babymales$Name == toupper(name.in), c("Year", "Frequency")]
freq.year<-freq.year[order(freq.year$Year),]
plot(freq.year)
plot.title<-paste("Nombres ninho", toupper(name.in))
g<-plot(freq.year, main=plot.title, type="s")