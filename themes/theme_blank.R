# http://docs.ggplot2.org/current/theme.html

# No captions, backgrounds and axis
theme_blank <-  function(base_size = 12, base_family = "Muller"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
    theme(line = element_blank(),
          text = element_blank(),
          panel.background = element_blank(),
          panel.border = element_blank(),
          title = element_blank()
    )
}
