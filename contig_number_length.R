library(tidyverse)
library(ggplot2)
data <- read.csv("I://LOEG//papers//Glauconema//contig_number_length//data.csv",header = T)
data$group <- factor(data$group,levels=c("1-50","50-100","100-150","150-200","200-250",
                                         "250-300","300-350","350-400","400-450","450-500",
                                         "500-550","550-600","600-650","650-700","700-750","750-800","800-850","850-900",
                                         "900-950","950-1000","1M"))

(p1 <- ggplot(data,aes(x=group,y=num,fill=strain))+
        geom_col(stat = "identity",position = "dodge")+
    geom_text(aes(label = num), colour = "black", 
              size = 3,vjust = -0.2,position = position_dodge(.9))+
    labs(x="Length (kb)",y='Number of contigs')+ 
    scale_fill_manual(values = c("#998099","#B3C1C9"))+
    theme_test(base_size = 15)+
    theme_classic()+
    theme(legend.position = c(0.75,0.85),
          legend.text = element_text(size=10,face = "italic"),
          axis.text.x =  element_text(angle = 45,hjust = 1), 
          axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
          axis.title.x=element_text (size=12,hjust=0.5),
          axis.title.y=element_text(size=12,vjust=0.8,angle=90)))
ggsave(p1,file="I://LOEG//papers//Glauconema//contig_number_length//contigs_number_length.tiff",dpi=500,width=7.5,height=5,units="in")
ggsave(p1,file="I://LOEG//papers//Glauconema//contig_number_length//contigs_number_length.pdf",dpi=500,width=7.5,height=5,units="in")

