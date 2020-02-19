\name{heatmap.3}
\alias{heatmap.3}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot TROM scores in a heatmap.
}
\description{
\code{heatmap.3} plots the TROM scores obtained from mapping different biological samples. Larger TROM scores are shown in darker colors, corresponding to a scale showing -log\eqn{_{10}}{10} (transformed Bonferroni corrected \emph{p}-values) saturated at a default value of 6. The TROM scores are calculated from function \code{ws.trom()} or \code{bs.trom()}.
}
\usage{
heatmap.3(x, max_score=6, Rowv = TRUE, 
          Colv = if (symm) "Rowv" else TRUE, 
          distfun = dist, hclustfun = hclust, 
          dendrogram = c("both", "row", "column", "none"),       
          symm = FALSE, scale = c("none", "row", "column"), 
          na.rm = TRUE, revC = identical(Colv,"Rowv"), 
          add.expr, breaks, 
          symbreaks = min(x < 0, na.rm = TRUE) || scale != "none", 
          col = "heat.colors", colsep, rowsep, sepcolor = "white", 
          sepwidth = c(0.05, 0.05), cellnote, 
          notecex = 1, notecol = "cyan", 
          na.color = par("bg"), 
          trace = c("none"), 
          tracecol = "cyan", hline = median(breaks), 
          vline = median(breaks), linecol = tracecol, 
          margins = c(5, 5), ColSideColors, RowSideColors, 
          cexRow = 0.2 + 1/log10(nr), cexCol = 0.2 + 1/log10(nc), 
          labRow = NULL, labCol = NULL, key = TRUE, keysize = 1.5, 
          density.info = c("histogram", "density", "none"), 
          denscol = tracecol, 
          symkey = min(x < 0, na.rm = TRUE) || symbreaks, densadj = 0.25, 
          main = NULL, xlab = NULL, ylab = NULL, lmat = NULL, 
          lhei = NULL, lwid = NULL, 
          leftMargin = 7, bottomMargin = 7, reverse = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
numeric matrix of the TROM scores (-log\eqn{_{10}}{10} transformed Bonferroni corrected \emph{p}-values) to be plotted.
}
  \item{max_score}{
numeric value specifying the saturated value of TROM scores, i.e., -log\eqn{_{10}}{10} (transformed Bonferroni corrected \emph{p}-values). The TROM scores are saturated at \code{max_score}: TROM score=min(TROM score, \code{max_score}). The defualt value of \code{max_score} is 6.
}
  \item{Rowv}{
determines if and how the row dendrogram should be computed and reordered. Either a \code{\link{dendrogram}} or a vector of values used to reorder the row dendrogram or NA to suppress any row dendrogram (and reordering) or by default, NULL.
}
  \item{Colv}{
determines if and how the column dendrogram should be reordered. Has the same options as the Rowv argument above and additionally when x is a square matrix, Colv = "Rowv" means that columns should be treated identically to the rows (and so if there is to be no row dendrogram there will not be a column one either).
}
  \item{distfun}{
function used to compute the distance (dissimilarity) between both rows and columns. Defaults to dist.
}
  \item{hclustfun}{
function used to compute the hierarchical clustering when Rowv or Colv are not dendrograms. Defaults to hclust. Should take as argument a result of distfun and return an object to which as.dendrogram can be applied.
}
  \item{dendrogram}{
character string indicating whether to draw 'none', 'row', 'column' or 'both' dendrograms. Defaults to 'both'. However, if Rowv (or Colv) is FALSE or NULL and dendrogram is 'both', then a warning is issued and Rowv (or Colv) arguments are honored.
}
  \item{symm}{
logical indicating if x should be treated symmetrically; can only be true when x is a square matrix.
}
  \item{scale}{
character indicating if the values should be centered and scaled in either the row direction or the column direction, or none. The default is "none".
}
  \item{na.rm}{
logical indicating whether NA's should be removed.
}
  \item{revC}{
logical indicating if the column order should be reversed for plotting, such that e.g., for the symmetric case, the symmetry axis is from lower left to upper right.
}
  \item{add.expr}{
expression that will be evaluated after the call to image. Can be used to add components to the plot, eg., \code{add.expr=abline(...)}
}
  \item{breaks}{
(optional) either a numeric vector indicating the splitting points for binning x into colors, or a integer number of break points to be used, in which case the break points will be spaced equally between min(x) and max(x).
}
  \item{symbreaks}{
Boolean indicating whether breaks should be made symmetric about 0. Defaults to TRUE if the data includes negative values, and to FALSE otherwise.
}
  \item{col}{
colors used for the image. Defaults to heat colors (\code{\link{heat.colors}}).
}
  \item{colsep, rowsep, sepcolor}{
(optional) vector of integers indicating which columns or rows, should be separated from the preceding columns or rows by a box of the color \code{sepcolor}. 
}
  \item{sepwidth}{
(optional) vector of length 2 giving the line width of the 2 vertical lines and the line width of the 2 horizontal lines of the separation box to be drawn, as a proportion of the width or height of a cell. Defaults to c(0.05, 0.05)
}
  \item{cellnote}{
(optional) matrix of character strings which will be placed inside some cells, e.g. \emph{p}-value symbols.
}
  \item{notecex}{
(optional) numeric scaling factor for cellnote. Defaults to 1.
}
  \item{notecol}{
(optional) character string specifying the color for cellnote. Defaults to "cyan".
}
  \item{na.color}{
color to use for missing value (NA). Defaults to the background color.
}
  \item{trace}{
character string indicating whether a solid "trace" line should be drawn along "row"s or down "column"s, "both" or "none". The distance of the line from the center of each colored cell is proportional to the size of the measurement. Defaults to "column".
}
  \item{tracecol}{
character string giving the color for "trace" line. Defaults to "cyan".
}
  \item{hline,vline,linecol}{
(optional) vector of values within cells where a horizontal or vertical dotted line should be drawn. The color of the line is controlled by linecol. Horizontal lines are only plotted if trace is 'row' or 'both'. Vertical lines are only drawn if trace is "column" or "both". hline and vline default to the median of the breaks, linecol defaults to the value of tracecol.
}
  \item{margins}{
numeric vector of length 2 containing the margins (see \code{par(mar= *)}) for column and row names, respectively.
}
  \item{ColSideColors}{
(optional) character vector of length ncol(x) containing the color names for a horizontal side bar that may be used to annotate the columns of x.
}
  \item{RowSideColors}{
(optional) character vector of length nrow(x) containing the color names for a vertical side bar that may be used to annotate the rows of x.
}
  \item{cexRow, cexCol}{
positive numbers, used as cex.axis in for the row or column axis labeling. Defaults to 0.2 + 1/log\eqn{_{10}}{10}(nr) and 0.2 + 1/log\eqn{_{10}}{10}(ncol), respectively.
}
  \item{labRow, labCol}{
character vectors with row and column labels to use. Defaults to rownames(x) and colnames(x), respectively.
}
  \item{key}{
logical indicating whether a color-key should be shown.
}
  \item{keysize}{
numeric value indicating the size of the key.
}
  \item{density.info}{
character string indicating whether to superimpose a 'histogram', a 'density' plot, or no plot ('none') on the color-key.
}
  \item{denscol}{
character string giving the color for the density display specified by density.info, defaults to the same value as tracecol.
}
  \item{symkey}{
Boolean indicating whether the color key should be made symmetric about 0. Defaults to TRUE if the data includes negative values, and to FALSE otherwise.
}
  \item{densadj}{
numeric scaling value for tuning the kernel width when a density plot is drawn on the color key. (See the adjust parameter for the density function for details.) Defaults to 0.25.
}
  \item{main, xlab, ylab}{
main, x- and y-axis titles; defaults to "".
}
  \item{lmat, lhei, lwid}{
visual layout: position matrix, column height, column width. 
}
  \item{leftMargin, bottomMargin}{
sets the left and bottom margins respectively of the plot region.
}
  \item{reverse}{
Boolean indicating whether to reverse the rows of x.
}
  \item{\dots}{
additional arguments passed on to image.
}
}

