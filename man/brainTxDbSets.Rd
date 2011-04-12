\name{brainTxDbSets}
\alias{brainTxDbSets}
\docType{data}
\title{Gene sets signatures of brain cell types}
\description{
Gene sets signatures specific to four different brain cell types (astrocytes,
oligodendrocytes, neurons and cultured astroglial cells) derived from murine
models (Cahoy et al. 2008).
}
\usage{data(brainTxDbSets)}
\details{
    The data is contained in an \code{list} object called \code{brainTxDbSets}
    obtained from the Brain Transcriptome Database (Cahoy et al., 2008).
}
\source{
Cahoy, J.D., Emery, B., Kaushal, A., Foo, L.C., Zamanian, J.L. et al.
A transcriptome database for astrocytes, neurons, and oligodendrocytes: a
new resource for understanding brain development and function.
\emph{J Neurosci}, 28:264-278, 2008.
}
\examples{
data(brainTxDbSets)
head(lapply(brainTxDbSets, head))
}
\keyword{datasets}
