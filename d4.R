library(scales)
library(reshape)
library(ggplot2)
library(gridExtra)
library(ggplot2)
library(readxl)
D4_data <- read_excel("I://LOEG//papers//Glauconema//RNAi_data//D4//d4.xlsx")

ggplot(data=D4_data,aes(x=Time,y=num,group=group,shape=group,color=group,linetype=group),width=0.3)+
  geom_errorbar(aes(ymin=num-se,ymax=num+se),width=0.2,size=0.3)+
  geom_line(size=0.6)+ 
  geom_point(aes(shape=group,color=group),size=1) + 
  scale_shape_manual(values = c(0,19)) + 
  scale_color_manual(values = c("forestgreen","hotpink"))+
  theme_classic()+
  theme(legend.position = "top",
        legend.text = element_text(size=10,face = "italic"),
        axis.text.x =  element_text(size=10), 
        axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
        axis.title.x=element_text (size=12,hjust=0.5),
        axis.title.y=element_text(size=12,vjust=0.8,angle=90)) + 
  ylab("Density (ml) ")+
  xlab("Time")
  ggsave(file="I://LOEG//papers//Glauconema//RNAi_data//D4//d4.pdf",dpi=300,width=3.5,height=3,units="in")
  ggsave(file="I://LOEG//papers//Glauconema//RNAi_data//D4//d4.tiff",dpi=300,width=3.5,height=3,units="in")