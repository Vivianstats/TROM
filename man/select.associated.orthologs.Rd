\name{select.associated.orthologs}
\alias{select.associated.orthologs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Select the associated genes for biological samples of a species among the genes with orthologs in the other species
}
\description{
\code{select.associated.orthologs()} finds the ids of associated genes of a species within orthologous genes based on criterion: Z-scores \eqn{\ge} \code{z_thre} and saves the results to an .xlsx file.
}
\usage{
select.associated.orthologs(sp_gene_expr, sp1_sp2_orthologs, 
                            z_thre = 1.5, i, save = TRUE, 
                            plot_distribution = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sp_gene_expr}{
a data frame containing gene expression estimates of the species; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs.
}
  \item{sp1_sp2_orthologs}{
a data frame containing ortholog gene pairs between species 1 and 2.
}
  \item{z_thre}{
a numeric value specifiying the Z-score threshold used to select associated genes, whose Z-scores \eqn{\ge} \code{z_thre}. Defaults to 1.5. This can be specified by users or calculated using \code{\link{choose.z}()}.
}
  \item{i}{
an integer specifying which column of \code{sp1_sp2_orthologs} the species corresponds to. 1 for the first column and 2 for the second column.
}
  \item{save}{
a Boolean value specifying whether to save the associated orthologs to an Excel file. If \code{save = TRUE}, this function saves the results to an Excel file named "associated genes within ortholog genes.xlsx". 
}
  \item{plot_distribution}{
a Boolean value specifying whether to output the distribution of the number of associated orthologs across different samples. If \code{plot_distribution = TRUE}, this function outputs a barplot of the number of associated orthologs for each sample in a pdf file named "number of sample associated orthologous genes.pdf".
}
}
\value{
A data frame containing the associated genes within orthologous genes of each samples from the specified species. Every column in the data frame stores the associated gene IDs for the corresponding sample.
}
\references{
Li WV, Chen Y and Li JJ (2016). TROM: A Testing-Based Method for Finding Transcriptomic Similarity of Biological Samples. Statistics in Biosciences. DOI: 10.1007/s12561-016-9163-y

Li JJ., Huang H, Bickel PJ, & Brenner SE (2014). Comparison of \emph{D. melanogaster} and \emph{C. elegans} developmental stages, tissues, and cells by modENCODE RNA-seq data. \emph{Genome Research}, 24(7), 1086-1101.
}
\author{
Jingyi Jessica Li, Wei Vivian Li
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{select.associated.genes}}
}
\examples{
## Find the associaed genes of D. melanogaster samples
## among the D. melanogaster genes having orthologs in C.elegans

## dm_gene_expr.rda and dm_ce_orthologs.rda can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.
\dontrun{
load("dm_gene_expr.rda")
load("dm_ce_orthologs.rda")
dm_associated_orthologs <- select.associated.orthologs(sp_gene_expr = dm_gene_expr, 
                           sp1_sp2_orthologs = dm_ce_orthologs, z_thre = 1.5, 
                           i = 1, save = TRUE, plot_distribution = TRUE)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

