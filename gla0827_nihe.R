library(ggplot2)
library(gridExtra)
library(scales)
library(dplyr)
library(ggpubr)
library(ggpmisc)
ggplot(gla0827, mapping = aes(x=group,y=ratio))+
  geom_point(size=1)+
  stat_smooth(method="lm", formula=y~log2(x), se = FALSE, size=1,alpha = 0, color="red",linetype="dashed")+
  stat_poly_eq(aes(label = paste(..eq.label.., sep = '~~~~')), formula = y ~ log2(x), parse = T,
             family = "SH",label.x = 0.2,size=2.5)+
  stat_fit_glance(method = "lm",
                  method.args = list(formula = y ~ log2(x)),
                  mapping = aes(label = sprintf('R^2~"="~%.3f~~italic(P)~"="~%.2g', stat(r.squared), stat(p.value))),
                  parse = TRUE,label.x = 0.95,family = "SH",size=2.5)+
theme(axis.ticks = element_line(colour = 'black'),
      panel.background=element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      legend.position=c("top"), 
      axis.line=element_line(colour="black"),
      axis.text.x = element_text(colour="black",hjust=1,angle=50),
      axis.text.y = element_text(colour="black"),
      axis.title.x=element_text(hjust=0.2),
      legend.key = element_rect(colour = "black" ,size=0.1),
      legend.key.size = unit(0.3, "cm"),
      legend.text = element_text(size = 10),
      legend.title = element_text(size = 10),
      axis.title.y=element_text(vjust=0.2))+
  scale_x_continuous(breaks=c(0.01,0.03,0.05,0.1,0.2,0.3,0.4,0.5))
  ggsave(file="C://Users//Administrator//Desktop//nihe_gla0827_lm.tiff",dpi=500,width=4.5, height=3, units="in")
nls_1 <- nls()
pra.ml <- lm(ratio~log(group,2) ,data=gla0827)
summary(pra.ml)
ggplot(gla0827, mapping = aes(x=group,y=ratio))+
  geom_point(size=1)+
  stat_function(fun = function(x) a*log(x,2)+b,color="red",size=2)

ggplot(gla0827, mapping = aes(x=group,y=ratio))+
  geom_point(size=1)+
  stat_smooth(method="lm", formula= y~poly(x, 2), se = FALSE, size=0.5,alpha = 0, color="black",linetype="dashed")+
  stat_poly_eq(aes(label = paste(..eq.label.., sep = '~~~~')), formula =  y~poly(x, 2), parse = T,
               family = "SH",label.x = 0.2,size=2.5)+
  stat_fit_glance(method = "lm",
                  method.args = list(formula =  y~poly(x, 2)),
                  mapping = aes(label = sprintf('R^2~"="~%.3f~~italic(P)~"="~%.2g', stat(r.squared), stat(p.value))),
                  parse = TRUE,label.x = 0.95,family = "SH",size=2.5)


ggplot(gla08271, mapping = aes(x=group,y=ratio))+
  geom_point(size=1)+
  stat_smooth(method='lm', formula=y~x, se = FALSE,size=0.5,alpha = 0, color="black",linetype="dashed")+
  stat_poly_eq(aes(label = paste(..eq.label.., sep = '~~~~')), formula = y ~ x, parse = T,
               family = "SH",label.x = 0.2,size=2.5)+
  stat_fit_glance(method = 'lm',
                  method.args = list(formula = y ~ x),
                  mapping = aes(label = sprintf('R^2~"="~%.3f~~italic(P)~"="~%.2g', stat(r.squared), stat(p.value))),
                  parse = TRUE,label.x = 0.95,family = "SH",size=2.5)

ggplot(GLA1, mapping = aes(x=group,y=ratio))+
  geom_point(size=1)+
  stat_smooth(method='lm', formula=y~x, se = FALSE,size=0.5,alpha = 0, color="black",linetype="dashed")+
  stat_poly_eq(aes(label = paste(..eq.label.., sep = '~~~~')), formula = y ~ x, parse = T,
               family = "SH",label.x = 0.2,size=2.5)+
  stat_fit_glance(method = 'lm',
                  method.args = list(formula = y ~ x),
                  mapping = aes(label = sprintf('R^2~"="~%.3f~~italic(P)~"="~%.2g', stat(r.squared), stat(p.value))),
                  parse = TRUE,label.x = 0.95,family = "SH",size=2.5)