TROM: Transcriptome Overlap Measure
================
2020-02-19

<!-- README.md is generated from README.Rmd. Please edit that file -->
Introduction
------------

A new bioinformatic tool for comparing transcriptomes of two biological samples from the same or different species. The mapping is conducted based on the overlap of the associated genes of different samples. Please refer to our publication at [Statistic in Biosciences](https://link.springer.com/article/10.1007%2Fs12561-016-9163-y) for detailed description of our method.

Installation
------------

You can install `TROM` from github with:

``` r
# install.packages("devtools")

### Install dependencies 
# if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
# BiocManager::install(c("GO.db", "topGO"))

devtools::install_github("Vivianstats/TROM")
```
