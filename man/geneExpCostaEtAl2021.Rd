\name{geneExpCostaEtAl2021}
\alias{geneExpCostaEtAl2021}
\docType{data}
\title{RNA-seq Data by Costa et al. (2021)}
\description{
 Normalized log-CPM units of expression derived from the bulk RNA sequencing
 (RNA-seq) data published by Costa et al. (2021). The RNA-seq data was obtained
 by extracting and sequencing total RNA from archived neonatal dried blood spots
 (DBS) specimens from 21 extremely low gestational age newborns (ELGANs, < 28
 weeks of gestation). The DBS specimens were obtained from 8 females and 13 males,
 among which 10 where exposed to a fetal inflammatory response (FIR) before birth,
 and 11 were not exposed.
}
\usage{data(geneExpCostaEtAl2021)}
\details{
    The data is contained in an \code{SummarizedExperiment} object called
    \code{geneExpCostaEtAl2021} obtained as follows:

    \itemize{
      \item Raw 2x75nt paired-end reads in FASTQ files were aligned to the
            GRCh38 version of the reference human genome, without alternate
            locus scaffolds (GCA_000001405.15) and including human decoy
            sequences from hs38d1 (GCA_000786075.2), using STAR version 2.6.0c
            (Dobin et al., 2013) with default parameters, except for
            \code{--peOverlapNbasesMin 10} and \code{--sjdbOverhang 74}.
      \item Aligned reads in BAM files were reduced to a table of counts of
            25,221 genes by 84 samples using gene annotations from Gencode v24
            and the R/Bioconductor package GenomeAlignments version 1.16.0, and
            its function \code{summarizeOverlaps}. We used specific arguments in
            the call to this function to restrict the count of genic reads to
            only those that fell entirely within the exonic regions and aligned
            to a unique site on the genome, to reflect library preparation
            protocols, and to avoid counting reads without a matching pair or
            overlapping multiple features.
      \item Lowly-expressed genes were filtered out by discarding those that
            did not show a minimum reliable level of expression of 10 counts
            per million reads of the smallest library size, in at least 6
            samples. This filtering step led to a final table of counts of
            11,279 genes by 21 samples.
      \item Normalized log-CPM units of expression were obtained by using the
            edgeR package (Robinson et al., 2010) as follows. First, we
            calculated library factors using the TMM algorithm implemented in
            the function \code{calcNormFactors()}, and second we used the
            function \code{cpm()} with default parameters, except for
            \code{log=TRUE}.
    }
}
\source{
D. Costa, N. Bonet, A. Solé, J.M. González de Aledo-Castillo, E. Sabidó,
F. Casals, C. Rovira, A. Nadal, J.L. Marín, T. Cobo and R. Castelo. Genome-wide
postnatal changes in immunity following fetal inflammatory response.
\emph{FEBS Journal}, 288:2311-2331, 2021. \url{https://doi.org/10.1111/febs.15578}.
}
\references{
Dobin A, Davis CA, Schlesinger F, Drenkow J, Zaleski C, Jha S, Batut P,
Chaisson M, and Gingeras TR. STAR: ultrafast universal RNA-seq aligner.
\emph{Bioinformatics}, 29:15-–21, 2013.

Robinson MD, McCarthy DJ, Smyth GK. edgeR: a Bioconductor package for
differential expression analysis of digital gene expression data.
\emph{Bioinformatics}, 26:139--140, 2010.
}
\examples{
data(geneExpCostaEtAl2021)
geneExpCostaEtAl2021
}
\keyword{datasets}
