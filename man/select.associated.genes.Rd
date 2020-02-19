\name{select.associated.genes}
\alias{select.associated.genes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Select the associated genes for biological samples of a species
}
\description{
\code{select.associated.genes()} finds the ids of associated genes of a species based on criterion: Z-scores \eqn{\ge} \code{z_thre} and saves the results to an .xlsx file.
}
\usage{
select.associated.genes(sp_gene_expr, z_thre = 1.5, 
                        save = TRUE, plot_distribution = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{sp_gene_expr}{
a data frame containing gene expression estimates of the species; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs.
}
  \item{z_thre}{
a numeric value specifiying the Z-score threshold used to select associated genes, whose Z-scores \eqn{\ge} \code{z_thre}. Defaults to 1.5. This can be specified by users or calculated using \code{\link{choose.z}()}.
}
  \item{save}{
a Boolean value specifying whether to save the associated genes to an Excel file. If \code{save = TRUE}, this function saves the results to an Excel file named "associated genes.xlsx".  
}
  \item{plot_distribution}{
a Boolean value specifying whether to output the distribution of the number of associated genes across different samples. If \code{plot_distribution = TRUE}, this function outputs a barplot of the number of associated genes for each sample in a pdf file named "number of sample associated genes.pdf".
}
}
\value{
a data frame containing the associated genes of every sample from the species. Every column in the data frame stores the associated gene IDs for the corresponding sample.
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
\code{\link{select.associated.orthologs}}
}

\examples{
## Find the associaed genes of D. melanogaster

## dm_gene_expr.rda can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.

\dontrun{
load("dm_gene_expr.rda")
dm_associated_genes <- select.associated.genes(sp_gene_expr = dm_gene_expr, 
                       z_thre = 1.5, save = TRUE, 
                       plot_distribution = TRUE)           
}
}

