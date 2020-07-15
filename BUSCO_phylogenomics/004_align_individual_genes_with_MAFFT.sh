# use the fasta files you made in the last script.
# each contains the amino acid sequences of one busco gene, from all of the genomes, concatenated together


module load mafft
# make alignmetns for each individual gene with MAFFT
# reading each line = reading each gene name form the list .txt file
while read line; do
mafft \
--thread \
-8 \
--maxiterate 100 \
/path/busco_phylogenomics/${line}_aa.fasta \
> /path/busco_phylogenomics/ASTRAL/indivalns/${line}.aln
done</path/busco_phylogenomics/final_busco_ids.txt



# NOTE:
# I'm not sure how MAFFT's options work.
# These options resulted in (if I understood correctly) using the FFT-NS-i strategy.
# From MAFFT output:
#     Strategy:
#      FFT-NS-i (Accurate but slow)
#      Iterative refinement method (max. 16 iterations)

# Also from the output:
#       dvtditr (aa) Version 7.310 alg=A, model=BLOSUM62, 1.53, -0.00, -0.00, noshift, amax=0.0
#     8 thread(s)
