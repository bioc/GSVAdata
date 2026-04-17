#' @title HumanCerebellumSubset
#'
#' @description A subset of the Visium spatial 10X Genomics spatial gene
#' expression data for the human cerebellum, after quality control filtering
#' and normalization. The original data was downloaded using the function
#' [`HumanCerebellum`][TENxVisiumData::HumanCerebellum] from the Bioconductor
#' package [`TENxVisiumData`][TENxVisiumData::TENxVisiumData]. The script
#' `inst/scripts/prepare_HumanCerebellumSubset.R` was used to perform the
#' quality control filtering and normalization, and to save the resulting
#' subsetted data in different files in the `inst/extdata` directory.
#'
#' @return A `SpatialExperiment` object containing the subsetted normalized
#' human cerebellum spatial transcriptomics data.
#'
#' @aliases HumanCerebellumNormSubset
#'
#' @name HumanCerebellumNormSubset
#'
#' @examples
#'
#' spe <- HumanCerebellumNormSubset()
#' spe
#'
#' @importFrom methods as
#' @importFrom utils read.csv
#' @importFrom Matrix readMM
#' @importFrom SpatialExperiment SpatialExperiment addImg
#' @export

HumanCerebellumNormSubset <- function() {
    syspath <- system.file("extdata", package="GSVAdata")
    fname <- "human_cerebellum_norm_logcounts_250x4816.mtx.gz"
    logcounts <- as(readMM(gzfile(file.path(syspath, fname))), "CsparseMatrix")
    fname <- "human_cerebellum_rowdata_250x4816.csv.gz"
    rowdata <- read.csv(gzfile(file.path(syspath, fname)), row.names=1)
    fname <- "human_cerebellum_coldata_250x4816.csv.gz"
    coldata <- read.csv(gzfile(file.path(syspath, fname)), row.names=1)
    fname <- "human_cerebellum_spatialcoords_250x4816.csv.gz"
    spatialcoords <- as.matrix(read.csv(gzfile(file.path(syspath, fname)),
                                        row.names=1))

    spe <- SpatialExperiment(assays=list(logcounts=logcounts),
                             rowData=rowdata,
                             colData=coldata,
                             spatialCoords=spatialcoords,
                             sample_id="HumanCerebellum_WholeTranscriptome")
    spe <- addImg(spe, sample_id="HumanCerebellum_WholeTranscriptome",
                  image_id="lowres",
                  imageSource=file.path(syspath, "human_cerebellum_lowres.png"),
                  scaleFactor=0.0450045, load=TRUE)
    spe
}
