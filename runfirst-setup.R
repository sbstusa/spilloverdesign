## This file sets up the environment. It should be run first. In a Makefile based workflow, other files should depend on it.

dir.create("libraries")
.libPaths("libraries") ## make the default place for libraries the local one
install.packages(c("hexbin","xtable","svd","SparseM","abind"))
download.file("https://github.com/markmfredrickson/RItools/releases/download/rand-dist-v1.0/RItools_0.1-12.tar.gz",destfile="RItools_0.1-12.tar.gz")
install.packages("RItools_0.1-12.tar.gz",repos=NULL)
install.packages("rmarkdown")
install.packages("googlesheets")
