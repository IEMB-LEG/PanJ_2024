library(tidyverse)
data <- read.csv("I://LOEG//papers//Glauconema//GC//LHA0827.csv",header = T)
(p1 <- ggplot(data)+
    geom_col(aes(x = x, #见下面注释
                 y = y2),
             color='black',   #柱子边框颜色
             width=0.6,       #柱子宽度
             fill='#FFFF99')+ #柱子填充色
    labs(x="GC content (%)",y='Total length of contigs (Mb)')+ #自定义x、y轴、标题内容
    theme_test(base_size = 15)+ #主题基本大小
    theme(axis.text.x = element_text(angle = 45,hjust = 1),
          axis.text = element_text(color = 'black',face = 'bold'),
          plot.margin = margin(1,0.5,0.5,2.5,'cm'),
          panel.border = element_rect(size = 1),
          axis.title = element_text(face = 'bold'),
          plot.title = element_text(face = 'bold',
                                    size=13,hjust = 0.5)))
          #scale_x_continuous(breaks=15,65,5))

(p3 <- p1+
    scale_y_continuous(expand = c(0,0),limits = c(0,55),breaks = seq(0,55,5),
                       sec.axis = sec_axis(~./0.5,
                                           name = 'Contig number',
                                           breaks = seq(0,110,10)))+
    
    geom_line(aes(x= x,
                  y=y1*0.5,
                  group=1),
              linetype=3,cex=1)+
    geom_point(aes(x= x,
                   y=y1*0.5),
               color='#3333CC',size=2)
)
ggsave(p3,file="I://LOEG//papers//Glauconema//GC//LHA0827_V1.tiff",dpi=500,width=7.5,height=5,units="in")
ggsave(p3,file="I://LOEG//papers//Glauconema//GC//LHA0827_V1.pdf",dpi=500,width=7.5,height=5,units="in")
