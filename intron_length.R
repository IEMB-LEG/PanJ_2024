library(ggplot2)
library(reshape2)
gr_col <- c("#02B1e6", "#FF6666")
#+geom_dotplot(aes(fill=V2),dotsize=0.5,alpha=0.6)
data <- read.csv("I://LOEG//papers//Glauconema//gene//intron_length.csv",header = T)
data$name <- factor(data$name,levels=c("1-50","51-100","101-150","151-200","201-250",
                                         "251-300","301-350","351-400","401-450","451-500",
                                         "501-550","551-600","601-650","651-700","701-750","751-800","801-850","851-900",
                                         "901-950","951-1000",">1000"))

ggplot(data, aes(x = name,y=num/10000,fill=strain))+
  geom_col(position = "dodge")+
  #geom_density(data=data,aes(x = gene,..density..),size=0.5,color="black")+
  ylab(expression(paste(" Count (x10000) ")))+
  xlab("     Length of intron (bp)  ")+ 
  scale_fill_manual(values = c("#6495ED","#8FBC8F"))+
  theme_test(base_size = 15)+
  theme_classic()+
  theme(legend.position = c(0.75,0.85),
        legend.text = element_text(size=10),
        axis.text.x =  element_text(angle = 45,hjust = 1), 
        axis.text.y =  element_text(size=10,hjust=0.8,angle=0),
        axis.title.x=element_text (size=12,hjust=0.5),
        axis.title.y=element_text(size=12,vjust=0.8,angle=90))
# scale_x_continuous(limits = c(1,11), breaks = seq(1,11,1))
ggsave(file="I://LOEG//papers//Glauconema//gene//intron_length.tiff",dpi=500, width=3.5, height=3, units="in")
ggsave(file="I://LOEG//papers//Glauconema//gene//intron_length.pdf",dpi=500, width=3.5, height=3, units="in")
