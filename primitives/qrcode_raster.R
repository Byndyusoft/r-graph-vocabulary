
# ...
# Install if it is not installed
# install.packages('qrencoder')

library(qrencoder)

par(mar = c(0, 0, 0, 0))
p <- image(
    qrencode_raster("https://byndyusoft.com/internship"),
    asp = 1,
    col = c("white", "black"),
    axes = FALSE,
    xlab = "",
    ylab = ""
)