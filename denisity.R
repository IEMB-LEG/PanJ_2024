library(scales)
library(reshape)
library(ggplot2)
library(gridExtra)
library(ggplot2)
library(readxl)

ggplot(data=data,aes(x=Day,y=N),width=0.2)+
  geom_errorbar(aes(ymin=N-se,ymax=N+se),width=0.2,size=0.4)+
  geom_line(size=0.4)+ 
  geom_point(size=2) +theme_classic()+
  theme(legend.position = "top",
        legend.text = element_text(size=10,face = "italic"),
        axis.text.x =  element_text(size=10), 
        axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
        axis.title.x=element_text (size=12,hjust=0.5),
        axis.title.y=element_text(size=12,vjust=0.8,angle=90)) + 
  ylab("Density (ml) ")+
  xlab("Day")
  ggsave(file="I://LOEG//papers//Glauconema//Éú³¤ÇúÏß//density.pdf",dpi=500,width=3.0,height=3.0,units="in")