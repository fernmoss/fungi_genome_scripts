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


##### EDIT
##### TESTING NEW SCRIPT
# sed -i -E 's/>.*[[:space:]]<unknown[[:space:]]description>$/hullo/g' test_test_sed.txt;
# replaces the fasta header completely

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
sed -i 's/>.*[[:space:]]<unknown[[:space:]]description>$/>'${genomename}'/g' busco_nt/${genomename}_${filename} # replaces the first string in the fasta header with the content of genomename
cut -f 1 -d ":" busco_nt/${genomename}_${filename} | tr '[:lower:]' '[:upper:]' > busco_nt/${genomename}_${filename}.1
mv busco_nt/${genomename}_${filename}.1 busco_nt/${genomename}_${filename} # changes the name of the file, removes the .1 file extension
done
done


