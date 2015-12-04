# spilloverdesign
A repository with code to produce and evaluate experimental designs to estimate causal effects in the presence of spillovers.

## Setup

Before using the code int he To get this code you will need to
[clone](https://help.github.com/articles/cloning-a-repository/) this repository
to your computer. Or download a zip file of the repository using one of the
buttons on the github website screen You should then download the pre-release
version of RItools
<https://github.com/markmfredrickson/RItools/releases/download/rand-dist-v1.0/RItools_0.1-12.tar.gz>
into that new directory.

Before installing it, you'll need to install some of the dependencies of this
version of RItools by hand because we haven't released it yet to CRAN. The
following code creates a local libraries directory so that this process does
not overwrite any other R libraries you may have installed on your system. I
hope that these commands work on Windows as well as on Unix/OS X based systems.

```
dir.create("libraries")
.libPaths("libraries") ## make the default place for libraries the local one
install.packages(c("hexbin","xtable","svd","SparseM","abind"))
download.file("https://github.com/markmfredrickson/RItools/releases/download/rand-dist-v1.0/RItools_0.1-12.tar.gz",destfile="RItools_0.1-12.tar.gz")
install.packages("RItools_0.1-12.tar.gz")
```





