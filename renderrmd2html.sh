#!/bin/bash

if [ -n $1 ]; then
  Rscript -e "library(methods);library(rmarkdown); render('$1.Rmd')"
fi
