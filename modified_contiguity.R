library(tidyverse)
library(scales)

# This script is a modified version of the script contiguity.R by SamStudio8, downloaded from https://gist.github.com/SamStudio8/6b16674bae8afec706bed80e6ac2da24
# Thanks a billion, Sam! :)
# There is likely redundant code in this script, as I am not completely familiar with R and ggplot2.

# This script plots a stocked bar chart showing the contig lengths and coverage of contigs in 12 genome assemblies.
#The input tsv files have the columns "seq_name", "length" and "coverage".

#read in table
assembly.1 = read_tsv("path")
# add column with sampleID
assembly.1$sampleID="S1"
assembly.1 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.1

#read in table
assembly.2 = read_tsv("path")
# add column with sampleID
assembly.2$sampleID="S2"
assembly.2 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.2

#read in table
assembly.3 = read_tsv("path")
# add column with sampleID
assembly.3$sampleID="S3"
assembly.3 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.3

#read in table
assembly.4 = read_tsv("path")
# add column with sampleID
assembly.4$sampleID="S4"
assembly.4 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.4

#read in table
assembly.5 = read_tsv("path")
# add column with sampleID
assembly.5$sampleID="S5"
assembly.5 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.5

#read in table
assembly.6 = read_tsv("path")
# add column with sampleID
assembly.6$sampleID="S6"
assembly.6 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.6

#read in table
assembly.7 = read_tsv("path")
# add column with sampleID
assembly.7$sampleID="S7"
assembly.7 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.7

#read in table
assembly.8 = read_tsv("path")
# add column with sampleID
assembly.8$sampleID="S8"
assembly.8 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.8

#read in table
assembly.9 = read_tsv("path")
# add column with sampleID
assembly.9$sampleID="S9"
assembly.9 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.9

#read in table
assembly.10 = read_tsv("path")
# add column with sampleID
assembly.10$sampleID="S10"
assembly.10 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.10

#read in table
assembly.11 = read_tsv("path")
# add column with sampleID
assembly.11$sampleID="S11"
assembly.11 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.11

#read in table
assembly.12 = read_tsv("path")
# add column with sampleID
assembly.12$sampleID="S12"
assembly.12 %>%
  select("sampleID", "length", "coverage" = "cov.", "seq_name") -> assembly.12


#cat the tables
assemblies <- rbind(assembly.1, assembly.2, assembly.3, assembly.4, assembly.5, assembly.6, assembly.7, assembly.8, assembly.9, assembly.10, assembly.11, assembly.12)

# Order the assemblies
assemblies$sampleID <- fct_rev(factor(assemblies$sampleID, levels = c("S1", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "S10", "S11", "S12")))


sample.labels.reversed <- c("Sample 1","Sample 2","Sample 3","Sample 4","Sample 5","Sample 6","Sample 7","Sample 8","Sample 9","Sample 10","Sample 11","Sample 12")
sample.labels <- rev(sample.labels.reversed)

# plot
p <- ggplot(assemblies, aes(x=sampleID, y=length, fill=coverage)) +
  geom_bar(stat="identity", colour="black", size=0.08)+
  scale_fill_gradient(low = "lightgoldenrodyellow", high = "darkorange", limits=c(20, 200), oob=squish, breaks = c(30, 60, 90, 120, 150, 180),
  # scale_fill_continuous(low="lightyellow", high="red1", breaks = c(30, 60, 90, 120, 150, 180),
                        labels = paste(c(30, 60, 90, 120, 150, 180)),
                        guide = guide_legend(
                          title.theme = element_text(size = 6),
                          direction = "vertical",
                          title.position = "top",
                          label.position = "right",
                          label.hjust = 0.5,
                          label.vjust = 1,
                          label.theme = element_text(size = 6, angle = 0),
                          legend.key.size = unit(0.01, "lines"),
                          legend.key.width = unit(0.01,"lines"))) +
  theme_bw() +
  theme(text = element_text(color = "black", size = 8)) +
  theme(axis.text.x = element_text(color = "black", angle = 0, hjust = 1)) +
  theme(legend.position="right") +
  coord_flip() +
  scale_y_continuous(labels=function(x)x/1000000, expand=c(0, 0, 0.15, 0), breaks=seq(0,100000000,10000000)) +
  xlab("Strain") + ylab("Contig size (Mbp)") +
  scale_x_discrete(labels = sample.labels) +
  theme(strip.text.y = element_text(color = "black", size = 8, angle = 0)) +
  theme(strip.text.x = element_text(color = "black", size = 8)) +
  theme(axis.text.y = element_text(family="Times", color = "black", size = 9))+
  theme(axis.text.x = element_text(color = "black", size = 8))+
  theme(panel.spacing = unit(1, "lines")) +
geom_point(shape = 3, color = "red2", size = 2, aes(x = 1, y= 36580000), show.legend = F)+ #12
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 2, y= 45703929), show.legend = F)+ #11
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 3, y= 40440000), show.legend = F)+ #10
  scale_alpha(guide = 'none') +  
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 4, y= 50232106), show.legend = F)+ #9
  scale_alpha(guide = 'none') + 
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 5, y= 65533039), show.legend = F)+ #8
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 6, y= 48750000), show.legend = F)+ #7
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 7, y= 50232106), show.legend = F)+ #6
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 8, y= 36580000), show.legend = F)+ #5
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 9, y= 22200000), show.legend = F)+ #4
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 10, y= 33500000), show.legend = F)+ #3
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 11, y= 44738268), show.legend = F)+ #2
  scale_alpha(guide = 'none') +
  geom_point(shape = 3, color = "red2", size = 2, aes(x = 12, y= 43420000), show.legend = F)+ #1
  scale_alpha(guide = 'none')

ggsave("contiguity_30x10cm.png", width=30, height=10, units="cm")
ggsave("contiguity_18x6cm.png", width=18, height=6, units="cm")
