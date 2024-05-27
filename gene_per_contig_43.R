library(ggplot2)
library(reshape2)
gr_col <- c("#02B1e6", "#FF6666")
#+geom_dotplot(aes(fill=V2),dotsize=0.5,alpha=0.6)
data <- read.csv("I://LOEG//papers//Glauconema//gene//gene_per_contig_43.csv",header = T)
ggplot(data, aes(x = num,..density..),color="#377eb8")+
  geom_histogram(aes(x = num,..density..),bins = 10,position = 'identity',size=0.3,alpha=0.5,color="white",fill="springgreen4")+
  geom_density(data=data,aes(x = num,..density..),size=0.5,color="black")+
  ylab(expression(paste(" Density ")))+
  xlab("     Genes per contig    ")+ 
  theme(legend.position = 'none',
        axis.ticks = element_line(colour = 'black'),
        panel.background=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line=element_line(colour="black"),
        axis.text.x = element_text(colour="black",hjust=0.5,angle=0),
        axis.text.y = element_text(colour="black"),
        axis.title.x=element_text(hjust=0.2))+
  scale_x_log10()
#geom_vline(xintercept=c(1.945822904,2.789171816),linetype=2,color="black",size=1)+
#ylim(0,2)
ggsave(file="I://LOEG//papers//Glauconema//gene//gene_per_contig_43.tiff",dpi=500, width=3.5, height=3, units="in")
ggsave(file="I://LOEG//papers//Glauconema//gene//gene_per_contig_43.pdf",dpi=500, width=3.5, height=3, units="in")