
library(networkD3)

sport_items <- data.frame(
    name = c(
            'Все дети', # 0
            'Оттестированные', # 1
            'Спорт', # 2
            'Проф. спорт', # 3
            'Чемпионы', # 4
            'Не тестировавшиеся' # 5,
        ),
    group = c(
            'in', # 0
            'in', # 1
            'in',
            'in',
            'in',
            'out' # 5
    ),
    stringsAsFactors = FALSE
)

sport_flow <- data.frame(
    source = c(0, 0, 1, 5, 2, 3, 5, 5),
    target = c(1, 5, 2, 2, 3, 4, 3, 4),
    value = c(62, 38, 50, 20, 15, 5, 3, 1),
    group = c('in', 'out', 'in', 'out', 'in', 'in', 'out', 'out'),
    stringsAsFactors = FALSE
)

sankeyNetwork(
    Links = sport_flow,
    Nodes = sport_items,
    Source = "source",
    Target = "target",
    Value = "value",
    NodeID = "name",
    NodeGroup = "group",
    LinkGroup = "group",
    fontSize = 14,
    fontFamily = 'RF Rostin',
    nodeWidth = 6,
    nodePadding = 10,
    margin = 20,
    colourScale = JS('d3.scaleOrdinal().domain(["in","out"]).range(["#81BE7E","#AE8EC2"])'),
    sinksRight = FALSE
)


