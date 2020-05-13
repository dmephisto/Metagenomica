## Script Tarea 8.2
## Diego Montesinos Valencia 2020
## Este script esta basado en la clase 
## de "Introducción a la bioinformática e investigación reproducible para análisis genómicos”  

## Cambiar el working directory a la localización del script

# Cargar las librerias que se van a utilizar
library("phyloseq")
library("vegan")
library("ggplot2")

# Importar los datos (el archivo taxonomy.boim, ubicado en la carpeta DATA)
suelo <- import_biom("../DATA/taxonomy.biom")
suelo

# Cambiar las columnas de la tabla de taxonomía
colnames(tax_table(suelo)) <- c("Domain", "Phylum", "Class", "Order", "Family", "Genus", "Species")

# Ver de nuevo la tabla de taxonomia
head(tax_table(suelo))

# Crear una tabla binomial a partir del objeto "suelo"
otu_table <- as.data.frame(otu_table(suelo)) # Extrae la tabla de OTUs
A <- decostand(otu_table, method="pa") # Cambia a tabla binaria (presencia-ausencia)
otu_table_bin <- phyloseq(otu_table(A, taxa_are_rows= TRUE)) # Transformar la tabla a formato phyloseq
tax_table <- suelo@tax_table # Extraer la tabla de taxa
sam_data <- suelo@sam_data # Extraer la tabla de muestras

# Crear objeto con phyloseq
suelo_b <- merge_phyloseq(otu_table_bin,tax_table,sam_data)

# Diversidad alpha (riqueza en especies)
# Visualizar los datos mediante un bar plot pero teniendo tratamiento y hospedero a nivel de phylum
plot1 = plot_bar(suelo_b, "Host", fill = "Phylum") + 
  geom_bar(aes(color=Phylum, fill = Phylum), stat = "identity", position = "stack")
plot1 + facet_wrap("Treatment")

## Hacer un anova de la riqueza observada para host y treatment
# Estimar la diversidad observada
tab_diversity <- estimate_richness(suelo_b, measures = "Observed")
tab_diversity

# Combiar la tabla de diversidad observada con la de las muestras de "suelo_b"
data <- cbind(sample_data(suelo_b), tab_diversity)
data

# Realizar el ANOVA
anova <- aov(Observed ~ Treatment * Host, data = data)
summary(anova)

# Graficar
boxplot(Observed ~ Host * Treatment, data = data)

## Diversidad beta
# Realizar matriz de disimilitud (brey-curtis distance)
raup <- distance(suelo_b, method = "raup")
raup

# Realizar NMDS
NMDS = ordinate(suelo_b, method = "NMDS", distance = raup)
NMDS

# Plot de la ordinacion
plot2 = plot_ordination(suelo_b, NMDS, color = "Host") + facet_wrap("Treatment")
plot2

## Hacer test de adonis de la composicion de la comunidad por host y treatment
adonis(raup ~ Host * Treatment, data = data)
  



