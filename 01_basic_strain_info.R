library(ggtree)

oldwd <- getwd()
setwd("plotTree/tree_example_april2015/")

info <- read.csv("info.csv")
tree <- read.tree("tree.nwk")
cols <- c(HCMC='black', Hue='purple2', KH='skyblue2')

p <- ggtree(tree) %<+% info +
    theme(legend.position=c(.1, .9)) +  xlim(NA, 40) +
    geom_tippoint(aes(color=location)) + scale_color_manual(values=cols) +
    geom_tiplab(aes(label=location), align=T, linetype=NA, size=2, hjust=0.5, offset=3) +
    geom_tiplab(aes(label=name), align=T, linetype=NA, size=2, offset=6, hjust=0.5) +
    geom_tiplab(aes(label=year), align=T, linetype=NA, size=2, offset=9, hjust=0.5)


setwd(oldwd)
print(p)

