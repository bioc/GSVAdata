library(Matrix)
library(SingleCellExperiment)`
library(BiocFileCache)
library(R.utils)
library(scrapper)
library(GSEABase)
library(GSVA)

## use the single-nuclei RNA-seq (snRNA-seq) data from Tran et al. (2021)
## to generate a gene set collection of cell type markers for human brain
## and store them as a GMT file in the extdata directory of this package

bfc <- BiocFileCache()
url <- file.path("https://libd-snrnaseq-pilot.s3.us-east-2.amazonaws.com",
                 "SCE_DLPFC-n3_tran-etal.rda")
local_data <- bfcrpath(url, x=bfc)
load(local_data, verbose=TRUE)

## QC
stopifnot(exists("sce.dlpfc.tran"))
stopifnot(is(sce.dlpfc.tran, "SingleCellExperiment"))

## remove the logcounts assay
assays(sce.dlpfc.tran)$logcounts <- NULL

## gene_id contains the systematic Ensembl gene identifiers
## make sure they are unique and set them as the rownames of the SCE object
stopifnot(all(!duplicated(rowData(sce.dlpfc.tran)$gene_id))) ## QC
rownames(sce.dlpfc.tran) <- rowData(sce.dlpfc.tran)$gene_id

## keep only the gene_name and gene_biotype columns in the rowData
rowData(sce.dlpfc.tran) <- rowData(sce.dlpfc.tran)[, c("gene_name", "gene_biotype")]

## keep only the region, donor, sex, processBatch, protocol, sequencer, and
## cellType columns in the colData
colData(sce.dlpfc.tran) <- colData(sce.dlpfc.tran)[, c("region", "donor", "sex",
                                                       "processBatch", "protocol",
                                                       "sequencer", "cellType")]

## remove reduced dimensions
reducedDims(sce.dlpfc.tran) <- NULL

is_mito <- grepl("^MT-", rowData(sce.dlpfc.tran)$gene_name)
sce <- quickRnaQc.se(sce.dlpfc.tran, subsets=list(mito=is_mito))
sce <- sce[, sce$keep]
cellsxgene <- rowSums(counts(sce) > 0)
sce <- sce[cellsxgene > floor(ncol(sce)*0.01), ]
sce <- normalizeRnaCounts.se(sce, size.factors=sce$sum)

markers <- scoreMarkers.se(sce, groups=sce$cellType, block=sce$donor,
                           more.marker.args=list(threshold=1))
markers <- lapply(markers, function(x) rownames(x)[1:100])

markers <- geneIdsToGeneSetCollection(markers)

fname <- "human_brain_snRNAseq_cellType_markers.gmt"
toGmt(markers, file.path("..", "extdata", fname))
compressFile(file.path("..", "extdata", fname), ext="gz", FUN=gzfile)
