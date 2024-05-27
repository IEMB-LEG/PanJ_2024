library(ggplot2)
dat <- read.csv("I://LOEG//papers//Glauconema//expand_genename_GO.csv",header = T,sep=",")
dat$Category <- factor(dat$Category,levels=c("BP","MF"))
dat$Description <- factor(dat$Description, ordered=TRUE)
p <- ggplot(dat,aes(y=richfactor,x=Description,fill=p.adjust)) + 
  geom_bar(stat="identity",position = "dodge") +
  facet_grid(Category~.,scales = "free",space = "free") + 
  coord_flip() + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        strip.text.y = element_text(size = 10),
        legend.position="right",
        legend.title = element_text(size=14),
        legend.text = element_text(size=10),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=12,angle=0),
        axis.title.x = element_text(size=10),
        axis.title.y = element_text(size=10))
p
ggsave(p,filename = "I://LOEG//papers//Glauconema//cysts_go_kegg//expand_genename_GO.pdf",width = 7.5,height =6)
ggsave(p,filename = "I://LOEG//papers//Glauconema//cysts_go_kegg//expand_genename_GO.jpg",width = 7.5,height = 6,dpi=600)