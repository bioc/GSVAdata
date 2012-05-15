\name{commonPickrellHuang}
\alias{commonPickrellHuang}
\alias{huangArrayRMAnoBatchCommon_eset}
\alias{pickrellCountsArgonneCQNcommon_eset}
\alias{pickrellCountsYaleCQNcommon_eset}

\docType{data}
\title{
Matching microarray and RNA-seq data from human lymphoblastoid cell lines
}
\description{
\code{ExpressionSet} objects containing microarray and RNA-seq count data for
11,508 matching Entrez genes from 36 samples of lymphoblastoid cell lines derived
from unrelated Nigerian individuals. These microarray and count data are employed
in the vignette of the package \code{GSVA} Hanzelmann et al. (submitted). The
original experimental data was published by Huang et al. (2007) and Pickrell et al.
(2010).
}
\usage{
data(commonPickrellHuang)
}
\format{
  
  \code{huangArrayRMAnoBatchCommon_eset}: \code{ExpressionSet} object containing filtered,
                        normalized and batch-removed microarray expression values for 11,508 Entrez
                        genes from 36 unrelated Nigerian individuals.

  \code{pickrellCountsArgonneCQNcommon_eset}: \code{ExpressionSet} object containing filtered
                            and normalized RNA-seq read counts for 11,508 Entrez
                            genes from 36 unrelated Nigerian individuals. This table of
                            counts corresponds to RNA-seq data produced at the Argonne
                            sequencing center (see Pickrell et al., 2010).

  \code{pickrellCountsYaleCQNcommon_eset}: \code{ExpressionSet} object containing filtered
                            and normalized RNA-seq read counts for 11,508 Entrez
                            genes from 36 unrelated Nigerian individuals. This table of
                            counts corresponds to RNA-seq data produced at the Yale
                            sequencing center (see Pickrell et al., 2010).
}

\details{
The microarray data was processed from the raw CEL files available at
\url{http://www.ncbi.nlm.nih.gov/geo} under accession GSE7792. First, only
Yoruba samples were considered. Second, data was processed using the Bioconductor
oligo package. Quality assessment was performed by calculating NUSE and RLE
diagnostics (Bolstad et al., 2005) and discarding those samples that either of the
two reported diagnostics was considered below a minimum quality threshold. Third, most
samples formed part of family trios and only samples belonging to father or mother
were kept. Fourth, using the RMA algorithm (Irizarry et al., 2003) implemented in the
\code{rma()} function from the \code{oligo} package with argument \code{target="core"},
expression values were background corrected, normalized and summarized into Affymetrix
transcript clusters. Fifth, using the \code{getNetAffx} function from the \code{oligo}
package, Affymetrix transcript cluster identifiers were translated into Entrez Gene
identifiers resolving duplicated assignments by keeping the transcript cluster with
largest expression variability measured by its interquartile range (IQR).

At this point an expression data matrix of 17,324 Entrez
genes by 59 samples was obtained and using the scanning date of each CEL file samples
were grouped into 5 batches stored in the phenotypic variable \code{Batch} within
the resulting \code{ExpressionSet}. Batch effect was removed by using the
QR-decomposition method implemented in the \code{removeBatchEffect()} function from
the package \code{limma} while keeping the sex-specific expression effect by setting
the gender sample indicator variable within the design matrix argument. Finally,
samples and genes were further filtered to match those from the RNA-seq tables of counts.

The RNA-seq data was obtained by directly downloading the tables of counts processed
by Pickrell et al. (2010) from \url{http://eqtl.uchicago.edu/RNA_Seq_data/results},
which initially consisted of 41,466 Ensembl genes by 80 and 81 samples corresponding to
the RNA-seq data obtained at the Argonne and Yale sequencing centers, respectively.
Some of the samples (11 from Argonne and 12 from Yale) were prepared and sequenced
twice within each sequencing center. In these cases we kept the sample of deeper
coverage obtaining a final number of 69 samples on each table. We further filtered
genes with low expression by discarding those with a mean of less than 0.5 counts
per million calculated in log2 scale resulting in tables of counts with 17,607 genes
(Argonne) and 17,843 genes (Yale) by 69 samples and we kept those genes common to
both tables (17,324). Next, we normalized these two tables of counts adjusting for
gene length and G+C content using the Bioconductor package \code{cqn} (Hansen et al., 2012).
The corresponding gene length and G+C content information was extracted from data
deposited at the same site from were the tables of counts were downloaded. We further
filtered these two normalized tables of counts in order to match the genes and samples
obtained after processing the LCL microarray data from Huang et al. (2007). This step
required first to translate Ensembl gene identifiers into Entrez gene identifiers and
second to match gene and sample identifiers between microarray and RNA-seq data. After
these two steps we obtained the two final tables of counts of 11,508 Entrez genes by
36 samples included in this package.
}

\source{
  R.S. Huang, S. Duan, W.K. Bleibel, E.O. Kistner, W. Zhang, T.A. Clark,
  T.X. Chen, A.C. Schweitzer, J.E. Blume, N.J. Cox and M.E. Dolan,
  \emph{Proc. Natl. Acad. Sci. USA}, 104(23):9758-9763, 2007.

  J.K. Pickrell, J.C. Marioni, A.A Pai, J.F. Degner, B.E. Engelhardt,
  E. Nkadori, J.B Veyrieras, M. Stephens, Y. Gilad, and J.K. Pritchard,
  \emph{Nature}, 464:768-772, 2010.
}
\references{
  B.M. Bolstad, F. Collin, K. Brettschneider, L. Simpson, R.A. Irizarry, and T.P. Speed.
  Quality assessment of Affymetrix GeneChip data. In \emph{Bioinformatics and
  Computational Biology Solutions Using R and Bioconductor}, pg. 33--48, Springer, 2005.

  K.D. Hansen, R.A. Irizarry and Z. Wu. Removing technical variability
  in RNA-seq data using conditional quantile normalization. \emph{Biostatistics}, 2012.

  R.A. Irizarry, B. Hobbs, F. Collin, Y.D. Beazer-Barclay, K.J. Antonellis, U. Scherf and T.P. Speed.
  Exploration, normalization, and summaries of high density oligonucleotide array probe level data.
  \emph{Biostatistics}, 4(2):249--64, 2003.

  S. Haenzelmann, J. Guinney and R. Castelo. GSVA: Gene Set Variation Analysis for
  microarray and RNA-Seq data, \emph{submitted}.
}
\seealso{
  \code{\link{genderGenesEntrez}}
  }

\examples{
suppressMessages(library(Biobase))
data(commonPickrellHuang)
dim(huangArrayRMAnoBatchCommon_eset)
dim(pickrellCountsArgonneCQNcommon_eset)
dim(pickrellCountsYaleCQNcommon_eset)
table(huangArrayRMAnoBatchCommon_eset$Gender)
table(pickrellCountsArgonneCQNcommon_eset$Gender)
table(pickrellCountsYaleCQNcommon_eset$Gender)
stopifnot(identical(featureNames(huangArrayRMAnoBatchCommon_eset),
                    featureNames(pickrellCountsArgonneCQNcommon_eset)))
stopifnot(identical(sampleNames(huangArrayRMAnoBatchCommon_eset),
                    sampleNames(pickrellCountsArgonneCQNcommon_eset)))
}
\keyword{datasets}
