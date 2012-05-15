\name{annotEntrez220212}
\alias{annotEntrez220212}

\docType{data}
\title{
Annotation data on gene length and G+C content from NCBI
}
\description{
Annotation data for human genes defined by Entrez identifiers and
downloaded on 22/02/2012.
}
\usage{data(annotEntrez220212)}
\format{
  
  \code{Length}: Length of the longest cDNA of this gene.

  \code{GCcontent}: G+C content of the longest cDNA of this gene.
}

\details{
All human mRNAs were downloaded from NCBI on 22/02/12 by going first to the
taxonomy browser, select "Homo Sapiens", then select mRNAs, then follow the
link on "manage filters" and made sure that only mRNAs is checked. Then, we selected
FASTA format and sent it to a file. We also downloaded the NCBI Entrez Gene ID
to NCBI Accession mapping from
\url{ftp://ftp.ncbi.nih.gov/gene/DATA/gene2accession.gz} which we used to group
mRNA transcripts by Entrez Gene identifier. Finally, for each Entrez Gene identifier
we picked the longest mRNA and stored its length and G+C content in a data frame
called \code{annotEntrez220212} whose row names indicate the corresponding Entrez 
Gene identifier.
}

\source{
  NCBI: \url{http://www.ncbi.nlm.nih.gov}
}

\examples{
data(annotEntrez220212)
dim(annotEntrez220212)
head(annotEntrez220212)
}
\keyword{datasets}
