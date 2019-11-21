install.packages("jsonlite")
library(jsonlite)

install.packages("curl")
library(curl)

#Esto da error
paradas_metro <- "https://idealista.carto.com:443/api/v2/sql?q=select ID, NAME, LINE, PLACE, LAT, LNG from public.paradas_metro_madrid"
paradas_metro <- fromJSON(paradas_metro)

#Ahora si l carga
q <- curl_escape("select ID, NAME, LINE, PLACE, LAT, LNG from public.paradas_metro_madrid")
uri_paradas_metro <- paste("https://idealista.carto.com/api/v2/sql?q=",q, sep = "")
paradas_metro <- fromJSON(uri_paradas_metro)

paradas_metro <- paradas_metro[["rows"]]

