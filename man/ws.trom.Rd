\name{ws.trom}
\alias{ws.trom}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Within-species transcriptome mapping
}
\description{
This function calculates the TROM scores in comparing/mapping samples from the same species. TROM score = -log\eqn{_{10}}{10}(Bonferroni-corrected \emph{p}-value from a hypergeometric test), with a minimum value of 0.
}
\usage{
ws.trom(sp_gene_expr = data.frame(), single = TRUE, sp_gene_expr2 = NULL,
        z_thre = 1.5, provide = FALSE, gene_lists = "", 
        save_overlap_genes = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sp_gene_expr}{
a data frame containing gene expression estimates of the species; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs. Not needed if \code{provide = TRUE}.
}
  \item{single}{
a Boolean value indicating whether the within-species comparison will be conducted on a single dataset. If \code{single = FALSE}, the users need to provide \code{sp_gene_expr2}. Or if \code{provide = TRUE},  users need have a second sheet in the .xlsx file (that is to be supplied into \code{gene_lists}) to specify the second set of gene lists corresponding to another set of biological samples of the same species. Defaults to \code{TRUE}.
}
  \item{sp_gene_expr2}{
\code{NULL} (default) or a data frame containing gene expression estimates of the species; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs.
}
  \item{z_thre}{
a numeric value specifiying the Z-score threshold used to select associated genes, whose Z-scores \eqn{\ge} \code{z_thre}. Defaults to 1.5. This can be specified by users or calculated using \code{\link{choose.z}()}.
}
  \item{provide}{
a Boolean value indicating whether associated genes are user-provided. If \code{provide = TRUE}, the users need to provide lists of genes that they think can represent the transcriptome characteristics of different samples. 
}
  \item{gene_lists}{
an .xlsx file containing user-provided gene lists. It is required when \code{provide = TRUE}.
}
  \item{save_overlap_genes}{
a Boolean value indicating whether the users want to save overlap genes between every two samples from the species to an .xlsx file. If \code{save_overlap_genes = TRUE}, this function outputs the overlap genes to "within-species overlapping genes between sample pairs.xlsx". Defaults to FALSE.
}
}
\details{
If \code{provide = TRUE}, users provide gene lists with \code{gene_lists} to calculate the TROM scores; otherwise, the function will automatically select associated genes based on the criterion: Z-scores \eqn{\ge} \code{z_thre}.

If \code{single = TRUE}, TROM socres are calculated from single dataset of the species. Users should either specify \code{sp_gene_expr} or provide \code{gene_lists}. If provided, \code{gene_lists} should be a one-sheet Excel file. In the Excel file, rows represent gene ids and columns represent biological samples. Each column of the file stores the user-provided genes corresponding to the sample of that column. Please note that different columns may have different numbers of rows.

If \code{single = FALSE}, TROM socres are calculated from two different datasets of the species. Users should either specify \code{sp_gene_expr} and \code{sp_gene_expr2} or provide \code{gene_lists}. If provided, \code{gene_lists} should be a two-sheet Excel file with the first sheet for one dataset and the second sheet for the other dataset. In each sheet, rows represent gene ids and columns represent biological samples. Each column of the file stores the user-provided genes corresponding to the sample of that column. 

This function outputs the within-species TROM scores into an .xlsx file named "within-species TROM scores.xlsx".
}
\value{
A matrix of within-species TROM scores, where rows and columns correspond to the samples of the species respectively.
}
\references{
Li WV, Chen Y and Li JJ (2016). TROM: A Testing-Based Method for Finding Transcriptomic Similarity of Biological Samples. Statistics in Biosciences. DOI: 10.1007/s12561-016-9163-y

Li JJ, Huang H, Bickel PJ, & Brenner SE (2014). Comparison of \emph{D. melanogaster} and \emph{C. elegans} developmental stages, tissues, and cells by modENCODE RNA-seq data. \emph{Genome Research}, 24(7), 1086-1101.
}
\author{
Jingyi Jessica Li, Wei Vivian Li
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{bs.trom}}, \code{\link{ws.trom.orthologs}}
}
\examples{
## Calculating transcriptome overlap measure within D. melanogaster 

## dm_gene_expr.rda and dm_tissue_expr.rda
## can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip

\dontrun{
load("dm_gene_expr.rda")
## without user-provided gene lists
# use single dataset
dm_trom <- ws.trom(sp_gene_expr = dm_gene_expr, z_thre = 1.5, 
                     provide = FALSE, save_overlap_genes = TRUE)

# use two different dataset
# calculate TROM scores between timecourse and tissue/cell line 
# data within D. melanogaster 
load("dm_tissue_expr.rda")
dm_trom2 <- ws.trom(sp_gene_expr = dm_gene_expr, single = FALSE, 
                    sp_gene_expr2 = dm_tissue_expr, z_thre = 1.5,
                    provide = FALSE, save_overlap_genes = FALSE)
                       
## with user-provided gene lists
gene_lists <- system.file("dm_associated_genes.xlsx", package = "TROM")
dm_trom3 <- ws.trom(provide = TRUE, gene_lists = gene_lists)
}
}

