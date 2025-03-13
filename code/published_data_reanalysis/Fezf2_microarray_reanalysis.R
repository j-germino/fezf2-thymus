library(mouse4302.db)
library(mouse4302cdf)
library(data.table)
library(Biobase)
library(limma)

setwd("/mnt/iacchus/joe/raw_data/Thymus/Takayanagi_2015/Fezf2_DE_microarray/")
# Read in merged processed data
data <- read.table("merged.csv", sep=",", header=TRUE, row.names=1)
# Log2 transform data for limma
data <- log(data, 2)
# Set up group metadata
groups <- c()
for (i in strsplit(colnames(data), "_")){
    groups <- c(groups, i[1])
}
# Set up design matrix for WT vs KO comparison
f <- factor(groups, levels = c("WT", "KO"))
design <- model.matrix(~ 0 + f)
colnames(design) <- c("WT", "KO")
data_fit <- lmFit(data, design)
contrast_matrix <- makeContrasts(KO-WT, levels = design)
data_fit_con <- contrasts.fit(data_fit, contrast_matrix)
# Run t-tests
data_fit_eb <- eBayes(data_fit_con)
# Get statistics for all probes
stats <- topTable(data_fit_eb, number = length(rownames(data_fit_eb)))
data <-  merge(data, stats, by = "row.names")
row.names(data) <- data$Row.names

# Get probe names
probes <- row.names(data)
# Get gene symbols for each probe
symbols <- unlist(mget(probes, mouse4302SYMBOL, ifnotfound = NA))
# Add gene symbols to the data
data_annotated <- cbind(probes, symbols, data)
# Subset only on probes that map to genes
data_annotated <- data_annotated[!is.na(data_annotated$symbols), ]

# Write data+stats for all probes
write.table(
    data_annotated,
    "annotated.csv",
    sep = ",",
    row.names = FALSE
)

# Filter on 2-fold change significant hits
data_filtered <- data_annotated[
    data_annotated["adj.P.Val"] < 0.05 &
    abs(data_annotated$logFC) > 1,
]

# Write significant hits
write.table(
    data_filtered,
    "annotated_filtered.csv",
    sep = ",",
    row.names = FALSE
)
