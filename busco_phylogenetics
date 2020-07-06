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








# store paths in the variable SINGLECOPY
SINGLECOPY=/path/busco_*/run_mucoromycota_odb10/busco_sequences/single_copy_busco_sequences


#COPY FILES FROM BUSCO OUTPUT DIRECTORIES, CHANGE HEADER TO INCLUDE GENOMENAME (name of BUSCO output folder for each genome) AND CHANGE NAME OF EACH FILE TO INCLUDE GENOMENAME

for dir in $SINGLECOPY; do
genomename=`echo $dir | awk -F / '{ print $8; }'` # saves the unique directory name in the variable genomename (the number depends on number of directories from root)

for file in ${dir}/*.faa; do
filename=`basename $file` # saves the gene fasta file name in the variable filename
cp $file busco_aa/${genomename}_${filename} # copies the file into the directory busco_aa
sed -i 's/^>/>'${genomename}'|/g' busco_aa/${genomename}_${filename} # replaces the first string in the fasta header with the content of genomename
cut -f 1 -d ":" busco_aa/${genomename}_${filename} | tr '[:lower:]' '[:upper:]' > busco_aa/${genomename}_${filename}.1 # removes the header contents after :
mv busco_aa/${genomename}_${filename}.1 busco_aa/${genomename}_${filename} # changes the name of the file, removes the .1 file extension
done
for file in ${dir}/*.fna; do
filename=`basename $file`
cp $file busco_nt/${genomename}_${filename} # saves the gene fasta file name in the variable filename
sed -i 's/^>/>'${genomename}'|/g' busco_nt/${genomename}_${filename} # replaces the first string in the fasta header with the content of genomename
cut -f 1 -d ":" busco_nt/${genomename}_${filename} | tr '[:lower:]' '[:upper:]' > busco_nt/${genomename}_${filename}.1
mv busco_nt/${genomename}_${filename}.1 busco_nt/${genomename}_${filename} # changes the name of the file, removes the .1 file extension
done
done


# CAT ALL AA (and nt) FILES INTO ONE, FOR EACH BUSCO GENE
# Use the file with gene names present in 3 or more genomes that you created earlier
while read line; do
cat busco_aa/*_${line}.faa >> ${line}_aa.fasta; #cats all aa files in the busco_aa folder together for each gene in the final_busco_ids.txt list
cat busco_nt/*_${line}.fna >> ${line}_nt.fasta; #cats all nt files in the busco_nt folder together for each gene in the final_busco_ids.txt list
done<final_busco_ids.txt # the file is piped into the while loop




# script is not complete yet, see the original tutorial for complete scripts (for earlier BUSCO version)
https://bioinformaticsworkbook.org/dataAnalysis/phylogenetics/reconstructing-species-phylogenetic-tree-with-busco-genes-using-maximum-liklihood-method.html#gsc.tab=0
