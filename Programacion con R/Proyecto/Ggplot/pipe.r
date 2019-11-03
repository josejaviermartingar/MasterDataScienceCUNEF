count(vuelos) #nos muestra el valor de la muestra
group_by() #agrupa variables que queramos agrupar
# %>% #enlaza formulas 
retrasos <- vuelos %>%
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)) %>%
      filter(count > 20, dest != "HNL")

#replicar y probar el codigo de la presentacion
#usar los cuantiles para ver datos atipicos y poder eliminarlos