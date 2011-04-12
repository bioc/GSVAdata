\name{leukemia_eset}
\alias{leukemia}
\alias{leukemia_eset}
\docType{data}
\title{Leukemia Data by Armstrong et al. (2002) from the Broad Institute}
\description{
 Microarray data hybridized on the Affymetrix Human Genome U95 Set chip, for 37
 different individuals with human acute leukemias, where 20 of them had
 conventional childhood acute lymphoblastic leukemia (ALL) and the other 17
 were affected with the MLL (mixed-lineage leukemia gene) translocation. The
 data is provided as an \code{ExpressionSet} object containing RMA-processed
 expression values.
}
\usage{data(leukemia)}
\details{
    The data is contained in an \code{ExpressionSet} object called
    \code{leukemia_eset} obtained as follows:

    \itemize{
      \item Raw CEL files corresponding to the data of the entire study (72
            individuals) were downloaded from
            \url{http://www.broadinstitute.org/cgi-bin/cancer/publications/pub_paper.cgi?mode=view&paper_id=63}
      \item 41 ALL and MLL samples with the same scanning date were kept and the
            rest were discarded.
      \item Based on quality assessments by NUSE and RLE diagnostics (Bolstad et al., 2005),
            4 additional samples were discarded such that 20 ALL and 17 MLL
            samples were finally kept.
      \item Probe-level data from these 37 samples were background corrected,
            normalized and summarized using RMA (Irizarry et al., 2003)
            providing this final \code{ExpressionSet} object.
    }
}
\source{
Scott A. Armstrong, Jane E. Staunton, Lewis B. Silverman, Rob Pieters, Monique L. den Boer, Mark D. Minden, Stephen E. Sallan, Eric S. Lander, Todd R. Golub and Stanley J. Korsmeyer. MLL translocations specify a distinct gene expression profile that distinguishes a unique leukemia. \emph{Nat Genet} 30:41-47, 2002.
}
\references{
Bolstad, B.M., Collin, F., Brettschneider, K., Simpson, L., Irizarry, R., and Speed, T.P.
Quality assessment of Affymetrix GeneChip data. In \emph{Bioinformatics and
Computational Biology Solutions Using R and Bioconductor}, pg. 33--48, Springer, 2005.

Irizarry, R.A., Hobbs, B., Collin, F., Beazer-Barclay, Y.D., Antonellis, K.J., Scherf, U., and Speed, T.P.
Exploration, normalization, and summaries of high density oligonucleotide array probe level data.
\emph{Biostatistics}, 4(2):249--64, 2003.
}
\examples{
data(leukemia)
leukemia_eset
head(pData(leukemia_eset))
}
\keyword{datasets}
