# Script for figure 1

# Install exscidata
#library(devtools)
#install_github("dhammarstrom/exscidata")

# Additional packages that we will use

# To install these packages e.g.,
# install.package("ggtext")

library(tidyverse)
library(ggtext)
library(cowplot)


# Load the data
dat <- exscidata::thorstensson


p1 <- ggplot(
  data = dat,
  aes(x = ft_area_pct, y = peak_torque_pct_mvc, fill = group, shape = group)
) +
  geom_point() +
  scale_y_continuous(limits = c(0, 100)) +
  scale_x_continuous(limits = c(0, 100)) +

  labs(
    x = "Fast<sub>twitch</sub> fiber <sup>area</sup>, &rarr; &deg;C",
    y = "Relative peak torque",
    fill = "Group",
    shape = "Group"
  ) +

  scale_shape_manual(values = c(21, 22, 23, 24, 4)) +

  theme_classic() +
  theme(axis.title.x = element_markdown())


p2 <- ggplot(data = dat, aes(x = group, y = ft_area_pct)) +
  geom_boxplot()


fig1 <- plot_grid(p1, p2, ncol = 1, rel_heights = c(6, 4)) +
  annotate("text", x = c(0.02, 0.02), y = c(0.98, 0.38), label = c("A", "B"))


ggsave(
  filename = "figure1.pdf",
  device = "pdf",
  plot = fig1,
  width = 180,
  height = 120,
  units = "mm"
)
