\name{GO_slim_id}
\alias{GO_slim_id}
\docType{data}
\title{
GO slim IDs
}
\description{
\code{GO_slim_id} stores the GO IDs of all the GO slim terms.
}
\usage{data("GO_slim_id")}
\format{
  The format is:
 chr [1:205] "GO:0000003" "GO:0019952" "GO:0050876" "GO:0000228" "GO:0000229" ...
}

\source{
\url{http://www.geneontology.org/ontology/subsets/goslim_generic.obo}
}
\references{
Li JJ, Huang H, Bickel PJ, & Brenner SE (2014). Comparison of \emph{D. melanogaster} and \emph{C. elegans} developmental stages, tissues, and cells by modENCODE RNA-seq data. \emph{Genome Research}, 24(7), 1086-1101.
}
\examples{
data(GO_slim_id)
head(GO_slim_id)
}
\keyword{datasets}
