\name{TROM-package}
\alias{TROM-package}
\alias{TROM}
\docType{package}
\title{
Transcriptome Overlap Measure
}
\description{
\tabular{ll}{
\code{select.associated.genes} \tab Select the associated genes of different biological samples \cr
\code{select.associated.orthologs} \tab Select the associated genes of different biological samples among \cr
\tab the genes with orthologs in the other species \cr
\code{choose.z} \tab Choose the suggested threshold for Z-scores \cr
\code{ws.trom} \tab Within-species transcriptome mapping  \cr
\code{ws.trom.orthologs} \tab Within-species transcriptome mapping using only ortholog genes \cr
\code{bs.trom} \tab Between-species transcriptome mapping \cr
\code{heatmap.3} \tab Plot the resulting within- or between-species TROM scores in a heatmap \cr
\code{find.top.GO.terms} \tab Find top enriched GO terms \cr
\code{find.top.GO.slim.terms}  \tab Find top enriched GO slim terms
}

}
\details{
\tabular{ll}{
Package: \tab TROM\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2016-08-29\cr
License: \tab GPL-2\cr
}
}
\author{
Jingyi Jessica Li, Wei Vivian Li

Maintainer: Jingyi Jessica Li \email{jli@stat.ucla.edu}
}
\references{
Li WV, Chen Y and Li JJ (2016). TROM: A Testing-Based Method for Finding Transcriptomic Similarity of Biological Samples. Statistics in Biosciences. DOI: 10.1007/s12561-016-9163-y

Li JJ, Huang H, Bickel PJ, & Brenner SE (2014). Comparison of \emph{D. melanogaster} and \emph{C. elegans} developmental stages, tissues, and cells by modENCODE RNA-seq data. \emph{Genome Research}, 24(7), 1086-1101.
}
\keyword{ package }

\examples{
## using TROM to map developmental stages of D. melanogaster and C. elegans

## The .rda files used in this example can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.
\dontrun{
load("dm_gene_expr.rda")
load("ce_gene_expr.rda")
load("dm_ce_orthologs.rda")
dm_ce_trom <- bs.trom(sp1_gene_expr = dm_gene_expr,
                      sp2_gene_expr = ce_gene_expr,
                      sp1_sp2_orthologs = dm_ce_orthologs, z_thre=1.5,
                      provide=FALSE)
heatmap.3(   dm_ce_trom,
             max_score = 6,
             Rowv = NULL,
             Colv = NULL,
             dendrogram = c("none"),
             distfun = dist,
             hclustfun = hclust,
             xlab = "worm stages",
             ylab = "fly stages",
             main = "D. melanogaster vs. C. elegans Stage Mapping",
             key = TRUE,
             keysize = 1,
             trace = "none",
             density.info = c("none"),
             col = terrain.colors(120),
  )
  }
}
