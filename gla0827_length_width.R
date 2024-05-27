library(ggplot2)
library(reshape2)
gr_col <- c("#02B1e6", "#FF6666")
#+geom_dotplot(aes(fill=V2),dotsize=0.5,alpha=0.6)
GLA0827 <- readxl::read_xlsx("./GLA0827.xlsx")
ggplot(data = GLA0827, aes(x = V1, color=(V2),fill=(V2)))+geom_density(aes(color=V2),size=1.5,alpha=0.5)+
  ylab(expression(paste("     ")))+
  xlab("                       ")+ 
  theme(legend.position = 'none',
    axis.ticks = element_line(colour = 'black'),
        panel.background=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line=element_line(colour="black"),
        axis.text.x = element_text(colour="black",hjust=0.5,angle=0),
        axis.text.y = element_text(colour="black"),
        axis.title.x=element_text(hjust=0.2))+
  scale_fill_manual(values=c("#02B1e6", "#FF6666"))+
  scale_color_manual(values=c("#02B1e6", "#FF6666"))+
  geom_vline(xintercept=c(1.945822904,2.789171816),linetype=2,color="black",size=1)+
  ylim(0,2)+xlim(1,4.0)
ggsave(file="C://Users//Administrator//Desktop//gla0827.pdf", width=3.5, height=3, units="in")
