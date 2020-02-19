\name{choose.z}
\alias{choose.z}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Choose the suggested threshold of Z-scores
}
\description{
This function calculates the suggested \code{z_thre} for within-species comparison. The suggested \code{z_thre} gives the most sparse but still stable correspondance map of the transcriptomes.
}
\usage{
choose.z(sp_gene_expr, mode = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sp_gene_expr}{
a data frame containing gene expression estimates of the species; rows correspond to genes; columns (from the second to the last) correspond to samples, with the first column as gene IDs. Required.
}
 \item{mode}{
a Boolean value specifying the method used to select the threshold. If \code{mode = TRUE}, threshold is selected based on the mode of a density function; otherwise, (mode + sd) is used. Please refer to the reference for more details.
}
}
\details{
This function calculates the suggested \code{z_thre} for the species corresponding to \code{sp_gene_expr} to select associated genes and calculate TROM scores. The users can tune \code{z_thre} based on the mapping results calculated from the suggested \code{z_thre}.
}
\value{
A numeric vector of length one containing the suggested \code{z_thre}.
}

\references{
\url{https://arxiv.org/abs/1601.05158}

Li WV, Chen Y and Li JJ (2016). TROM: A Testing-Based Method for Finding Transcriptomic Similarity of Biological Samples. Statistics in Biosciences. DOI: 10.1007/s12561-016-9163-y
}

\author{
Jingyi Jessica Li, Wei Vivian Li}


\seealso{
\code{\link{ws.trom}}, \code{\link{ws.trom.orthologs}}
}
\examples{
## Calculating the suggested z_thre for first 15 stages of D. melanogaster 

## dm_gene_expr.rda can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip
\dontrun{
load("dm_gene_expr.rda")
z_thre1 <- choose.z(dm_gene_expr[, 1:16], mode = FALSE)
z_thre2 <- choose.z(dm_gene_expr[, 1:16], mode = TRUE)
}
}