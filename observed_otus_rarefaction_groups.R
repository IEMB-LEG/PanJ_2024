library(tidyverse)
data <- read_csv("C:/Users/Administrator/Desktop/observed_features_alpha_rarefaction.csv")
data2 <- data %>% gather("depth", "observed_otus", -`sample-id`, -`body-site`) %>%
  mutate(depth = str_replace(depth, "_iter\\-\\d+", "")) %>%
  mutate(depth = as.numeric(str_replace(depth, "depth\\-", ""))) %>% na.omit()
p1 <- ggplot(data2, aes(depth, observed_otus, color = `body-site`, group = `sample-id`))+
  geom_smooth(se = FALSE, method = "lm", formula = y~log(x))
ggsave("C:/Users/Administrator/Desktop/observed_otus_rarefaction_samples.png", height = 5, width = 8)
p2 <- ggplot(data2, aes(depth, observed_otus, color = `body-site`, group = `body-site`))+
  geom_smooth(se = FALSE, method = "lm", formula = y~log(x))
ggsave("C:/Users/Administrator/Desktop/observed_otus_rarefaction_groups.png", height = 5, width = 8)
