
library(ggplot2)
library(ggrepel)

cities_table <- read.csv('data/cities_n_cto.csv')

breaks <- as.integer(10^(-10:9))
minor_breaks <- rep(1:9, 21) * (10^rep(-10:10, each = 9))

ggplot(cities_table, aes(cto_qty, amount/1e6)) +
    geom_point(col = '#EA3036') +
    geom_text_repel(label = cities_table$filial_name, segment.alpha = 0.2) +
    scale_y_log10(breaks = breaks, minor_breaks = minor_breaks) +
    theme(panel.grid.major.y = element_line(size = 0.25),
          panel.grid.minor.y = element_line(size = 0.1)) +
    theme_minimal()
