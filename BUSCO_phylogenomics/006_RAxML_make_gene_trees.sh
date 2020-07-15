module load raxml

while read line; do
raxmlHPC-PTHREADS \
-T 8 \
-p 12345 \
-x 12345 \
-f a \
-m PROTGAMMAAUTO \
-N 100 \
-s /path/busco_phylogenomics/ASTRAL/indivalns/${line}.aln \
-n ${line}_raxml_tree.txt \
-w /path/busco_phylogenomics/ASTRAL/RAxML_gene_trees/
done<path/phylogenomics/final_busco_ids.txt
