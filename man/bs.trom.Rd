\name{bs.trom}
\alias{bs.trom}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Between-species transcriptome mapping
}
\description{
This function calculates the TROM scores in comparing samples from two different species. TROM score = -log\eqn{_{10}}{10}(Bonferroni-corrected \emph{p}-value from a hypergeometric test), with a minimum value of 0.
}
\usage{
bs.trom(sp1_gene_expr = NULL, sp2_gene_expr = NULL, sp1_sp2_orthologs, 
        z_thre = 1.5, provide = FALSE, gene_lists = NULL,
        save_overlap_genes = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{sp1_gene_expr}{
a data frame containing gene expression estimates of species 1; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs. Not needed if \code{provide = TRUE}.
}
  \item{sp2_gene_expr}{
a data frame containing gene expression estimates of species 2; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs. Not needed if \code{provide = TRUE}.
}
  \item{sp1_sp2_orthologs}{
a data frame containing ortholog gene pairs between species 1 and 2: rows are ortholog pairs; columns are the two species.
}
  \item{z_thre}{
a numeric value specifiying the Z-score threshold used to select associated genes, whose Z-scores \eqn{\ge} \code{z_thre}. This can be specified by users or calculated using \code{\link{choose.z}()}.
}
  \item{provide}{
a boolean value indicating whether associated genes are user-provided. If \code{provide = TRUE}, the users need to provide lists of genes that they think can represent the transciptome characteristics of different samples. 
}
  \item{gene_lists}{
an .xlsx file containing user-provided gene lists. It is required when \code{provide = TRUE}.
}
  \item{save_overlap_genes}{
a Boolean value indicating whether the users want to save overlapping gene orthologs between every two samples from species 1 and 2 to an .xlsx file. If \code{save_overlap_genes = TRUE}, this function outputs the genes of species 1 in the overlapping orthologs to a file named "between-species overlapping genes (of species 1) between sample pairs.xlsx", and outputs the genes of species 2 in the overlappig orthologs to a file named "between-species overlapping genes (of species 2) between sample pairs.xlsx".
}
}
\details{
If \code{provide = TRUE}, the users are required to specify \code{gene_lists} as a path to an.xlsx file containing gene lists to be used for transcriptome mapping and calculating the TROM scores; otherwise, the function will automatically select associated genes based on the criterion: Z-scores \eqn{\ge} \code{z_thre}.

If specified, \code{gene_lists} should be a two-sheet Excel file with the first sheet for species 1 and the second sheet for species 2. In each sheet, rows represent gene ids and columns represent biological samples. Each column of the file stores the user-provided genes corresponding to the sample of that column.  Please note that different columns may have different numbers of rows.

This function outputs the between-species TROM scores into an .xlsx file named "between-species TROM scores.xlsx".
}
\value{
A matrix of between-species TROM scores, where rows correspond to the samples of species 1 and columns correspond to the samples of species 2.
}
\references{
Li WV, Chen Y and Li JJ (2016). TROM: A Testing-Based Method for Finding Transcriptomic Similarity of Biological Samples. Statistics in Biosciences. DOI: 10.1007/s12561-016-9163-y

Li JJ, Huang H, Bickel PJ, & Brenner SE (2014). Comparison of \emph{D. melanogaster} and \emph{C. elegans} developmental stages, tissues, and cells by modENCODE RNA-seq data. \emph{Genome Research}, 24(7), 1086-1101.
}
\author{
Jingyi Jessica Li and Wei Vivian Li
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{ws.trom}}
}
\examples{
## Calculating transcriptome overlap measure between 
## D. melanogaster and C .elegans

## The .rda files used in this example can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.
\dontrun{
load("dm_gene_expr.rda")
load("ce_gene_expr.rda")
load("dm_ce_orthologs.rda")

## Without user-provided gene lists
dm_ce_trom <- bs.trom(sp1_gene_expr = dm_gene_expr, 
                     sp2_gene_expr = ce_gene_expr, 
                     sp1_sp2_orthologs = dm_ce_orthologs, 
                     z_thre = 1.5, 
                     provide = FALSE, save_overlap_genes = FALSE)
                     
## With user-provided gene lists
## compare the first four stages of D. melanogaster and C .elegans
genelists <- system.file("dm_ce_genelists.xlsx", package = "TROM")
dm_ce_trom2 <- bs.trom(sp1_sp2_orthologs = dm_ce_orthologs, provide = TRUE, 
                     gene_lists = genelists)}

}
