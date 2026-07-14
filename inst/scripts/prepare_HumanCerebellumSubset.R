library(Matrix)
library(TENxVisiumData)
library(scrapper)
library(R.utils)
library(EBImage)
library(org.Hs.eg.db)

spe <- HumanCerebellum()
is_mito <- grepl("(^MT-)|(^mt-)", rowData(spe)$symbol)
spe <- quickRnaQc.se(spe, subsets=list(mito=is_mito))
spe <- spe[, spe$keep]
spotsxgene <- rowSums(counts(spe) > 0)
spe <- spe[spotsxgene > floor(ncol(spe)*0.01), ]
spe <- normalizeRnaCounts.se(spe, size.factors=spe$sum)

## subset to 250 random genes, including a few markers for granule cells, the
## most abundant cell type in the cerebellum: SLC17A7, RBFOX3, PAX6, KCND2
granulecellmarkers <- c("SLC17A7", "RBFOX3", "PAX6", "KCND2")
granulecellmarkers <- mapIds(org.Hs.eg.db, granulecellmarkers,
			     "ENSEMBL", "SYMBOL")
samplegenes <- setdiff(rownames(spe), granulecellmarkers)
set.seed(12345)
samplegenes <- sample(samplegenes, 250 - length(granulecellmarkers))
samplegenes <- c(samplegenes, granulecellmarkers)
spe <- spe[samplegenes, ]

fname <- sprintf("human_cerebellum_norm_logcounts_250x%d.mtx", ncol(spe))
writeMM(as(assays(spe)$logcounts, "dgCMatrix"),
	file.path("..", "extdata", fname))
compressFile(file.path("..", "extdata", fname), ext="gz", FUN=gzfile)

fname <- sprintf("human_cerebellum_rowdata_250x%d.csv", ncol(spe))
write.csv(rowData(spe), file.path("..", "extdata", fname), row.names=TRUE)
compressFile(file.path("..", "extdata", fname), ext="gz", FUN=gzfile)

fname <- sprintf("human_cerebellum_coldata_250x%d.csv", ncol(spe))
write.csv(colData(spe)[, "sizeFactor", drop=FALSE],
	  file.path("..", "extdata", fname), row.names=TRUE)
compressFile(file.path("..", "extdata", fname), ext="gz", FUN=gzfile)

fname <- sprintf("human_cerebellum_spatialcoords_250x%d.csv", ncol(spe))
write.csv(spatialCoords(spe), file.path("..", "extdata", fname),
	  row.names=TRUE)
compressFile(file.path("..", "extdata", fname), ext="gz", FUN=gzfile)

raw_img <- Image(imgRaster(getImg(spe))) ## convert to EBImage format
fname <- sprintf("human_cerebellum_raw_image_250x%d.png", ncol(spe))
## use EBImage::writeImage() to save the image
writeImage(raw_img, file.path("..", "extdata", fname), type="png")


## how to build back the SpatialExperiment object from the files,
## but without the counts assay

fname <- "human_cerebellum_norm_logcounts_250x4573.mtx.gz"
logcounts <- as(readMM(gzfile(fname)), "CsparseMatrix")
fname <- "human_cerebellum_rowdata_250x4573.csv.gz"
rowdata <- read.csv(gzfile(fname), row.names=1)
fname <- "human_cerebellum_coldata_250x4573.csv.gz"
coldata <- read.csv(gzfile(fname), row.names=1)
fname <- "human_cerebellum_spatialcoords_250x4573.csv.gz"
spatialcoords <- as.matrix(read.csv(gzfile(fname), row.names=1))

spe <- SpatialExperiment(assays=list(logcounts=logcounts),
                         rowData=rowdata,
                         colData=coldata,
                         spatialCoords=spatialcoords,
                         sample_id="HumanCerebellum_WholeTranscriptome")
spe <- addImg(spe, sample_id="HumanCerebellum_WholeTranscriptome",
              image_id="lowres",
              imageSource="human_cerebellum_raw_image_250x4573.png",
              scaleFactor=0.0450045, load=TRUE)
