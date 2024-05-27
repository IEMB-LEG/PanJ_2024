library(ggplot2)
library(gridExtra)
library(scales)
library(ggsignif)
library(vioplot)
speed_gla43_barplot <- read.csv("I://LOEG//papers//Glauconema//speed//speed_gla43_0827_barplot.csv", header = T,sep=",")
speed_gla43_barplot$group <- factor(speed_gla43_barplot$group,levels=c("Trophont","Tomite"))
ggplot(speed_gla43_barplot, aes(x = strain, y = speed,fill=group)) +
  geom_errorbar(aes(ymin=speed-se, ymax=speed+se,color=group), 
                width=0.1,
                position=position_dodge(0.9))+
  scale_color_manual(values=c("lightgreen", "purple"))+
  geom_bar(position=position_dodge(), stat="identity")+
  scale_fill_manual(values=c("lightgreen", "purple"))+
 geom_signif(data=speed_gla43_barplot,aes(xmin=0.77, xmax=1.22, annotations="**", y_position=270),
              textsize = 5, vjust = 0.5, tip_length = c(0.7, 0.12),linetype = "dashed",
              manual=TRUE)+
  geom_signif(data=speed_gla43_barplot,aes(xmin=1.77, xmax=2.22, annotations="**", y_position=300),
              textsize = 5, vjust = 0.5, tip_length = c(0.85, 0.08),linetype = "dashed",
              manual=TRUE)+
  theme_minimal()+
  theme(axis.ticks = element_line(colour = 'black'),
        panel.background=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position=c("top"), 
        axis.line=element_line(colour="black"),
        axis.text.x = element_text(colour="black",hjust=0.5,angle=0),
        axis.text.y = element_text(colour="black"),
        axis.title.x=element_text(hjust=0.2),
        legend.key = element_rect(colour = "black" ,size=0.1),
        legend.key.size = unit(0.2, "cm"),
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 10),
        axis.title.y=element_text(vjust=0.2))
ggsave(file="I://LOEG//papers//Glauconema//speed//speed_gla43_0827_barplot.tiff",dpi=500,width=3.5, height=4, units="in")
ggsave(file="I://LOEG//papers//Glauconema//speed//speed_gla43_0827_barplot.pdf",dpi=500,width=3.5, height=4, units="in")
 