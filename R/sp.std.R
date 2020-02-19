sp.std <-
function(sp_gene_expr){
  data.frame(sp_gene_expr[,1], t(apply(sp_gene_expr[,2:ncol(sp_gene_expr)], 1, FUN=function(x) {
    x <- as.numeric(x)
    (x-mean(x))/sd(x)
  } )) , stringsAsFactors = FALSE)
}
