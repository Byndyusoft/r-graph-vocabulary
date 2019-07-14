
library(jsonlite)

URL <- paste0(
    "https://cdn.rawgit.com/christophergandrud/networkD3/",
    "master/JSONdata/energy.json")
Energy <- jsonlite::fromJSON(URL)

library(networkD3)
sankeyNetwork(
    Links = Energy$links,
    Nodes = Energy$nodes,
    Source = "source",
    Target = "target",
    Value = "value",
    NodeID = "name",
    units = "TWh",
    fontSize = 12,
    nodeWidth = 30
)


# ...


library(tidyverse)
library(navdata)

data('phone.call2')

nodes <- phone.call2$nodes
edges <- phone.call2$edges

nodes_d3 <- mutate(nodes, id = id - 1)
edges_d3 <- mutate(edges, from = from - 1, to = to - 1)


library(networkD3)

sankeyNetwork(
    Links = edges_d3,
    Nodes = nodes_d3,
    Source = "from",
    Target = "to",
    NodeID = "label",
    Value = "weight",
    fontSize = 16,
    unit = "Letter(s)"
)


