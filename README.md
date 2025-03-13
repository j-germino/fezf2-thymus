# fezf2-thymus

Analysis of scRNA-seq data from WT, Fezf2 cKO and Aire KO mouse thymi (GSE226493) for *"Fezf2 regulates differentiation of Aire-expressing and post-Aire mimetic epithelial populations maintaining thymic homeostasis"* (in revision)

- **code/** contains all jupyter notebooks/scripts needed for preprocessing, analysis, and figure generation. Number prefixes indicate the order in which analyses were run.
  - **cell_x_gene_TRA** - creating tissue-restricted antigen gene lists from cell types in the cellxgene atlas
  - **published_data_reanalysis** - reanalysis of published Fezf2 microarrayand ChIP-seq datasets
  - **scRNAseq** - main analysis pipeline of new WT/Aire KO/Fezf2 KO datasets
  - **scRNAseq-individual_genotypes** - reproducing major results processing genotypes individually instead of integrating and analyzing them simultaneously
  - **WT_myeloid_stromal_scRNAseq** - analysis of WT thymic myeloid and stromal scRNA-seq datasets
- **analysis/** contains processed data files and figure pdfs
- **logs/** contains logging information for kallisto alignment
- **requirements.txt** contains the package version information used for this project
- **Fezf2_microarray_DE_genes.csv** contains Fezf2 WT vs Fezf2 KO DE genes identified by Takaba, et al. Cell (2015) doi: https://doi.org/10.1016/j.cell.2015.10.013
- **sansom_TRE.csv** - Tissue restricted antigen genes identified by Sansom, et all. Genome Res. (2014) doi: https://doi.org/10.1101/gr.171645.113
- **mouse_TFs.csv** - List of all mouse TFs from Hammelman, et al. Nat. Methods. (2022) doi: https://doi.org/10.1038/s41592-022-01522-2

Published datasets used for this project include Fezf2 microarray DE genes (https://doi.org/10.1016/j.cell.2015.10.013) and Fezf2 ChIP-seq (https://doi.org/10.3389/fimmu.2023.1277365)

Citation will be added after publication.
