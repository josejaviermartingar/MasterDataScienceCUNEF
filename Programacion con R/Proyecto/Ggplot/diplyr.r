#analisis de los vuelos de 2013 de la ciudad de NY
nycflights13::flights
vuelos<-nycflights13::flights
#filtramos los vuelos por los que tuvieron lugar el 1 de enero hay que usar el ==
filter(vuelos, vuelos$month == 1, vuelos$day == 1)
x<-filter(vuelos, month ==1, day==1)
y<-filter(vuelos, month == 12, day == 25)


#operadores logicos estos dos hacen lo mismo
filter(vuelos, month == 11 | month == 12)
nov_dec<-filter(vuelos, month %in% c(11, 12))

#filtra los vuelos con retraso menores a 120 minutos de retraso
filter(vuelos, arr_delay <= 120, dep_delay <= 120)
filter(vuelos, !(arr_delay > 120 | dep_delay > 120))

#funcion arrange sirve para organizar 
arrange(vuelos, year, month, day)
arrange(vuelos, desc(arr_delay))
#select para seleccionar columnas 
select(vuelos, year:day)

#######Ejercicios pagina 14#######
dosomashoras<-filter(vuelos, arr_delay >= 120)
aHou<-filter(vuelos, dest == "HOU"|dest == "IAH")
operators<-filter(vuelos, carrier == "UA" | carrier =="AA" | carrier == "DL")
verano<-filter(vuelos, month == 7 | month == 8 | month == 9)
llegatarde<-filter(vuelos, arr_delay>120, dep_delay == 0)
retraso1h<-filter(vuelos, dep_delay >= 60, air_time == 30)
medianoche<-filter(vuelos, hour>= 0 & hour<= 6)

#missing#
lost<-sum(is.na(vuelos$dep_time))

##ejercicio 4
NA^0
NA|TRUE    ##UNION
NA&FALSE   ##INTERSECCION

###ejercicos de arrange pagina 17####
orden1<-arrange(vuelos, desc(dep_delay))

volaron_mas<-filter(vuelos, distance <= 5000, distance >= 2500)
volaron_menos<-filter(vuelos, distance <= 2500)


