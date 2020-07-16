# CAT ALL AA FILES INTO ONE FOR EACH BUSCO GENE
# Use the file with gene names that you created earlier
while read line; do
cat busco_aa/*_${line}.faa >> ${line}_aa.fasta; #cats all aa files in the busco_aa folder together for each gene in list
done<busco_ids_for_phylo.txt # the file is piped into the while loop
