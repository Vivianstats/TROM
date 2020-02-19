\name{find.top.GO.slim.terms}
\alias{find.top.GO.slim.terms}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Find top enriched GO slim terms 
}
\description{
This function finds the top enriched Gene Ontology (functional annotation) slim terms in gene lists.
}
\usage{
find.top.GO.slim.terms(gene_lists, all_genes, GOmappingfile, output_file, 
                       topNum = 20, GO_slim_id, gene = "id")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{gene_lists}{
an .xlsx file giving the lists of user-provided genes, either user-specified genes or associated genes found by \code{select.associated.genes()} or \code{select.} \code{associated.orthologs()}.
}
  \item{all_genes}{
a character verctor giving the population of all genes.
}
  \item{GOmappingfile}{
a character giving the path of GO mapping file, which contains the information of the mapping of gene IDs to GO terms.
}
  \item{output_file}{
a character specifying the name of a .txt file to store the output of this function: top enriched GO slim terms in the input gene lists.
}
  \item{topNum}{
a integer specifying the number of top GO terms to be included in the results. Defaults to 20.
}
  \item{GO_slim_id}{
a character vector containing the GO IDs of all GO slim terms.
}
%  \item{heatmap}{
%a Boolean value specifying whether to output the heatmap for the top enriched GO slim terms. The heatmap gives the enrichment results across all samples of the GO slim terms that are at least top enriched in one biological sample.  If \code{heatmap = TRUE}, this function outputs a pdf file named "Top enriched GO slim terms across samples.pdf".
%}
  \item{gene}{
a character specifying gene name used in data. "id" (default) or "symbol".
}
}
\details{
To use this function, please download the GO mapping file of the species of interest from \url{http://geneontology.org/page/download-annotations}. Please make sure that this file is in R's working directory and set \code{GOmappingfile} to the file's name.

\code{gene_lists} can be either the output .xlsx file of \code{select.associated.orthologs()}, the output .xlsx file of \code{select.associated.genes()} or an .xlsx file of the same format that contains the user-provided gene lists. If users want to use the overlap genes or overlap orthologs, they can find them in the output .xlsx files of \code{ws.trom()}, \code{ws.trom.orthologs()} or \code{bs.trom()}. Users can select the columns they are interested in and compact them into a new .xlsx file, and then pass the name of the new .xlsx file to \code{gene_lists}.

Users can check the .txt file \code{output_file} for the results of top enriched GO slim terms.
}
\value{
A list of length 6\eqn{\times}{*}(number of biological samples). List elements are ordered in correspondence with the biological samples, e.g., the first 6 elements in the list correspond to the first sample, etc. For each sample, there are
  \tabular{l}{
a character vector giving the top GO slim IDs.\cr
a character vector giving the corresponding the top GO slim terms. \cr
a vector giving the number of occurences of the top GO slim IDs in the population.\cr
a vector giving the observed number of occurences of the top GO slim IDs in the sample.\cr
a vector giving the expected number of occurences of the top GO slim IDs in the sample.\cr
a character vector giving the \emph{p}-values from a hypergeometric test.\cr
}
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
\code{\link{find.top.GO.terms}}
}
\examples{
## Find top enriched GO terms in the developmental stages of D. melanogaster

## To run this example, please download the file "gene_association_fb_example.txt" from 
## https://ucla.box.com/GO-mapping-file.
## Please move "gene_association_fb_example.txt" to R's working directory.

## dm_gene_expr.rda can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.

\dontrun{
load("dm_gene_expr.rda")
dm_genes_all <- as.character(dm_gene_expr[,1]) 
data(GO_slim_id)
gene_lists <- system.file("dm_associated_genes.xlsx", package = "TROM")
dm_stage_GO_slim <- find.top.GO.slim.terms(
gene_lists = gene_lists,
all_genes = dm_genes_all,
GOmappingfile = "gene_association_fb_example.txt",
output_file = "top 20 enriched GO slim terms in fly stage-associated genes.txt",
GO_slim_id = GO_slim_id,
topNum = 20,
heatmap = FALSE)}
}


