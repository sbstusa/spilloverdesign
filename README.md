# spilloverdesign

A repository with code to produce and evaluate experimental designs to estimate causal effects in the presence of spillovers. The two files here have slightly different pre-requisites.

# Two Level Randomization Notes File.

## Setup

To get this code you can either 
[clone](https://help.github.com/articles/cloning-a-repository/) this repository
to your computer or download a zip file of the repository using one of the
buttons on the github website screen.

The code here relies on a pre-release version of RItools
<https://github.com/markmfredrickson/RItools>. Because it is not on CRAN it
requires a little work to install. I hope that the following commands work to
install it plus its dependencies. The following code creates a local libraries
directory so that this process does not overwrite any other R libraries you may
have installed on your system. I hope that these commands work on Windows as
well as on Unix/OS X based systems.

```
dir.create("libraries")
.libPaths("libraries") ## make the default place for libraries the local one
install.packages(c("hexbin","xtable","svd","SparseM","abind"))
download.file("https://github.com/markmfredrickson/RItools/releases/download/rand-dist-v1.0/RItools_0.1-12.tar.gz",destfile="RItools_0.1-12.tar.gz")
install.packages("RItools_0.1-12.tar.gz")
```

The easiest way to make an html or pdf document from the .Rmd file is to use the rmarkdown library. I think it may be pre-installed in RStudio such that you can just click on the `Knit HTML` button in RStudio. If you are not using RStudio, you'll need to install rmarkdown first:

```
install('rmarkdown',dependencies=TRUE)
```

And then you can use the `render` function:

```
render("twolevelrand.Rmd") ## for an html document
render("twolevelrand.Rmd",output_format=pdf_document())

```

# The Saturation Design File

This file relies on the `googlesheets` library and, in turn, the first time you use this library, it wants to enable you to authenticate in Google, so you must render the file in interactive mode. The following should install the required packages.

```
install.packages(c("googlesheets","nbpMatching","maps"))
```

Then you can create the `experimentDat.csv` file and the `saturationDesign.html` file using the following commands (if you have SBST access to the Google Data Files).

```
library(rmarkdown)
render("saturationDesign.Rmd")
```


