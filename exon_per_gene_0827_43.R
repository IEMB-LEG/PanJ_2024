library(ggplot2)
library(reshape2)
gr_col <- c("#02B1e6", "#FF6666")
#+geom_dotplot(aes(fill=V2),dotsize=0.5,alpha=0.6)
data <- read.csv("I://LOEG//papers//Glauconema//gene//exon_per_gene_0827_43.csv",header = T)
ggplot(data, aes(x = x,y=y/1000,fill=strain))+
  geom_col(position = "dodge")+
  #geom_density(data=data,aes(x = gene,..density..),size=0.5,color="black")+
  ylab(expression(paste(" Count (x1000) ")))+
  xlab("     Exons per gene    ")+ 
  scale_fill_manual(values = c("#998099","#B3C1C9"))+
  theme_test(base_size = 15)+
  theme_classic()+
  theme(legend.position = c(0.75,0.85),
        legend.text = element_text(size=10),
        axis.text.x =  element_text(angle = 0,hjust = 0.5), 
        axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
        axis.title.x=element_text (size=12,hjust=0.5),
        axis.title.y=element_text(size=12,vjust=0.8,angle=90))
 # scale_x_continuous(limits = c(1,11), breaks = seq(1,11,1))
ggsave(file="I://LOEG//papers//Glauconema//gene//exon_per_gene_0827_43.tiff",dpi=500, width=3.5, height=3, units="in")
ggsave(file="I://LOEG//papers//Glauconema//gene//exon_per_gene_0827_43.pdf",dpi=500, width=3.5, height=3, units="in")
