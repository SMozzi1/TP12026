#Filtro de datos

#primero agregamos la libreria tidyverse
library(tidyverse)
#Me "traigo" los datos que voy a usar
attach(datos)
#Filtramos los datos con el uso de mutate()
datos_limpios <- datos %>% #usamos la pipeline para asignar el resultado
                            # de una operacion
  
 # nos quedamos con las columnas de interes
  select(academia, sec_mng, tipo_academia_es, areas_mng, mng, ane) %>%
  
  # nos quedamos solo con los paises con academias
  filter(academia == "Sí")
    
    
# vemos los resultados finales
str(datos_limpios)
