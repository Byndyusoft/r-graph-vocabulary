library(tidyverse)
library(navdata)

data('phone.call2')

nodes <- phone.call2$nodes
edges <- phone.call2$edges


nodes_d3 <- mutate(nodes, id = id - 1)
edges_d3 <- mutate(edges, from = from - 1, to = to - 1)


library(networkD3)

forceNetwork(
    Links = edges_d3, Nodes = nodes_d3,  
    Source = "from", Target = "to",      # so the network is directed.
    NodeID = "label", Group = "id", Value = "weight", 
    opacity = 1, fontSize = 16, zoom = TRUE
)