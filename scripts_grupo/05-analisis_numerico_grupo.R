#instalo los paquetes necesarios
library(tidyverse)
#me traigo los datos
attach(datos_limpios)

####################################################
# Medidas de posicion y desvio (respecto a la ley) #
####################################################

mean(mng) #promedio
median(mng) #mediana

sd(mng)
IQR(mng)

###################################################
# Medidas de posicion y desvio (respecto a GIRAI) #
###################################################

mean(GIRAI) #promedio
median(GIRAI) #mediana

sd(GIRAI)
var(GIRAI)

######################
# correlacion lineal #
######################

cor(mng,GIRAI)