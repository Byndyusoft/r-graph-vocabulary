library(xlsx)
library(wordcloud)
library(RColorBrewer)

repository_directory <- "~/reps/r-graph-vocabulary/"
setwd(repository_directory)

df <- read.csv("data/tags-freq.csv", sep=";")

colorPallete <- brewer.pal(n = 8, name = 'RdPu') # 
par(family = "Akrobat") # font family

wordcloud(df$tag, df$freq, 
          scale = c(3, 0.5), min.freq = 50, max.words = Inf, 
          colors = colorPallete,
          random.order = FALSE, random.color = FALSE, rot.per = .0,
          ordered.colors = FALSE, use.r.layout = FALSE, fixed.asp = TRUE)
