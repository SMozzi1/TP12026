#Cargo las librerias

library(tidyverse)
library(janitor)

#me traigo los datos limpios
attach(datos_limpios)

#Table para categorica nominal (hay academia)

tabla_academia <- datos_limpios %>%
  tabyl(academia) %>%
  adorn_totals("row")%>%
  adorn_pct_formatting(digits = 1) %>%
  rename("Presencia de Academia" = academia, "N" = n, "%" = percent)

#Table para categorica nominal (hay privado)

tabla_privado <- datos_limpios %>%
  tabyl(privado) %>%
  adorn_totals("row")%>%
  adorn_pct_formatting(digits = 1) %>%
  rename("Presencia de privado" = privado, "N" = n, "%" = percent)

#Table para categorica Ordinal (marcos normativos)

tabla_leyes <- datos_limpios %>%
  tabyl(sec_mng) %>%
  adorn_totals("row") %>%
  adorn_pct_formatting(digits = 1) %>%
  rename("Nivel de Marcos Normativos" = sec_mng, "Cant paises" = n, "%" = percent)

#Table para cuantitativa discreta (Areas reguladas)
tabla_areas_reguladas <- datos_limpios %>%
  tabyl(areas_mng) %>%
  adorn_totals("row") %>%
  adorn_pct_formatting(digits = 1) %>%
  rename("Cant de Areas Reguladas"  = areas_mng, "Paises" = n, "%" = percent)

#table para variable de respuesta multiple (tipo de iniciativa academica)
tabla_tipo_iniciativa_acade <- datos_limpios %>%
  filter(academia == "Sí") %>%
  tabyl(tipo_academia_es) %>%
  arrange(desc(n)) %>%
  adorn_pct_formatting(digits = 1)%>%
  rename("Tipo de Iniciativa" = tipo_academia_es, "Cantidad con esta iniciativa" = n, "% del total" = percent)

#table para variable de respuesta multiple (tipo de iniciativa privado)
tabla_tipo_iniciativa_priv <- datos_limpios %>%
  mutate(tipo_privado_es = replace_na(tipo_privado_es, "Sin especificar")) %>%
  filter(privado == "Sí") %>%
  tabyl(tipo_privado_es) %>%
  arrange(desc(n)) %>%
  adorn_pct_formatting(digits = 1)%>%
  rename("Tipo de Iniciativa" = tipo_privado_es, "Cantidad con esta iniciativa" = n, "% del total" = percent)


