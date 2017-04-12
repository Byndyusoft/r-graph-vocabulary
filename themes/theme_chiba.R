
# Chiba graphs theme
theme_chiba <- function(base_size = 12, base_family = "Muller"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.line.x = element_line(size = 0.2, colour = "black", linetype = "solid"),
      axis.line.y = element_line(size = 0.2, colour = "black", linetype = "solid"),
      axis.ticks = element_line(size = 0.2),
      #axis.ticks.length = unit(.85, "cm")
      axis.title = element_text(size = 14),
      axis.text = element_text(colour="black", size=8),
      legend.key=element_rect(colour=NA, fill =NA),
      panel.grid = element_line(size = 0.2, colour = "a0a0a0", linetype = "solid"),
      #panel.grid.minor = element_line(size = 0.1, colour = "#E4E0DA", linetype = "solid"),
      panel.border = element_blank(),
      panel.background = element_blank(),
      strip.background = element_rect(fill = NA),
      strip.text = element_text(size=6)
    )
}
