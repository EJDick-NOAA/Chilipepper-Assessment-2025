# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 125, 2D selectivity with M116')
library(tidyverse)
library(ggsci)
library(dplyr)
library(metR)
library(reshape2)

# NO HESSIAN
#myreplist <- SS_output(dir=getwd(), covar=FALSE)
#tune_comps(myreplist, option="Francis")
#SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# REQUIRES HESSIAN
myreplist <- SS_output(dir=getwd(), covar=TRUE) # need covar to estimate bias ramp
#SS_fitbiasramp(myreplist, print=TRUE)
#tune_comps(myreplist, option="Francis")
#SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# contour plot of selectivity deviations

# dimensions
lbins <- 16:44 # pop. len. bins [cm]
years <- 1978:2024

seldev_matrix <- myreplist$seldev_matrix[[1]]
dimnames(seldev_matrix)[[1]]
dimnames(seldev_matrix)[[2]]

# change dimnames from length bin # to length in cm
dimnames(seldev_matrix)[[2]] <- lbins
names(dimnames(seldev_matrix))[2] <- "Length.cm"
dimnames(seldev_matrix)

seldev_long <- melt(seldev_matrix, varnames=names(dimnames(seldev_matrix)))
head(seldev_long)

sel.plot <- ggplot(seldev_long, aes(x=Year, y=Length.cm, z=value)) +
				   geom_contour_filled(bins=10)
sel.plot
ggsave("selectivity deviations.png", units='in', height=4, width=8, dpi=600)
