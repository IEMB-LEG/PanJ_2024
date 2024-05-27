library(tidyverse)
library(ggplot2)
library(scales)
data <- read.csv("I://LOEG//papers//Glauconema//gene//gene_length_number.csv",header = T)
data$length <- factor(data$length,levels=c("1-1000","1001-2000","2001-3000","3001-4000","4001-5000","5kb"))

(p1 <- ggplot(data,aes(x=length,y=num,fill=group))+
    geom_bar(stat = "identity",position = "dodge")+
    geom_text(aes(label = num), colour = "black", 
              size = 3,vjust = -0.2,position = position_dodge(.9))+
    labs(x="Length (bp)",y='Gene numbers')+ 
    scale_fill_manual(values = c("#f39426","#5a72b5"))+
    theme_test(base_size = 15)+
    theme_classic()+
    theme(legend.position = c(0.75,0.85),
          legend.text = element_text(size=10,face = "italic"),
          axis.text.x =  element_text(angle = 45,hjust = 1), 
          axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
          axis.title.x=element_text (size=12,hjust=0.5),
          axis.title.y=element_text(size=12,vjust=0.8,angle=90)))

ggsave(p1, file="I://LOEG//papers//Glauconema//gene//gene_length_number.tiff",dpi=500,width=7.5,height=5,units="in")
ggsave(p1, file="I://LOEG//papers//Glauconema//gene//gene_length_number.pdf",dpi=500,width=7.5,height=5,units="in")

