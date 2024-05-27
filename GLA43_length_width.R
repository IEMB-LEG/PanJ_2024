library(ggplot2)
library(reshape2)
gr_col <- c("#02B1e6", "#FF6666")
#+geom_dotplot(aes(fill=V2),dotsize=0.5,alpha=0.6)
ggplot(data = GLA43, aes(x = V1, color=(V2),fill=(V2)))+geom_density(aes(color=V2),size=1.5,alpha=0.5)+
  ylab(expression(paste("   ")))+
  xlab("                       ")+ 
  theme(legend.position = 'none',axis.ticks = element_line(colour = 'black'),
        panel.background=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line=element_line(colour="black"),
        axis.text.x = element_text(colour="black",hjust=0.5,angle=0),
        axis.text.y = element_text(colour="black"),
        axis.title.x=element_text(hjust=0.2))+
  scale_fill_manual(values=c("#e4ce00","#13a983"))+
  scale_color_manual(values=c("#e4ce00","#13a983"))+
  geom_vline(xintercept=c(1.508417326,2.67748621),linetype=2,color="black",size=1)+
  ylim(0,3)
ggsave(file="C://Users//Administrator//Desktop//gla43.pdf",dpi=500, width=3.5, height=3, units="in")
