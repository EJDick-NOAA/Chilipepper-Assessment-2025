# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 093, likelihood profiles')

# NO HESSIAN
##myreplist <- SS_output(dir=getwd(), covar=FALSE)
##tune_comps(myreplist, option="Francis")
##SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)
##
### REQUIRES HESSIAN
##myreplist <- SS_output(dir=getwd(), covar=TRUE) # need covar to estimate bias ramp
##SS_fitbiasramp(myreplist, print=TRUE)
##tune_comps(myreplist, option="Francis")
##SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# Exec Summ tables
#SSexecutivesummary(myreplist) # creates a 'tables' directory
h.vec <- seq(0.3, 0.9, 0.1)
profile(dir = getwd(),
        oldctlfile = "Chili_2025.ctl",
        string = "SR_BH_steep",
		profilevec = h.vec,
		globalpar = TRUE,
		exe = "ss3_opt_win",
		extras = "-nohess -nox")

result.list <- SSgetoutput(
                  keyvec = length(h.vec))
#out <- SSsummarize(result.list)
