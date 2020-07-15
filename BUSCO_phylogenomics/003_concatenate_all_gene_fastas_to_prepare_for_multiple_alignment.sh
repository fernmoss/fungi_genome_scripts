# CAT ALL AA (and nt) FILES INTO ONE, FOR EACH BUSCO GENE
# Use the file with gene names present in 3 or more genomes that you created earlier
while read line; do
cat busco_aa/*_${line}.faa >> ${line}_aa.fasta; #cats all aa files in the busco_aa folder together for each gene in the final_busco_ids.txt list
cat busco_nt/*_${line}.fna >> ${line}_nt.fasta; #cats all nt files in the busco_nt folder together for each gene in the final_busco_ids.txt list
done<final_busco_ids.txt # the file is piped into the while loop
