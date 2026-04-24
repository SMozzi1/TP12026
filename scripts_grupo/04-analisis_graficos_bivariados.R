#agrego paquetes
library(tidyverse)
library(ggplot2)

# me traigo los datos
attach(datos_limpios)

#variables categoricas nivel de leyes vs presencia academica
grafico_cat_cat <- datos_limpios %>%
  ggplot() +
  aes(x = sec_mng, fill = academia) +
  geom_bar(position = "fill", color = "black") +
  scale_y_continuous(labels = scales::percent) +
  labs(
    x = "Nivel de Marcos Normativos (Leyes)",
    y = "Proporcion de paises",
    fill = "¿Hay academia?"
  ) +
  ggtitle("Presencia de academia segun nivel de desarrollo legal") +
  theme_classic()
  
grafico_cat_cat
  
