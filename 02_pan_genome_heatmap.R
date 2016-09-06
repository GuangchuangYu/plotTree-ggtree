library(ggtree)

oldwd <- getwd()
setwd("plotTree/tree_example_april2015/")

info <- read.csv("info.csv")
tree <- read.tree("tree.nwk")
cols <- c(HCMC='black', Hue='purple2', KH='skyblue2')

heatmapData <- read.csv("pan.csv", row.names=1)
h <- hclust(dist(t(heatmapData)), 'ward')
heatmapData <- heatmapData[, h$order]

p <- ggtree(tree) %<+% info +
    geom_tippoint(aes(color=location)) + scale_color_manual(values=cols)
p2 <- gheatmap(p, heatmapData, low="white", high="black", color=NULL, width=3, colnames_position="top", font.size=.5, colnames_angle=90, colnames_offset_y = 1, hjust=0)


setwd(oldwd)
print(p2)

