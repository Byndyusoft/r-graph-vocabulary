library(ggplot2)

repository_directory <- "/Users/andrew/reps/r-graph-vocabulary/"
setwd(repository_directory)

source("themes/theme_blank.R")

df <- read.csv("data/3-columns.csv", sep=";")
names(df) <- c("col1", "col2", "col3") # names

x_seq <- seq(1:length(df$col1))
ggplot(df, aes(x = x_seq, y = col1)) + geom_bar(stat = "identity")+ theme_blank()
