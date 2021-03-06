find.top.GO.slim.terms <-
function(gene_lists, all_genes, GOmappingfile, 
                                   output_file, topNum=20, GO_slim_id, 
                                   gene = "id"){
  # read in interested gene lists from gene_lists
  associated_gene_list <- read.xlsx(gene_lists, colNames=TRUE)
  name<-names(associated_gene_list)
  
  associated_gene_list <- lapply(1:length(associated_gene_list), FUN=function(x) 
    associated_gene_list[[x]][!is.na(associated_gene_list[[x]])])
  associated_gene_list <- lapply(1:length(associated_gene_list), FUN=function(x) 
    associated_gene_list[[x]][!(associated_gene_list[[x]]=="")])
  names(associated_gene_list) <- name
  
  if(gene == "id"){
    path <- paste(system.file(package="TROM"), "convert.py", sep="/")
  }else{
    path <- paste(system.file(package="TROM"), "convert2.py", sep="/")
  }
  command <- paste("python", path, GOmappingfile, "geneid2go.map")
  response <- system(command)
  
  sp_geneID2GO <- readMappings(file = "geneid2go.map")
  sp_GO2geneID <- inverseList(sp_geneID2GO)
  # gene populations
  sp_geneNames <- names(sp_geneID2GO)
  # GO ID populations
  sp_GO <- names(sp_GO2geneID)
  # only look at BP GO terms
  GOTERM_aslist <- as.list(GOTERM)
  GO_in_GOTERM <- sapply(1:length(GOTERM_aslist), FUN=function(x) GOTERM_aslist[[x]]@GOID)
  sp_GO_old <- sp_GO
  sp_GO <- intersect(sp_GO, GO_in_GOTERM)
  sp_GO_ontology <- Ontology(GOTERM[sp_GO])
  sp_GO <- sp_GO[which(sp_GO_ontology=="BP")]
  # restrict to GO slim terms
  sp_GO_slim <- intersect(sp_GO, GO_slim_id)
  
  sp_GO2geneID_wslim <- sp_GO2geneID[sp_GO_slim]
  sp_geneID2GO_wslim <- inverseList(sp_GO2geneID_wslim) 
  
  all_genes_w_GO <- names(sp_geneID2GO_wslim)
  
  sp_topGo <- write_top_GO_terms(output_file, associated_gene_list, all_genes, all_genes_w_GO, geneID2GO=sp_geneID2GO_wslim, topNum)
  
  # if (heatmap == TRUE){
  #   topGO_name <- sp_topGo[seq(1, 6*(length(associated_gene_list)-1)+1, by=6)]
  #   topGO_name <- unique(unlist(topGO_name))
  #   
  #   p_value <- count_GO_terms(gene_lists=associated_gene_list, gene_pop=all_genes, 
  #                             GO_pop=topGO_name, GO2geneID=sp_GO2geneID)
  #   
  #   temp <- -log(p_value*length(p_value), base=10)
  #   temp[temp<=0] <- 0
  #   temp <- temp[-which(apply(temp!=0,1,sum)==0), ]
  #   rownames(temp) <- Term(rownames(temp))
  #   
  #   pdf("Top enriched GO slim terms across samples.pdf", width=9, height=10*topNum/30)
  #   dm_stage_heatmap <- heatmap.3(temp, 
  #                                 Rowv=T, Colv=F, 
  #                                 dendrogram="none", 
  #                                 trace="none", 
  #                                 density.info = c("none"), #col = terrain.colors(120),
  #                                 col = gray(0:120 / 120))    
  #   dev.off()
  # }
  return(sp_topGo)
}
