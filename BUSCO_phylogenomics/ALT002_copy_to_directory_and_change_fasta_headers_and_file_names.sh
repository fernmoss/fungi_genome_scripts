# store paths in the variable SINGLECOPY
SINGLECOPY=/path/busco_*/run_mucoromycota_odb10/busco_sequences/single_copy_busco_sequences


#COPY FILES FROM BUSCO OUTPUT DIRECTORIES, CHANGE FASTA HEADER TO GENOMENAME (name of BUSCO output folder for each genome) AND CHANGE NAME OF EACH FILE TO INCLUDE GENOMENAME

for dir in $SINGLECOPY; do
genomename=`echo $dir | awk -F / '{ print $8; }'` # saves the unique directory name in the variable genomename (the number depends on number of directories from root)

for file in ${dir}/*.faa; do
filename=`basename $file`
cp $file busco_aa/${genomename}_${filename} # saves the gene fasta file name in the variable filename
sed -i 's/>.*[[:space:]]<unknown[[:space:]]description>$/>'${genomename}'/g' busco_aa/${genomename}_${filename} # replaces the fasta header with the content of genomename
mv busco_aa/${genomename}_${filename}.1 busco_aa/${genomename}_${filename} # changes the name of the file, removes the .1 file extension
done
done
