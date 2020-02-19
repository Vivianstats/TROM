\name{ws.trom.orthologs}
\alias{ws.trom.orthologs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Within-species transcriptome mapping using ortholog genes
}
\description{
This function calculates the TROM scores in comparing samples from the same species. TROM score = -log\eqn{_{10}}{10}(Bonferroni-corrected \emph{p}-value from a hypergeometric test), with a minimum value of 0. And the hypergeometric test is performed on the genes having orthologs in the other species.
}
\usage{
ws.trom.orthologs(sp1_sp2_orthologs, sp_gene_expr = NULL, single = TRUE, 
                  sp_gene_expr2 = NULL, z_thre = 1.5, i, 
                  provide = FALSE, gene_lists = NULL, 
                  save_overlap_genes = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sp1_sp2_orthologs}{
a data frame containing ortholog gene pairs between species 1 and 2.
}
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
a numeric value specifiying the Z-score threshold used to select associated orthologous genes, whose Z-scores \eqn{\ge} \code{z_thre}. Defaults to 1.5. This can be specified by users or calculated using \code{\link{choose.z}()}.
}
  \item{i}{
an integer specifying which column of \code{sp1_sp2_orthologs} the species corresponds to. 1 for the first column and 2 for the second column.
}
 \item{provide}{
a Boolean value indicating whether associated geness are user-provided. If \code{provide = TRUE}, the users need to provide lists of genes that they think can represent the transcriptome characteristics of different samples. 
}
 \item{gene_lists}{
an .xlsx file containing user-provided gene lists. It is required when \code{provide = TRUE}.
}
  \item{save_overlap_genes}{
a Boolean value indicating whether the users want to save overlap genes between every two samples from the species to a .xlsx file. If \code{save_overlap_genes = TRUE}, this function outputs the overlap genes (within ortholog genes) to "within-species overlapping genes (within ortholog genes) between sample pairs.xlsx". Defaults to FALSE.
}
}
\details{
If \code{provide = TRUE}, users provide gene lists with \code{gene_lists} to calculate the TROM scores; otherwise, the function will automatically select associated orthologous genes based on the criterion: Z-scores \eqn{\ge} \code{z_thre}.

If \code{single = TRUE}, TROM socres are calculated from single dataset of the species. Users should either specify \code{sp_gene_expr} or provide \code{gene_lists}. If provided, \code{gene_lists} should be a one-sheet Excel file. In the Excel file, rows represent gene ids and columns represent biological samples. Each column of the file stores the user-provided genes corresponding to the sample of that column. Please note that different columns may have different numbers of rows.

If \code{single = FALSE}, TROM socres are calculated from two different datasets of the species. Users should either specify \code{sp_gene_expr} and \code{sp_gene_expr2} or provide \code{gene_lists}. If provided, \code{gene_lists} should be a two-sheet Excel file with the first sheet for one dataset and the second sheet for the other dataset. In each sheet, rows represent gene ids and columns represent biological samples. Each column of the file stores the user-provided genes corresponding to the sample of that column. 

This function outputs the within-species TROM scores into an .xlsx file named "within-species TROM scores (with ortholog genes).xlsx".
}
\value{
A matrix of within-species TROM scores using orthologous genes, where rows and columns correspond to the samples of the species respectively.
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
\code{\link{ws.trom}}, \code{\link{bs.trom}}.
}
\examples{
## Calculating transcriptome overlap measure within D. melanogaster
## using orthologous genes

## The .rda files used in this example can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.
\dontrun{
load("dm_gene_expr.rda")
load("dm_ce_orthologs.rda")
## use single dataset of D. melanogaster
# without user-provided gene lists
dm_trom_orth <- ws.trom.orthologs(sp1_sp2_orthologs = dm_ce_orthologs, 
                                  sp_gene_expr = dm_gene_expr, single = TRUE,
                                  z_thre = 1.5, i = 1, provide = FALSE, 
                                  save_overlap_genes = FALSE)

# with user-provided gene lists
gene_lists <- system.file("dm_associated_orthologs.xlsx", package = "TROM")
dm_trom_orth2 <- ws.trom.orthologs(sp1_sp2_orthologs = dm_ce_orthologs, 
                                   i = 1, provide = TRUE, gene_lists = gene_lists,
                                   save_overlap_genes = FALSE)
                                   
## use two different datasets of D. melanogaster
# without user-provided gene lists
dm_gene_expr2 <- dm_gene_expr[,1:13]
dm_trom_orth3 <- ws.trom.orthologs(sp1_sp2_orthologs = dm_ce_orthologs, 
                                  sp_gene_expr = dm_gene_expr, 
                                  single = FALSE, sp_gene_expr2 = dm_gene_expr2,
                                  z_thre = 1.5, i = 1, 
                                  provide = FALSE, save_overlap_genes = FALSE)

# with user-provided gene lists
dm_trom_orth4 <- ws.trom.orthologs(sp1_sp2_orthologs = dm_ce_orthologs, single = FALSE,
                                   i = 1, provide = TRUE, gene_lists = gene_lists,
                                   save_overlap_genes = FALSE)

}
}
