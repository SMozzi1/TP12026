#paquetes que necesitamos
library(tidyverse)
library(ggplot2)

# me traigo los datos
attach(datos_limpios)

#Histograma para mng

ggplot(datos_limpios,
  aes(x = mng)) +
  geom_histogram(
    fill = "steelblue",
    color = "black",
    bins = 10
  ) +
  labs(
    title = "Distribucion del Puntaje de Macros Normativos",
    x = "Puntaje (0 a 100)",
    y = "Cantidad de Paises"
  ) +
  theme_minimal()

#Histograma para ane

ggplot(datos_limpios,
  aes(x = ane)) +
  geom_histogram(
    fill = "steelblue",
    color = "black",
    bins = 10
  ) +
  labs(
    title = "Distribucion del Puntaje de Actores no estatales",
    x = "Puntaje (0 a 100)",
    y = "Cantidad de Paises"
  ) +
  theme_minimal()

# Grafico de barras para academia

ggplot(datos_limpios,
       aes(x = sec_mng)) +
  geom_bar(
    fill  = "coral",
    color = "black",
    width = 0.7
  ) +
  labs(
    title = "Nivel de Marcos Normativos",
    x = "Nivel de Desarrollo",
    y = "Cantidad de paises"
  ) +
  theme_minimal()

# Grafico de barras para el Nivel de desarrollo de los marcos normativos

ggplot(datos_limpios,
       aes(x = sec_mng)) +
  geom_bar(
    fill  = "coral",
    color = "black",
    width = 0.7
  ) +
  labs(
    title = "Nivel de Marcos Normativos",
    x = "Nivel de Desarrollo",
    y = "Cantidad de paises"
  ) +
  theme_minimal()

# Grafico de barras para los paises con academias

ggplot(datos_limpios,
       aes(x = academia)) +
  geom_bar(
    fill  = "coral",
    color = "black",
    width = 0.7
  ) +
  labs(
    title = "Academia",
    x = "Si",
    y = "No"
  ) +
  theme_minimal()


