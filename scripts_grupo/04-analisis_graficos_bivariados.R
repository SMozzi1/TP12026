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

#####################################################
# Grafico de barras de academia vs puntaje de GIRAI #
#####################################################

# Usamos la tubería para agrupar y calcular el promedio solo para el gráfico
grafico_cat_cont <- ggplot(datos) +
  aes(x = academia, y = GIRAI) +
  geom_boxplot(outlier.shape = NA, fill = "lightgray") + # Ocultamos los outliers de la caja porque ya los va a dibujar el jitter
  theme_classic()

grafico_cat_cont


grafico_cat_cont_crestas <- ggplot(datos_limpios) +
  aes(x = GIRAI, y = academia, fill = academia) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none") +
  labs(x = "Puntaje Global GIRAI (0-100)",
       y = "¿Hay academia activa?")

grafico_cat_cont_crestas
  
