
# ...
# Install if it is not installed
# install.packages('qrencoder')
# install.packages('ggplot2')

#library(ggplot2)
library(qrencoder)


par(mar = c(0, 0, 0, 0))
p <- image(
    qrencode_raster("https://byndyusoft.com"),
    asp = 1,
    col = c("white", "black"),
    axes = FALSE,
    xlab = "",
    ylab = ""
)

# ggsave('qr_code.svg', p)
