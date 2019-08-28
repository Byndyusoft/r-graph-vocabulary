
# ...
# Install if it is not installed
# install.packages('qrencoder')
# install.packages('ggplot2')

library(ggplot2)
library(qrencoder)
library(magrittr)
library(dplyr)

df <- qrencode_df("https://byndyusoft.com/internship") %>% 
    filter(z == 1) %>% 
    select(x, y)

p <- ggplot(df) + 
    geom_raster(aes(x, y), fill = "black") + 
    coord_equal() +
    theme_void()

ggsave('qr_code.svg', p)
