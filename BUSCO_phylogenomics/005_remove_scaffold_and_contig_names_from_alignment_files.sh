# In order to 
# 1) obtain gene trees that can be merged together/coalesced by ASTRAL
# 2) concatenate the alignments together correctly (to make a supermatrix which will be the basis of a RAxML phylogenetic tree)
# the names of the scaffolds and contigs present in the files need to be removed.
# Inside the alignment files, the text looks like this:
# ">GENOME_NAME|CONTIG_1234:
# [AMINO ACID SEQUENCE]
# >GENOME2_NAME|SCAFFOLD_1234:
# [AMINO ACID SEQUENCE]

# First, find the contig and scaffold names and save to a file
# 1st pattern: |LETTERSNUMBERS.1
# 2nd pattern: |CONTIG_NUMBERS
# 3rd pattern: |SCAFFOLD_NUMBERS
# use >> to append

grep -E --no-filename --only-matching '[|][A-Z]+[0-9]+[.][1]' *.aln >> redundant_remove_these_ids_from_alnfiles.txt
grep -E --no-filename --only-matching '[|]CONTIG_[0-9]+' *.aln >> redundant_remove_these_ids_from_alnfiles.txt
grep -E --no-filename --only-matching '[|]SCAFFOLD_[0-9]+' *.aln >> redundant_remove_these_ids_from_alnfiles.txt

# remove redundant names
sort -u redundant_remove_these_ids_from_alnfiles.txt > remove_these_ids_from_alnfiles.txt



# Now, remove the contig and scaffold names from the alignment files.
# Replace the strings with nothing, using sed.
# sed -i s/string_to_be_replaced/string_to_replace_with/g
# s means substitute, g means globally (in the entire file, not just the first line where the string is found).

# This is SLOW!
# It takes a while... :/


dirpath=/path/busco_phylogenomics/ASTRAL/indivalns/
for dir in $dirpath; do
  for file in ${dir}/*.aln; do
    echo $file;
    filename=`basename $file`;
    echo $filename;
    while read line; do
      echo $line;
      sed -i 's/'${line}'//g' $filename;
    done<remove_these_ids_from_alnfiles.txt;
  done;
done
