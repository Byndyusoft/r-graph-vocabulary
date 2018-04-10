
# Rostin theme
theme_rostin <- function(base_size = 12, base_family = "RF Rostin")
{
    require(ggthemes)
    require(rcartocolor)
    
    theme_tufte(base_size = base_size, base_family = base_family) %+replace%
        theme(
            axis.line.x = element_line(size = 0.2, colour = "black", linetype = "solid"),
            axis.line.y = element_line(size = 0.2, colour = "black", linetype = "solid"),
            axis.ticks = element_line(size = 0.2),
            # axis.text = element_text(colour = "black", size = 8),
            
            plot.title = element_text(size = base_size, hjust = 0.5, margin = margin(10, 0, 0, 0)),
            axis.title.x = element_text(margin = margin(15, 0, 10, 0), hjust = 0.95),
            axis.title.y = element_text(margin = margin(0, 10, 0, 10), hjust = 0.95, angle = 90),
            
            legend.key = element_rect(colour = NA, fill = NA),
            panel.grid =  element_blank(),
            panel.border = element_blank(),
            panel.background = element_rect(colour = NA, fill = "#ffffff"),
            strip.background = element_rect(colour = NA, fill = NA),
            
            strip.text = element_text(size = 8, hjust = 1),
            strip.switch.pad.grid = unit(1, "pt"),
            strip.switch.pad.wrap = unit(1, "pt")
        )
}

