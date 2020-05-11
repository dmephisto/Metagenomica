# Metagenómica
Repositorio de la Tarea 8.1 "Tutorial con AMPtk"

Diego Montesinos Valencia 2020

El tutorial se realizó con 24 muestras de suelo rizosférico recolectados en sitios de bosque nativo (N) y mixto (M) de Quercus (Q) y de Juniperus (J). Por cada muestra se tenía un archivo fastq con las secuencias R1 y R2 (forward y reverse, respectivamente) (Truong, 2020).

El Script ubicado en la carpeta BIN se ejecutó desde una carpeta en particular (dentro de un cluster), se tomó en cuenta la ruta relativa “../metagenomica/fastq” como el directorio donde se encontraban los archivos que correspondían a las muestras, ademas los archivos output se generaron dentro de la carpeta donde se ejecutó el Script.

Nota: el archivo “Script_TAREA8.1_DMV.sh” contiene comandos que fueron vistos en la clase de “Introducción a la bioinformática e investigación reproducible para análisis genómicos”.

## Resultados

Se realizaron dos ensayos, en uno se utilizó un min_length= 200 y en el otro un min_length= 300. En ambos ensayos se detectaron en total 300 mil reads.

Las diferencias observadas durante estos dos análisis fueron las siguientes.

Al utilizar un min_length= 200:

* Durante el pre-procesamiento 7,237 reads fueron descartadas por ser muy cortas (< 200 bp) y al final se obtuvieron 288,672 reads de salida ya que fueron validas.
    
* Durante el primer filtrado entraron 288,672 reads de las cuales 59,184 pasaron, ademas se obtuvieron 1,536 OTUs validadas y  252,903 reads fueron asignadas a las OTUs (88%).
    
* Al hacer el filtrado de la tabla de OTU (index bleed) se observo que en un inicio esta contenía 12 muestras, 1,536 OTUs y 252,903 reads y al final del filtrado la tabla permaneció igual a excepción de los reads los cuales disminuyeron a 252,350.
    
* Por último, al hacer la asignación de taxonomía a cada OTU se encontraron 279 OTUs que no pertenecían a hongos y se escribieron 1257 coincidencias (con hongos) en la tabla de OTU.
    
Al utilizar un min_length= 300:

* Durante el pre-procesamiento 205,170 reads fueron descartadas por ser muy cortas (< 300 bp) y al final se obtuvieron 90,739 reads de salida ya que fueron validas. 
    
* Durante el primer filtrado entraron 90,739 reads de las cuales 24,331 pasaron, ademas se obtuvieron 552 OTUs validadas y 85,315 reads fueron asignadas a las OTUs (94 %).
    
* Al hacer el filtrado de la tabla de OTU (index bleed) se observo que en un inicio esta contenía 12 muestras, 552 OTUs y 85,315 reads y al final del filtrado la tabla permaneció igual a excepción de los reads los cuales disminuyeron a 85,243.
    
* Por último, al hacer la asignación de taxonomía a cada OTU se encontraron 223 OTUs que no pertenecían a hongos y se escribieron 329 coincidencias (con hongos) en la tabla de OTU.

## Conclusión 

Al parecer el valor que se coloca como min_length afecta en el número total de OTUs con que se trabaja, en este caso al reducir el min_length a 200 al final del análisis se detectó un mayor de numero de OTUs coincidentes con hongos: 1257 OTUs (para min_length=200) y 329 OTUs (para min_length=300).

Debido a las cualidades del sistema de secuenciación Illumina, en lo personal optaría por un min_length= 300 ya que esta longitud sería mas optima y permite un mejor filtrado de las secuencias, al ser más estricto se evita analizar secuencias muy cortas que podrían meter ruido durante los análisis y durante la detección de OTUs.



