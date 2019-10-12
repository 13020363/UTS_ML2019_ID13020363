#NetworkD3
#Install package
iinstall.packages(networkD3)

#Load package
library(networkD3)

#Load data
email <- read.csv("https://raw.githubusercontent.com/13020363/UTS_ML2019_ID13020363/DVVA/DVVA/A3/email.csv", as.is=T)
emailnodes <- read.csv("https://raw.githubusercontent.com/13020363/UTS_ML2019_ID13020363/DVVA/DVVA/A3/emailnodes.csv", as.is=T)
nodes <- emailnodes
links <- email

networkD3 = forceNetwork(Links = links, Nodes = nodes, Source="from", Target="to",
             NodeID = "ID", Group = "Cluster_No",linkWidth = 1,
             linkColour = "#afafaf", fontSize=12, zoom=T, legend=T, opacity = 0.8, charge=-300, 
             width = 600, height = 400)

saveWidget(networkD3, file="NetworkD3.html")
browseURL("NetworkD3.html")