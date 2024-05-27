library("AnnotationHub")
library("biomaRt")
library("clusterProfiler")
library("topGO")
library("Rgraphviz")
library("pathview")
library("DOSE")
library("UpSetR")
library("enrichplot")

data <- read.csv("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//BP_database.csv", header = F,sep=",")

gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//F_C_upname.csv", header = T,sep=",")
gene_down <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//F_C_downname.csv", header = T,sep=",")
gene <- as.factor(gene$up_name)
gene_down <- as.factor(gene_down$down_name)
term2gene <- data[,c(1,4)]

term2name <- data[,c(1,3)]

x <- enricher(gene,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff = 1, pAdjustMethod = "BH", qvalueCutoff = 1)
ouf_up <- paste("F://data//Glauconem_trihymena_LHA20170827//RNA//F_C_up_go_BP.csv",sep ="\t")
write.csv(x,ouf_up)
barplot(x, showCategory=10)

x_down <- enricher(gene_down,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff =1, pAdjustMethod = "BH", qvalueCutoff = 1)
ouf_down <- paste("F://data//Glauconem_trihymena_LHA20170827//RNA//F_C_down_go_BP.csv",sep ="\t")
write.csv(x_down,ouf_down)
barplot(x_down, showCategory=10)
upsetplot(x_down)
dotplot(x_down)
cnetplot(x_down,showCategory=2)
plotGOgraph(x_down,showCategory=10)
emapplot(x_down)
enrichplot::cnetplot(x_down,circular=FALSE,colorEdge = TRUE)
enrichplot::heatplot(x_down,showCategory = 10)

data1 <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_down_go.csv", header = T,sep=",")
barplot(as.matrix(data1), showCategory=15)




data <- read.csv("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//BP_database.csv", header = F,sep=",")

gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_upname.csv", header = T,sep=",")
gene_down <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_downname.csv", header = T,sep=",")
gene <- as.factor(gene$up_name)
gene_down <- as.factor(gene_down$down_name)
term2gene <- data[,c(1,4)]

term2name <- data[,c(1,3)]

x <- enricher(gene,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff = 1, pAdjustMethod = "BH", qvalueCutoff = 1)
ouf_up <- paste("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_up_go_BP.csv",sep ="\t")
write.csv(x,ouf_up)
barplot(x, showCategory=10)

x_down <- enricher(gene_down,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff =1, pAdjustMethod = "BH", qvalueCutoff = 1)
ouf_down <- paste("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_down_go_BP.csv",sep ="\t")
write.csv(x_down,ouf_down)
barplot(x_down, showCategory=10)
upsetplot(x_down)
dotplot(x_down)
cnetplot(x_down,showCategory=2)
enrichplot::cnetplot(x_down,circular=FALSE,colorEdge = TRUE)
enrichplot::heatplot(x_down,showCategory = 10)



data <- read.csv("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//CC_database.csv", header = F,sep=",")

gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_upname.csv", header = T,sep=",")
gene_down <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_downname.csv", header = T,sep=",")
gene <- as.factor(gene$up_name)
gene_down <- as.factor(gene_down$down_name)
term2gene <- data[,c(1,4)]

term2name <- data[,c(1,3)]

x <- enricher(gene,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff = 1, pAdjustMethod = "BH", qvalueCutoff = 1)
ouf_up <- paste("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_up_go_CC.csv",sep ="\t")
write.csv(x,ouf_up)
barplot(x, showCategory=10)

x_down <- enricher(gene_down,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff =1, pAdjustMethod = "BH", qvalueCutoff = 1)
ouf_down <- paste("F://data//Glauconem_trihymena_LHA20170827//RNA//S_C_down_go_CC.csv",sep ="\t")
write.csv(x_down,ouf_down)
barplot(x_down, showCategory=10)
upsetplot(x_down)
dotplot(x_down)
cnetplot(x_down,showCategory=2)
enrichplot::cnetplot(x_down,circular=FALSE,colorEdge = TRUE)
enrichplot::heatplot(x_down,showCategory = 10)
