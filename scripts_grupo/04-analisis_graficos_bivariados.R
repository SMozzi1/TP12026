#agrego paquetes
library(tidyverse)
library(ggplot2)

# me traigo los datos
attach(datos_limpios)

##################################################
# Grafico de barra marcos normativos vs academia #
##################################################
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

################################################################
# Diagrama de dispersión  fuerza de la ley vs puntaje de girai #
################################################################

grafico_cont_cont <- ggplot(datos_limpios) +
  aes(x = mng, y = GIRAI) +
  geom_point(color = "darkblue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "forestgreen") +
  labs(x = "Fuerza de la Ley (0-100)", y = "Puntaje Global GIRAI (0-100)") +
  ggtitle("Relación entre Legislación y Éxito en IA Responsable") +
  theme_bw()

grafico_cont_cont

################################################################
# Diagrama de dispersión  fuerza de la ley vs puntaje de girai #
################################################################

  
