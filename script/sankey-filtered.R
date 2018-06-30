library("networkD3")
library("igraph")

data <- read_graph("../processed-data/perl6use-vs-issues.net",format="pajek")
filtered <- delete.edges(data, which(E(data)$weight <=1)) 
smaller <- delete.vertices(filtered,which(degree(filtered)<1))
survey <-  igraph_to_networkD3(smaller)
sn <- sankeyNetwork(Links = survey$links, Nodes = survey$nodes, Source = "source",
                    Target = "target", Value = "value", NodeID = "name",
                    units = "answers", fontSize = 20, nodeWidth=30)
sn %>% saveNetwork( file= '../html/sankey-perl6use-vs-issues.html' )
