\name{c2BroadSets}
\alias{c2BroadSets}
\docType{data}
\title{C2 collection of canonical pathways from MSigDB 3.0}
\description{
C2 Broad Sets.
}
\usage{data(c2BroadSets)}
\details{
    The data is contained in an \code{GeneSetCollection} object called
    \code{c2BroadSets} obtained by parsing the file \code{c2.all.v3.0.entrez.gmt},
    downloaded from \url{http://www.broadinstitute.org/gsea}, using the
    \code{getGmt()} function from the \code{GSEABase} package.
}
\source{
Subramanian, Tamayo, et al. \emph{PNAS}, 102:15545-15550, 2005.

Mootha, Lindgren, et al. \emph{Nat Genet}, 34:267-273, 2003.
}
\examples{
data(c2BroadSets)
c2BroadSets
}
\keyword{datasets}
