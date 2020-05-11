#### Script Tarea 8.1
#### Diego Montesinos Valencia 2020
#### Este script se ejecuta desde la carpeta BIN y toma los datos de la carpeta "../metagenomica"

## Pre-preocesamiento de los archivos FASTQ
# Se ensamblan reads forward y reverse, se eliminan primer y secuencias cortas
amptk illumina -i ../metagenomica/fastq -o amptk/ -f GTGARTCATCRARTYTTTG -r CCTSCSCTTANTDATATGC -l 300 --min_len 200 --full_length --cleanup

## Clustering al 97% de similitud usando UPARSE
# Filtro de cualidad (aun con secuencias quimericas), agrupamiento de las secuencias en OTUs
amptk cluster -i amptk.demux.fq.gz -o cluster -m 2 --uchime_ref ITS

## Filtrar la tabla de OTUs (index bleed)
# El index bleed son los reads asignados a la muestra incorrecta durante el proceso de secuenciacion de illumina
amptk filter -i cluster.otu_table.txt -o filter -f cluster.cluster.otus.fa -p 0.005 --min_reads_otu 2

## Asignar taxonomia a cada OTU
# El software AMPtk usa la base de datos de secuencias UNITE para asignar la taxonomia de los OTUs
# Se obtienen resultados mejores que GenBank (debido a que UNITE es una base de datos curada)
amptk taxonomy -i filter.final.txt -o taxonomy -f filter.filtered.otus.fa -m ../metagenomica/amptk.mapping_file.txt -d ITS2 --tax_filter Fungi

echo "Analisis TAREA 8.1, TERMINADO"






