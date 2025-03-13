library(TxDb.Mmusculus.UCSC.mm10.ensGene)
library(biomaRt)
library(rtracklayer)
library(GenomicFeatures)
mart <- useDataset("mmusculus_gene_ensembl", useMart("ensembl"))

txdb <- TxDb.Mmusculus.UCSC.mm10.ensGene

genes <- genes(
  txdb,
  columns = c("gene_id"),
)
genes <- keepStandardChromosomes(genes, pruning.mode = "coarse")

gene_symbols <- getBM(
  filters = "ensembl_gene_id",
  attributes = c("ensembl_gene_id", "external_gene_name", "description"),
  values = unlist(genes$gene_id),
  mart = mart
)
gene_symbols <- gene_symbols[!duplicated(gene_symbols$ensembl_gene_id), ]
rownames(gene_symbols) <- gene_symbols$ensembl_gene_id
genes <- genes[gene_symbols$ensembl_gene_id]
genes$external_gene_name <- gene_symbols$external_gene_name

setwd("/home/joe/Repositories/fezf2-thymus/")

export(
  genes,
  con = "analysis/DE/all_genes.bed",
  format = "BED"
)
