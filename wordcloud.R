library(wordcloud)
library(RColorBrewer)

repository_directory <- "~/reps/r-graph-vocabulary/"
setwd(repository_directory)

df <- read.csv("data/tags-freq.csv", sep=";")

colorPallete <- brewer.pal(n = 8, name = 'RdPu') # 
par(family = "Akrobat") # font family

wordcloud(df$tag, df$freq,        # text chunks and their frequencies
          scale = c(3, 0.5),      # scale range
          min.freq = 50,          # min of m
          max.words = Inf,        # sample size
          colors = colorPallete,  # map colors
          random.order = FALSE,  
          random.color = FALSE,
          rot.per = .0,           # possible rotation, 0 to deny rotation
          ordered.colors = FALSE,
          use.r.layout = FALSE, 
          fixed.asp = TRUE)