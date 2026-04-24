#paquetes que necesitamos
library(tidyverse)
library(ggplot2)

# me traigo los datos
attach(datos_limpios)

################################################################
# Grafico de barra dist. paises por cont. (categorico nominal) #
################################################################
grafico_poblacion <- ggplot(datos_limpios, 
                            aes(y = fct_infreq(NU_region)))+
  geom_bar(fill = "red", color = "black", alpha = 0.8)+
  theme_minimal()+
  labs(
    title = "Distribucion de cantidad de paises por continente",
    x = "Cantidad de paises",
    y = "Region continental"
  )
grafico_poblacion

##############################################
# Grafico de barra niv. de marcos normativos # (categorico ordinal)
##############################################
grafico_ordinal <- ggplot(datos_limpios)+
  aes(x = sec_mng)+
  geom_bar(width = 0.75, fill = "blue", col = "black", alpha = 0.8)+
  labs(y = "Cantidad de paises", x = "Nivel de marcos normativos")+
  ggtitle("Distribución del indice de mng sobre el uso responsable de la ia")+
  theme_classic()

########################################
# Grafico de barra tipos de iniciativa # (variables de respuesta multiple)
########################################

grafico_resp_multiple <- ggplot(tabla_tipo_iniciativa_acade) + 
  # Usamos reorder para que queden ordenadas por frecuencia
  aes(x = reorder(`Tipo de Iniciativa`, `Cantidad con esta iniciativa`), y = `Cantidad con esta iniciativa`) +  
  geom_bar(stat = "identity", width = 0.75, fill = "green", col = "black") +
  labs(y = "Cantidad de iniciativas", x = "Tipo de Iniciativa") +
  ggtitle("Iniciativas Académicas") +
  coord_flip() + 
  theme_classic()

##################################################
# Grafico de barra para areas reguladas por pais # (cuantitativo discreto)
##################################################
grafico_discreta <- ggplot(datos_limpios) +
  aes(x = areas_mng) + 
  geom_bar(width = 0.10, fill = "black") +
  scale_x_continuous(breaks = seq(1, 20, 1)) + 
  labs(y = "Cantidad de países", x = "Áreas temáticas reguladas (0 a 19)") +
  ggtitle("Distribución de cantidad de areas tematicas por pais destinadas 
          a la IA relacionado al Marco Nacional Gubernamental") +
  theme_classic()


#############################################
# Histograma para indice de marco normativo # (cuantitativo continuo)
#############################################

grafico_continua <- ggplot(datos_limpios)+
  aes(x = mng)+
  geom_histogram(fill = "gray", col = "black", bins = 10)+
  labs(x = "Puntaje de Marcos Normativos (0-100)", y = "Cantidad de paises")+
  ggtitle("Distribucion de los puntajes de los Marcos Nacionales Gubernamentales
          con respecto al uso responsable de la IA")+
  theme_classic()


