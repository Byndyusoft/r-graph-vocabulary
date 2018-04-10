# https://github.com/wilkox/treemapify
#install.packages('treemapify')

library(RColorBrewer)
library(ggplot2)
library(treemapify)
library(viridis)

ggplot(G20, aes(area = gdp_mil_usd, fill = hdi)) +
    geom_treemap()


ggplot(G20, aes(area = gdp_mil_usd, fill = hdi, label = country)) +
    geom_treemap() +
    geom_treemap_text(colour = "white", place = "left",
                      grow = FALSE)


ggplot(G20, aes(area = gdp_mil_usd, 
                fill = hdi, 
                label = country,
                subgroup = region)) +
    geom_treemap() +
    geom_treemap_subgroup_border(col='white') +
    geom_treemap_subgroup_text(family = "Arial Black", 
                               place = "bottomleft", 
                               padding.x = grid::unit(1, "mm"),
                               padding.y = grid::unit(2, "mm"),
                               grow = FALSE, 
                               alpha = 0.25, 
                               colour = "black", 
                               min.size = 8) +
    geom_treemap_text(family = "Arial",
                      colour = "black",
                      place = "topleft",
                      padding.x = grid::unit(2, "mm"),
                      padding.y = grid::unit(2, "mm"),
                      reflow = T) +
    scale_fill_distiller(palette = "Spectral")
