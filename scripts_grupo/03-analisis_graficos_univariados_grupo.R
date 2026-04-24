#paquetes que necesitamos
library(tidyverse)
library(ggplot2)

# me traigo los datos
attach(datos_limpios)

#grafico de barras distribucion de paises por continente
grafico_poblacion <- ggplot(datos_limpios, 
                            aes(y = fct_infreq(NU_region)))+
  geom_bar(fill = "red", color = "black", alpha = 0.8)+
  theme_minimal()+
  labs(
    title = "Poblacion del Estudio: Distribucion por continente",
    subtitle = "Total de 138 paises segun el estandar M49 de Naciones Unidas",
    x = "Cantidad de paises",
    y = "Region continental"
  )

#grafico de barras nivel de marcos normativos
grafico_ordinal <- ggplot(datos_limpios)+
  aes(x = sec_mng)+
  geom_bar(width = 0.75, fill = "blue", col = "black", alpha = 0.8)+
  labs(y = "Cantidad de paises", x = "Nivel de marcos normativos")+
  ggtitle("Nivel de desarrollo legal")+
  theme_classic()

#grafico de barras para respuesta multiple

grafico_resp_multiple <- ggplot(tabla_tipo_iniciativa_acade) + 
  # Usamos reorder para que queden ordenadas por frecuencia
  aes(x = reorder(`Tipo de Iniciativa`, `Cantidad con esta iniciativa`), y = `Cantidad con esta iniciativa`) +  
  geom_bar(stat = "identity", width = 0.75, fill = "green", col = "black") +
  labs(y = "Cantidad de iniciativas", x = "Tipo de Iniciativa") +
  ggtitle("Iniciativas Académicas") +
  coord_flip() + 
  theme_classic()

#grafico de bastones para cuantitativa discreta
grafico_discreta <- ggplot(datos_limpios) +
  aes(x = areas_mng) + 
  geom_bar(width = 0.10, fill = "black") +
  scale_x_continuous(breaks = seq(1, 20, 1)) + 
  labs(y = "Cantidad de países", x = "Áreas temáticas reguladas (0 a 19)") +
  ggtitle("Áreas reguladas por país") +
  theme_classic()

# histograma para indice de marco normativo
grafico_continua <- ggplot(datos_limpios)+
  aes(x = mng)+
  geom_histogram(fill = "gray", col = "black", bins = 10)+
  labs(x = "Puntaje de Marcos Normativos (0-100)", y = "Cantidad de paises")+
  ggtitle("Distribucion de la fuerza legislativa")+
  theme_classic()

