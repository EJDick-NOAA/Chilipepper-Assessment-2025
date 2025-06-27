# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 166a, STARbase, Request 17 - Tuning Ad Nauseum')

# NO HESSIAN
#myreplist <- SS_output(dir=getwd(), covar=FALSE)
#tune_comps(myreplist, option="Francis")
#SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# REQUIRES HESSIAN
myreplist <- SS_output(dir=getwd(), covar=TRUE) # need covar to estimate bias ramp
write.csv(myreplist$sigma_R_info, "sigma_R_info.csv", row.names=F, quote=F)
SS_fitbiasramp(myreplist, print=TRUE)
tune_comps(myreplist, option="Francis")
SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# Exec Summ tables
SSexecutivesummary(myreplist) # creates a 'tables' directory
