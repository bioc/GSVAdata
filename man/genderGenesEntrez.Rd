\name{genderGenesEntrez}
\alias{genderGenesEntrez}
\alias{msYgenesEntrez}
\alias{XiEgenesEntrez}

\docType{data}
\title{
Entrez genes with documented sex-specific expression
}
\description{
Entrez genes with documented sex-specific expression.
}
\usage{data(genderGenes)}
\format{
  
  \code{msYgenesEntrez}: Entrez gene identifiers from genes belonging to the
                         male-specific region of chromosome Y (Skaletsky et al., 2003).

  \code{XiEgenesEntrez}: Entrez gene identifiers from genes located in the X chromosome
                         and which have been reported to escape X-inactivation
                         (Carrel and Willard, 2005).
}

\details{
These are two vectors of Entrez gene identifiers corresponding to genes with
sex-specific expression documented by Skaletsky et al. (2003) and
Carrel and Willard (2005).
}

\source{
H.S. Skaletsky, T. Kuroda-Kawaguchi, P.J. Minx, H.S. Cordum, L. Hillier,
L.G. Brown, S. Repping, T. Pyntikova, J. Ali, T. Bieri, A. Chinwalla,
A. Delehaunty, K. Delehaunty, H. Du, G. Fewell, L. Fulton, T. Graves,
S.F. Hou, P. Latrielle, S. Leonard, E. Mardis, R. Maupin, J. McPherson,
T. Miner, W. Nash, C. Nguyen, P. Ozersky, K. Pepin, S. Rock, T. Rohlfing,
K. Scott, B. Schultz, C. Strong, A. Tin-Wollam, S.P. Yang, R.H. Waterston,
R.K. Wilson, S. Rozen, and D.C. Page. The male-specific region of the
human Y chromosome is a mosaic of discrete sequence classes.
\emph{Nature}, 423:825--837, 2003.

L. Carrel and H.F. Willard. X-inactivation profile reveals extensive
variability in X-linked gene expression in females.
\emph{Nature}, 434:400--404, 2005.
}

\examples{
data(genderGenesEntrez)
length(msYgenesEntrez)
length(XiEgenesEntrez)
}
\keyword{datasets}
