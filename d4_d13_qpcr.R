library(scales)
library(reshape)
library(ggplot2)
library(gridExtra)
library(ggplot2)
library(readxl)
library(ggsci)
library(hrbrthemes)
library(ggsignif)
qpcr_data <- read_excel("I://LOEG//papers//Glauconema//RNAi_data//qPCR//qpcrD13-20230414.xlsx")

ggplot(data=qpcr_data,aes(x=Time,y=RQ,group=group,shape=group,color=group),width=0.5)+
  geom_errorbar(aes(ymin=Min,ymax=Max),width=0.1,size=0.2)+
  geom_line(size=0.6)+ 
  geom_point(aes(shape=group,color=group),size=2) + 
  #scale_shape_manual(values = c(0,19,17,9)) + 
  #scale_color_manual(values = c("forestgreen","hotpink","red","blue"))+
  theme_bw()+
  theme(legend.position = "top",
        legend.text = element_text(size=10,face = "italic"),
        axis.text.x =  element_text(size=10), 
        axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
        axis.title.x=element_text (size=12,hjust=0.5),
        axis.title.y=element_text(size=12,vjust=0.8,angle=90)) + 
  ylab("")+
  xlab("")
  ggsave(file="I://LOEG//papers//Glauconema//RNAi_data//qPCR//qpcrD13_20230414.pdf",dpi=300,width=3,height=3,units="in")
  ggsave(file="I://LOEG//papers//Glauconema//RNAi_data//qPCR//qpcrD13_20230414.tiff",dpi=300,width=3,height=3,units="in")
  
  qpcr_data <- read_excel("I://LOEG//papers//Glauconema//RNAi_data//qPCR//qpcrD4-20230414.xlsx")
  
  ggplot(data=qpcr_data,aes(x=Time,y=RQ,group=group,shape=group,color=group),width=0.5)+
    geom_errorbar(aes(ymin=Min,ymax=Max),width=0.1,size=0.2)+
    geom_line(size=0.6)+ 
    geom_point(aes(shape=group,color=group),size=2) + 
    #scale_shape_manual(values = c(0,19,17,9)) + 
    #scale_color_manual(values = c("forestgreen","hotpink","red","blue"))+
    #theme_classic()+
    #scale_fill_nejm()+ #geom_jitter(size=0.8, alpha=0.9)+ 
    theme_bw()+
    theme(legend.position = "top",
          legend.text = element_text(size=10,face = "italic"),
          axis.text.x =  element_text(size=10), 
          axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
          axis.title.x=element_text (size=12,hjust=0.5),
          axis.title.y=element_text(size=12,vjust=0.8,angle=90)) + 
    ylab("")+
    xlab("")
  ggsave(file="I://LOEG//papers//Glauconema//RNAi_data//qPCR//qpcrD4_20230414.pdf",dpi=300,width=3,height=3,units="in")
  ggsave(file="I://LOEG//papers//Glauconema//RNAi_data//qPCR//qpcrD4_20230414.tiff",dpi=300,width=3,height=3,units="in")