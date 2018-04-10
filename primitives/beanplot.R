
library(beanplot)

data("singer", package = "lattice")

par(lend = 1, mai = c(0.8, 0.8, 0.5, 0.5))

beanplot(
    height ~ voice.part,
    data = singer,
    ll = 0.04,
    main = "beanplot",
    ylab = "body height (inch)",
    side = "both",
    border = NA,
    col = list("black", c("grey", "white"))
)
legend(
    "bottomleft",
    fill = c("black", "grey"),
    legend = c("Group 2", "Group 1")
)