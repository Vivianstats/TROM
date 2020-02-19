choose.z <-
function(sp_gene_expr, mode = FALSE){
  
  sp_gene_expr <- sp_gene_expr[apply(sp_gene_expr[2:ncol(sp_gene_expr)],1,sum)!=0, ]
  N = nrow(sp_gene_expr)
  
  TROM.list <- list()
  zseq <- seq(-2,3,by=0.1)
  sp_z=sp.std(sp_gene_expr)
  
  for (i in 1:length(zseq)){
    z <- zseq[i]
    print(paste("z=",z,sep=""))
    
    associated_idx <- sapply(2:ncol(sp_z), FUN=function(i) 
      which(sp_z[,i]>z & rowSums(sp_gene_expr[,2:ncol(sp_gene_expr)])>0
      ), simplify=FALSE)  
    
    trueTROM <- ws.trom.forZ(associated_idx,N)
    TROM.list[[i]] <- trueTROM
  }
  
  
  pat <- unlist(lapply(TROM.list, function(A){
    mean(A[row(A)!=col(A)])
  }))
  logpat <- log(pat+1,base=10)
  zseq <- zseq[logpat!=0]
  logpat <- logpat[logpat!=0]
  dens <- density(logpat,from=min(logpat), to=max(logpat))
  mode_logpat <- dens$x[which(dens$y==max(dens$y))]
  if (mode == TRUE){
    range_z <- zseq[which(logpat>= mode_logpat)]
  }else{
    range_z <- zseq[which(logpat>= mode_logpat -sd(logpat)&logpat<= mode_logpat +sd(logpat) ) ]
  }
  
  return(max(range_z))
}
