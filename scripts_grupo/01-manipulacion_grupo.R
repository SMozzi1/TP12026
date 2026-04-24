#Filtro de datos

#primero agregamos la libreria tidyverse
library(tidyverse)
#Me "traigo" los datos que voy a usar
attach(datos)
#Filtramos las columnas con el uso de select
datos_limpios <- datos %>% #usamos la pipeline para asignar el resultado
                            # de una operacion
  
# nos quedamos con las columnas de interes
  select(academia, sec_mng, tipo_academia_es, areas_mng, mng, areas_ane, ane, GIRAI
         , NU_region, Pais, privado, tipo_privado_es)
    
# Definimos el orden jerárquico de la variable ordinal sec_mng
niveles_desarrollo <- c("Muy bajo", "Bajo", "Medio", "Alto", "Muy alto")
    
datos_limpios <- datos_limpios %>%
  mutate(
    sec_mng = factor(sec_mng, levels = niveles_desarrollo, ordered = TRUE)
  )

# vemos los resultados finales
str(datos_limpios)
