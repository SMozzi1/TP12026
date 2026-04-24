#agrego paquetes
library(tidyverse)
library(ggplot2)

# me traigo los datos
attach(datos_limpios)

##################################################
# Grafico de barra marcos normativos vs academia # (categorica vs categorica)
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
# Diagrama de dispersión  fuerza de la ley vs puntaje de GIRAI # (continua vs continua)
################################################################

grafico_cont_cont <- ggplot(datos_limpios) +
  aes(x = mng, y = GIRAI) +
  geom_point(color = "darkblue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "forestgreen") +
  labs(x = "Puntaje de fuerza de la Ley (0-100)", y = "Puntaje Global GIRAI (0-100)") +
  ggtitle("Relación entre Legislación y Éxito en IA Responsable") +
  theme_bw()

grafico_cont_cont

######################################################
# Boxplot de presencia de academia vs Puntaje GIRAI  # (cat vs cont)
######################################################

grafico_cat_cuant <- ggplot(datos_limpios) +
  
  aes(x = academia, y = GIRAI, fill = academia) + 
  geom_boxplot(show.legend = FALSE, width = 0.9, alpha = 0.7) + 
  scale_y_continuous(breaks = seq(0, 100, 10)) +
  
  labs(
    x = "¿Hay Academia orientada a la IA?", 
    y = "Puntaje Global GIRAI (0-100)"
  ) +
  coord_flip()+
  ggtitle("Distribución del éxito global según actividad académica") +
  theme_light()

grafico_cat_cuant
  
