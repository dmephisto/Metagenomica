# Tarea 8.2 "Análisis de datos de Illumina MiSeq desde AMPtk"

Diego Montesinos Valencia 2020

## Generalidades

La carpeta BIN contiene el script de R que se utilizó para realizar el análisis (“Script_TAREA8.2_DMV.R”) y los informes en formato Rmd, pdf y html (nombrados “Informe_Tarea8.2_DMV”) del análisis realizado.

La carpeta DATA contiene el archivo “taxonomy.biom” que se obtuvo en la “Tarea 8.1” y el cual contiene 3 tablas: una de OTUs, una de taxonomía y una de las muestras. Las tablas contenidas en el archivo “taxonomy.biom” corresponden a los datos  de 24 muestras de suelo rizosférico recolectados en sitios de bosque nativo (N) y mixto (M) de Quercus (Q) y de Juniperus (J) (Truong, 2020).

## Metodología

Para el análisis se utilizo RStudio y los paquetes "phyloseq", "vegan" y "ggplot2".

En primera instancia se importo el archivo “taxonomy.biom” y a partir de este se obtuvo una tabla binaria de presencia-ausencia, esto fue necesario debido a que la abundancia de secuencias no es representativo de la abundancia de especies y por lo tanto la tabla binaria permite saber el numero de especies por familia en cada muestra.

Utilizando la tabla de presencia-ausencia se realizaron todos los análisis subsecuentes (diversidad alpha, beta y test de adonis).

## Resultados

En cuanto al análisis de diversidad alpha, el plot realizado parece mostrar mayor abundancia del phylum Ascomycota en Quercus en la condición mixta, en la condición nativa parece haber cierta similitud de abundancia de phyla tanto en Quercus como en Juniperus.

Al realizar el ANOVA de la riqueza observada tanto para Host como para Treatment, parece no haber una diferencia estadisticamente significativa para la diversidad observada en los diferentes tratamientos y hospederos.

Cuando se realizó el análisis de diversidad beta (donde se observa la diferencia de las comunidades) mediante NMDS, el nivel de estres fue de 0.13 por lo que la ordinación fue relativamente buena, posteriormente al realizar el plot de la ordinación se observa que las muestras entre Quercus y Juniperus son mas parecidas en la condición mixta que en la condición nativa.

Por ultimo, se realizó el test de adonis para ver si había diferencias en la estructura de la comunidades tanto en Host como en Treatment,  al hacer dicho test se observa que hay diferencias estadisticamente significativas tanto en Treatment como en Host.

## Conclusión 

Al realizar este tipo de análisis, parece no haber una diferencia significativa en la diversidad alpha pero si en la diversidad beta, ademas hay diferencias en las estructura de la comunidades tanto en los hospederos (Quercus-Juniperus) como en los tratamientos (mixto-nativo).
 
