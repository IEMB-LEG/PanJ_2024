library(ggplot2)
library(reshape2)
rm(list=ls())
data <- read.csv("../study/Figure S4.csv",header = FALSE)
names(data) <- c("Length","width","Replicate","Treatment")
data$Ratio <- data$Length /data$width
data$Treatment <- factor(data$Treatment, levels = c("A", "B", "C", "D", "E", "F"),
                         labels = c("OD600=0.01", "OD600=0.03", "OD600=0.05", "OD600=0.1", "OD600=0.3", "OD600=0.5"))
replicate_colors <- c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728")

# 绘制每个处理和重复的密度曲线，并将处理分成小图
ggplot(data, aes(x = Ratio, color = as.factor(Replicate), fill = as.factor(Replicate))) +
  geom_density(size = 1.2,alpha=0) +
  ylab("Probability density") +
  xlab("Length/width ratio") +
  theme(axis.ticks = element_line(colour = 'black'),
        panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        axis.text.x = element_text(colour = "black", hjust = 0.5, angle = 0),
        axis.text.y = element_text(colour = "black"),
        axis.title.x = element_text(hjust = 0.2),
        legend.position = 'right') +
  scale_fill_manual(values = replicate_colors, name = "Replicate") +
  scale_color_manual(values = replicate_colors, name = "Replicate") +
  facet_wrap(~ Treatment, scales = "free") +  # 按处理分面
  geom_vline(xintercept = 1.95, linetype = "dashed", color = "#02b1e6") +
  geom_vline(xintercept = 2.78, linetype = "dashed", color = "#ff6666") +
  xlim(0.7, max(data$Ratio))
ggsave("Figure S4.pdf")