\value{
Invisibly, a list with components

\item{rowInd}{
row index permutation vector as returned by \code{\link{order.dendrogram}}.
}
\item{colInd}{
column index permutation vector as returned by \code{\link{order.dendrogram}}.
}
\item{call}{  
the matched call
}
\item{carpet}{
reordered and scaled 'x' values used to generate the main 'carpet'
}
\item{breaks}{
values used for break points in the color key
}
\item{col}{  
a character vector giving all the color IDs used in the heatmap
}
\item{colorTable}{
A three-column data frame providing the lower and upper bounds and a color for each bin
}
}
\references{
Li WV, Chen Y and Li JJ (2016). TROM: A Testing-Based Method for Finding Transcriptomic Similarity of Biological Samples. Statistics in Biosciences. DOI: 10.1007/s12561-016-9163-y

Li JJ, Huang H, Bickel PJ, & Brenner SE (2014). Comparison of \emph{D. melanogaster} and \emph{C. elegans} developmental stages, tissues, and cells by modENCODE RNA-seq data. \emph{Genome Research}, 24(7), 1086-1101.

\url{https://gist.github.com/nachocab/3853004}
}
\author{
Jingyi Jessica Li, Wei Vivian Li
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{image}}, \code{\link{heatmap}}
}
\examples{
## using TROM to map developmental stages of D. melanogaster 

## dm_gene_expr.rda can be downloaded and unzipped from
## http://www.stat.ucla.edu/~jingyi.li/packages/TROM/TROM_Rdata.zip.

\dontrun{
load("dm_gene_expr.rda")
dm_trom <- ws.trom(sp_gene_expr = dm_gene_expr, z_thre = 1.5, 
                   provide = FALSE)
                     
## Draw heatmap without dendrogram
pdf("D. melanogaster Stage Mapping (without dendrogram).pdf", width = 10, height =8)
heatmap.3(   dm_trom,
             Rowv = NULL,
             Colv = NULL,
             dendrogram = c("none"),
             distfun = dist,
             hclustfun = hclust,
             xlab = "",
             ylab = "",
             main = "D. melanogaster Stage Mapping",
             key = TRUE,
             keysize = 1,
             trace = "none",
             density.info = c("none"),
             col = terrain.colors(120)
  )
dev.off()

## Draw heatmap with dendrogram
pdf("D. melanogaster Stage Mapping (with dendrogram).pdf", width = 10, height= 8)
heatmap.3(   dm_trom,
             Rowv = TRUE,
             Colv = TRUE,
             dendrogram = c("row"),
             distfun = dist,
             hclustfun = hclust,
             xlab = "",
             ylab = "",
             main = "D. melanogaster Stage Mapping",
             key = TRUE,
             keysize = 1,
             trace = "none",
             density.info = c("none"),
             col = terrain.colors(120),
  )
dev.off()}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the

