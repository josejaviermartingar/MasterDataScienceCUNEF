starts_with() #selecciona los que empiezan con las letras que incluyamos en ()
rename() #renombra las columnas
select() #para ordenar y anhadiendo al final everything () ordena primero las que seleccionamos
#y despues el resto
mutate() #para crear nuevas variables y ademas podemos añadir operaciones con las var
             ###ejemplo####
vuelos<-mutate(vuelos, gain = arr_delay - dep_delay, speed = (distance/air_time) * 60)
ends_with()#selecciona los que terminan con lo que incluyamos en ()
(vuelos$air_time - (vuelos$arr_time - vuelos$dep_time))
10%%2
1650%%100
10%%4
# %% devuelve el resto de las divisiones
