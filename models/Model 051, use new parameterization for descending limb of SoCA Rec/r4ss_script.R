# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 051, use new parameterization for descending limb of SoCA Rec')

# NO HESSIAN
myreplist <- SS_output(dir=getwd(), covar=FALSE)
tune_comps(myreplist, option="Francis")
SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# REQUIRES HESSIAN
myreplist <- SS_output(dir=getwd(), covar=TRUE) # need covar to estimate bias ramp
SS_fitbiasramp(myreplist, print=TRUE)
tune_comps(myreplist, option="Francis")
SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# Exec Summ tables
SSexecutivesummary(myreplist) # creates a 'tables' directory
