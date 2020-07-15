# bash 
# This script is a modified version of the scripts found at https://bioinformaticsworkbook.org/dataAnalysis/phylogenetics/reconstructing-species-phylogenetic-tree-with-busco-genes-using-maximum-liklihood-method.html#gsc.tab=0
# Thank you for the tutorial!
# This script is modified to work on output from BUSCO version 4



mkdir busco_phylo
cd busco_phylo

# make folders to store aa and nt fasta files
mkdir -p busco_aa
mkdir -p busco_nt


# Extract complete BUSCO genes
FILES=/path/to/busco/output/busco_*/run_mucoromycota_odb10/full_table.tsv
for file in $FILES; do
grep -v "^#" ${file} | awk '$2=="Complete" {print $1}' >> all_complete_busco_ids.txt;
done

# To filter out the complete BUSCOs that are only present less than 3 genomes, we can use uniq and awk commands
sort all_complete_busco_ids.txt |uniq -c > all_complete_busco_ids_with_counts.txt
awk '$NF > 2 {print $2}' all_complete_busco_ids_with_counts.txt > final_busco_ids.txt #save names of the BUSCO genes that are present in 3 or more genomes in a new file. It will be used later.
