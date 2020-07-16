mkdir busco_phylogenomics
cd busco_phylogenomics

# make folders to store aa and nt fasta files
mkdir -p busco_aa
mkdir -p busco_nt


# Extract complete BUSCO genes
FILES=/path/to/busco/output/busco_*/run_mucoromycota_odb10/full_table.tsv
for file in $FILES; do
grep -v "^#" ${file} | awk '$2=="Complete" {print $1}' >> all_complete_busco_ids.txt;
done

#sort the names
sort all_complete_busco_ids.txt > sorted_all_complete_busco_ids.txt

#only print the -d for duplicated names. Only genes present in 2 or more will be used.
uniq -d sorted_all_complete_busco_ids.txt > busco_ids_for_phylo.txt
#save names of the BUSCO genes that are present in 2 or more genomes in a new file. It will be used later.
