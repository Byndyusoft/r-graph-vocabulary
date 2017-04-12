
# Byndyusoft theme
theme_bs <- function(base_size = 12, base_family = "Geometria"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.line.x = element_line(size = 0.2, colour = "black", linetype = "solid"),
      axis.line.y = element_line(size = 0.2, colour = "black", linetype = "solid"),
      axis.ticks = element_line(size = 0.2),
      axis.title = element_text(size = 14),
      axis.text = element_text(colour="black", size=8),
      legend.key = element_rect(colour=NA, fill =NA),
      panel.grid =  element_blank(),
      panel.border = element_blank(),
      panel.background = element_rect(colour=NA, fill = "#F5F4F0"),
      strip.background = element_blank(),
      strip.text = element_text(size=6),
      strip.switch.pad.grid = unit(0, "cm"),
      strip.switch.pad.wrap = unit(0, "cm")
    )
}

