library(scales)
library(reshape)
library(ggplot2)
library(gridExtra)
library(ggplot2)
library(readxl)
prey <- read.table("I://LOEG//papers//Glauconema//18S//data.txt",header = TRUE)

ggplot(data=prey,aes(x=sample,y=num,group=group,shape=group,color=group),width=0.5)+
  geom_errorbar(aes(ymin=num-se,ymax=num+se),width=0.2,size=0.5)+
  geom_line(size=1)+ 
  geom_point(aes(shape=group,color=group),size=2.5) + 
  scale_shape_manual(values = c(17,21,8)) + 
  scale_color_manual(values = c("blue","forestgreen","gold"))+
  #scale_color_manual(values = c("hotpink","forestgreen","gray33"))+
  theme_classic()+
  theme(legend.position = c(0.75,0.85),
        legend.text = element_text(size=10,face = "italic"),
        axis.text.x =  element_text(size=10), 
        axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
        axis.title.x=element_text (size=12,hjust=0.5),
        axis.title.y=element_text(size=12,vjust=0.8,angle=90)) + 
  ylab("percent ")+
  xlab("  sample-id ")
ggsave(file="I://LOEG//papers//Glauconema//18S//18s.pdf",dpi=300,width=5,height=3.5,units="in")
