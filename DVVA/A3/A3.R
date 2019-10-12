#Install packages
install.packages("igraph")

#Load Data
email <- read.csv("https://raw.githubusercontent.com/13020363/UTS_ML2019_ID13020363/DVVA/DVVA/A3/email.csv", as.is=T)
emailnodes <- read.csv("https://raw.githubusercontent.com/13020363/UTS_ML2019_ID13020363/DVVA/DVVA/A3/emailnodes.csv", as.is=T)

#Load Library
library(igraph)

#Transform datatype to graph
nodes <- emailnodes
links <- email
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
net <- simplify(net, remove.multiple = F, remove.loops = T)

#Set nodes' colors based on closters
colrs <- c("gray50", "tomato", "yellow", "purple", "blue", "green")
V(net)$color <- colrs[V(net)$Cluster_No]

#set nodes' size
deg <- degree(net, mode="all")
V(net)$size <- deg*3

#Set edge width based on weight:
E(net)$width <- E(net)$Weight

#change arrow size and edge color:
E(net)$arrow.size <- .2
E(net)$edge.color <- "gray80"

#Set the network layout:
graph_attr(net, "layout") <- layout_with_lgl
plot(net, mark.groups=list(c(1,2,3), c(4,5,6), c(7,8,9), c(10,11,12), c(13,14,15), c(16,17,18)), mark.col="#C5E5E7")

#Show the legend
legend(x=-1.5, y=-1.1, c("1","2", "3", "4", "5", "6"), pch=21,
       col="#777777", pt.bg=colrs, pt.cex=2, cex=.8, bty="n", ncol=1)

