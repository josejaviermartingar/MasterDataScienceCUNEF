###########
# PRACTICA#
###########
# ###Queremos diseñar un script que puedan utilizar los
# ciudadanos que quieren buscar un nombre para su
# bebé y desean conocer algunas estadísticas sobre
# sus nombres favoritos. Los pasos a implementar
# serán los siguientes:
#   
# El script debe preguntar al usuario por el nombre
# a y almacenarlo en un objeto
# 
# A continuación se construye una tabla de
# frecuencias por año relativa a dicho nombre
# 
# Finalmente se dibuja un gráfico de frecuencias
# para dicho nombre
# 
# Con estos datos los nuevos padres tomarán su
# decisión


#############
#IMPORT DATA#
#############
# ?read.csv
babyfemales<-read.csv("/Users/jorditarrochmejon/Google Drive/DATA SCIENCE-TRADING/CUNEF/R Coding/CODE/Ontario/ontario_top_baby_names_female_1917-2016_english.csv",skip=1)
babymales<-read.csv("/Users/jorditarrochmejon/Google Drive/DATA SCIENCE-TRADING/CUNEF/R Coding/CODE/Ontario/ontario_top_baby_names_male_1917-2016_english.csv",skip=1)
getwd()

# babyfemales<-read.csv("ontario_top_baby_names_female_1917-2016_english.csv")
# babymales<-read.csv("ontario_top_baby_names_male_1917-2016_english.csv")
# getwd()

# babymales<-ontario_top_baby_names_male_1917_2016_english
# babyfemales<-ontario_top_baby_names_female_1917_2016_english
# getwd()

# babymales<-ontario_top_baby_names_male_1917_2016_english
# babyfemales<-ontario_top_baby_names_female_1917_2016_english
# getwd()

# rm(list="ontario_top_baby_names_female_1917_2016_english.csv")

################
#VISUALIZE DATA#
################
head(babyfemales)
tail(babyfemales)



####################
# DATA VERIFICATION#
####################
str(babyfemales)
dim(babyfemales)

#################
# FILTERING DATA#
#################
max(babyfemales$Year)
recent_year_females<-babyfemales[babyfemales$Year==max(babyfemales$Year),]
recent_year_males<-babymales[babymales$Year==max(babymales$Year),]

nrow(recent_year_females)
sum(recent_year_females$Frequency)


#####################
# REMOVE Year column#
#####################
recent_year_females<-recent_year_females[,c("Name","Frequency")]
recent_year_males<-recent_year_males[,c("Name","Frequency")]

head(recent_year_males,2)
head(recent_year_females,2)



############
# SORT DATA#
############
recent_year_females_sorted<-recent_year_females[order(recent_year_females$Frequency, decreasing=TRUE),]
head(as.character(recent_year_females_sorted$Name),5)

recent_year_males_sorted<-recent_year_males[order(recent_year_males$Frequency, decreasing=TRUE),]
head(as.character(recent_year_males_sorted$Name),5)


##############
# CREATE FILE#
##############
write.csv(recent_year_females_sorted,file="/Users/jorditarrochmejon/Google Drive/DATA SCIENCE-TRADING/CUNEF/R Coding/CODE/Ontario/2016_female_popular.csv",row.names=FALSE)
write.csv(recent_year_males_sorted,file="/Users/jorditarrochmejon/Google Drive/DATA SCIENCE-TRADING/CUNEF/R Coding/CODE/Ontario/2016_male_popular.csv",row.names=FALSE)


##############
# SEARCH NAME#
##############
# name_in<-readline(prompt="Female baby name?:")
name_in<-"olivia"
freq_year<-babyfemales[babyfemales$Name==toupper(name_in),c("Year","Frequency")]


##############
# ORDER DATA##
##############
freq_year<-freq_year[order(freq_year$Year),]


##############
# PLOT DATA###
##############
plot(freq_year)
plot_title<-paste("Babies named", toupper(name_in))
g<-plot(freq_year, main=plot_title, type='s')





