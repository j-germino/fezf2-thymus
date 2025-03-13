#!/bin/bash

computeMatrix reference-point \
    -S /mnt/iacchus/joe/raw_data/Thymus/Fezf2_chip/output/bigwigs/Fezf2_input_sorted_rmdup.bw \
       /mnt/iacchus/joe/raw_data/Thymus/Fezf2_chip/output/bigwigs/Fezf2_sorted_rmdup.bw \
    -R /home/joe/Repositories/fezf2-thymus/analysis/DE/all_genes.bed \
    -p 16 \
    -b 10000 \
    -a 10000 \
    --skipZeros \
    -o /home/joe/Repositories/fezf2-thymus/analysis/ChIP_seq/all_genes_matrix.mat.gz

plotHeatmap -m /home/joe/Repositories/fezf2-thymus/analysis/ChIP_seq/all_genes_matrix.mat.gz \
    -out /home/joe/Repositories/fezf2-thymus/analysis/ChIP_seq/all_genes_heatmap.pdf \
    --dpi 600 \
    --outFileSortedRegions /home/joe/Repositories/fezf2-thymus/analysis/ChIP_seq/all_genes_regions_sorted.bed \
    --legendLocation upper-left \
    --colorMap Blues \
    --heatmapWidth 5 \
    --heatmapHeight 16