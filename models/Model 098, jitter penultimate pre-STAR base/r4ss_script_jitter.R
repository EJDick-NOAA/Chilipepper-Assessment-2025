# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('C:/Users/edward.dick/Desktop/chili/Model xxx, jitter pre-STAR base')

# NO HESSIAN
#myreplist <- SS_output(dir=getwd(), covar=FALSE)
#tune_comps(myreplist, option="Francis")
#SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# REQUIRES HESSIAN
###myreplist <- SS_output(dir=getwd(), covar=TRUE) # need covar to estimate bias ramp
###SS_fitbiasramp(myreplist, print=TRUE)
###tune_comps(myreplist, option="Francis")
###SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)
###
#### Exec Summ tables
###SSexecutivesummary(myreplist) # creates a 'tables' directory

jit.likes <- jitter(
  dir = getwd(),
  Njitter = 50,
  printlikes = TRUE,
  jitter_fraction = 0.1,
  init_values_src = 1,
  exe = "ss3_opt_win",
  verbose = FALSE,
  extras = "-nohess -nox"
)
jit.likes

