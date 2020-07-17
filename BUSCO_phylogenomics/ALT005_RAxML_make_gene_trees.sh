module load raxml

while read line; do
raxmlHPC-PTHREADS \
-T 8 \
-p 12345 \
-x 12345 \
-f a \
-m PROTGAMMAAUTO \
-N 100 \
-s /path/busco_phylogenomics/ASTRAL/individual_alignments/${line}.aln \
-n ${line}_raxml_tree.txt \
-w /path/busco_phylogenomics/ASTRAL/RAxML_gene_trees/
done<path/phylogenomics/busco_ids_for_phylo.txt
