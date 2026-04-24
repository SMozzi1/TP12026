#Cargo las librerias

library(tidyverse)
library(janitor)

#me traigo los datos limpios
attach(datos_limpios)

#Table para categorica nominal

tabla_academia <- datos_limpios %>%
  tabyl(academia) %>%
  adorn_totals("row")%>%
  adorn_pct_formatting(digits = 1) %>%
  rename("Presencia de Academia" = academia, "N" = n, "%" = percent)


#Table para variable Ordinal

tabla_leyes <- datos_limpios %>%
  tabyl(sec_mng) %>%
  adorn_totals("row") %>%
  adorn_pct_formatting(difits = 1) %>%
  rename("Nivel de Macros Normativos" = sec_mng, "Cant paises" = n, "%" = percent)

#table para variable de respuesta multiple
tabla_tipo_iniciativa <- datos_limpios %>%
  tabyl(tipo_academia_es) %>%
  arrange(desc(n)) %>%
  adorn_pct_formatting(digits = 1)%>%
  rename("Tipo de Iniciativa" = tipo_academia_es, "Cantidad con esta iniciativa" = n, "% del total" = percent)



