# Create a Saturation or Spillover-Detecting Randomized Experiment

A repository with code to produce and evaluate experimental designs to estimate causal effects in the presence of spillovers. The two files here have slightly different pre-requisites.

# Setup

To get this code you can either
[clone](https://help.github.com/articles/cloning-a-repository/) this repository
to your computer or download a zip file of the repository using one of the
buttons on the github website screen.

  The code here relies on a pre-release version of RItools
<https://github.com/markmfredrickson/RItools>. We include a source file of this
within the repository.

To begin, we recommend that you run the `runfirst-setup.R` file to install required R packages. For example you might start R and do:


```
source('runfirst-setup.R',verbose=TRUE)
```


# The Saturation Design File

This file relies on the `googlesheets` library and, in turn, the first time you use this library, it wants to enable you to authenticate in Google, so you must render the file in interactive mode. The following should install the required packages. This file will only work if you already have access to the SBST Google Drive.


Then you can create the `experimentDat.csv` file and the `saturationDesign.html` file using the following commands (if you have SBST access to the Google Data Files).

```
library(rmarkdown)
render("saturationDesign.Rmd")
```


# Two Level Randomization Notes File.

The easiest way to make an html or pdf document from the .Rmd file is to use the rmarkdown library. I think it may be pre-installed in RStudio such that you can just click on the `Knit HTML` button in RStudio. If you are not using RStudio, you'll need to install rmarkdown first:

```
install('rmarkdown',dependencies=TRUE)
```

And then you can use the `render` function:

```
render("twolevelrand.Rmd") ## for an html document
render("twolevelrand.Rmd",output_format=pdf_document())

```

