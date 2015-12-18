#!/bin/bash

## if [ -n $NM ]; then
##   Rscript -e "library(methods);library(knitr); knit('$NM.Rnw')"; latexmk -pdf $NM.tex
## fi



if [ -n $1 ]; then
  Rscript -e "library(methods);library(knitr); knit('$1.Rmd')";  pandoc $1.md -s --mathjax -o $1.html
fi
