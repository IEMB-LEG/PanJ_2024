library("clusterProfiler")
library(ggplot2)
library(stringr)
gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_S_upname.csv",header = T,sep=",")
gene <- as.factor(gene$up_name)
term2gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//name2ko.csv",header=T,sep=",")
term2name <- read.csv("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//term2keggName.csv",header=T,sep=",")
x <- enricher(gene,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff = 1, 
              pAdjustMethod = "BH",qvalueCutoff = 1) 
ouf_up <- paste("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_S_upname_KEGG.csv",sep ="\t")
write.csv(x,ouf_up)

gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_S_downname.csv",header = T,sep=",")
gene <- as.factor(gene$down_name)
x_down <- enricher(gene,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff = 0.05, 
              pAdjustMethod = "BH",qvalueCutoff = 0.05) 
ouf_down <- paste("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_S_downname_KEGG.csv",sep ="\t")
write.csv(x_down,ouf_down)

barplot(x_down)
dotplot(x_down)
(p <- dotplot(x_down, showCategory=10))
(p2 <- p + scale_colour_continuous(low='purple', high='green'))
p4 <- p2 + scale_color_gradient(low="yellow", high="green")
(p3 <- p2 +scale_size(range=c(2, 5))+ scale_y_discrete(labels=function(y) stringr::str_wrap(y,width=30)))
p3
ggsave("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_S_downname_p3.pdf",p3,width=7.5,height=6) 
ggsave("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_S_downname_p3.tiff",p3,dpi=600,width=7.5,height=6) 

gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//F_C_upname.csv", header = T,sep=",")
gene <- as.factor(gene$up_name)
x_up <- enricher(gene,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff = 1, 
                   pAdjustMethod = "BH",qvalueCutoff = 1)
ouf_up <- paste("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_C_upname_KEGG.csv",sep ="\t")
write.csv(x_up,ouf_up)

gene <- read.csv("F://data//Glauconem_trihymena_LHA20170827//RNA//F_C_downname.csv", header = T,sep=",")
gene <- as.factor(gene$down_name)
x_down <- enricher(gene,TERM2GENE=term2gene,TERM2NAME=term2name,pvalueCutoff = 1, 
                 pAdjustMethod = "BH",qvalueCutoff = 1)
ouf_down <- paste("F://data//Glauconem_trihymena_LHA20170827//gla0827_blast//kofam//F_C_downname_KEGG.csv",sep ="\t")
write.csv(x_down,ouf_down)