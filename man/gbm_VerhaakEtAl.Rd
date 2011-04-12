\name{gbm_eset}
\alias{gbm_VerhaakEtAl}
\alias{gbm_eset}
\docType{data}
\title{Glioblastoma Multiforme (GBM) Data by Verhaak et al. (2010)}
\description{
 Microarray data from Glioblastoma multiforme (GBM) downloaded from
 the TCGA website (\url{http://cancergenome.nih.gov}). The data
 is provided as an \code{ExpressionSet} object containing RMA-processed
 expression values.
}
\usage{data(gbm_VerhaakEtAl)}
\details{
    The data is contained in an \code{ExpressionSet} object called
    \code{gbm_eset} and was obtained using RMA (Irizarry et al. 2003).
}
\source{
Scott A. Armstrong, Jane E. Staunton, Lewis B. Silverman, Rob Pieters, Monique L. den Boer, Mark D. Minden, Stephen E. Sallan, Eric S. Lander, Todd R. Golub and Stanley J. Korsmeyer. MLL translocations specify a distinct gene expression profile that distinguishes a unique leukemia. \emph{Nat Genet} 30:41-47, 2002.
}
\references{
Irizarry, R.A., Hobbs, B., Collin, F., Beazer-Barclay, Y.D., Antonellis, K.J., Scherf, U., and Speed, T.P.
Exploration, normalization, and summaries of high density oligonucleotide array probe level data.
\emph{Biostatistics}, 4(2):249--64, 2003.

Verhaak, R.G.W., Hoadley, K.A., Purdom, E., Wang, V., Qi, Y., et al.
Integrated genomic analysis identifies clinically relevant subtypes of
glioblastoma characterized by abnormalities in PDGFRA, IDH1, EGFR, and
NF1. \emph{Cancer Cell}, 17:98--110.
}
\examples{
data(gbm_VerhaakEtAl)
gbm_eset
head(pData(gbm_eset))
table(gbm_eset$subtype)
}
\keyword{datasets}
