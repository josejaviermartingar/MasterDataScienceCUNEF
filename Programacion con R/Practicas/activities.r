library(readr)
library(dplyr)
library(tidyverse)

activities <- read_csv("C:/Users/Equipo/Desktop/CUNEF/Programacion con R/Practicas/activities.csv")
activities$GPS<-as.character(activities$GPS)
##conteo de NAs
NAs<-sum(is.na(activities$GPS))
