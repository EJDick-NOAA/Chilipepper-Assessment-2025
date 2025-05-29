# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('C:/Users/ejdick/Desktop/chili/Model zzz, jitter 0point2 around Pre-STAR base M104')

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
  Njitter = 100,
  printlikes = TRUE,
  jitter_fraction = 0.2,
  init_values_src = 1,
  exe = "ss3_opt_win",
  verbose = FALSE,
  extras = "-nohess -nox"
)
jit.likes
min(jit.likes)


png("jitter.png", units="in", res=300, width=5, height=5)
plot(jit.likes, xlab="Iteration", ylab="Neg. Log Like.",
     main=NULL, bty='l', ylim=c(min(jit.likes),6000))
text(0.5*length(jit.likes), 5000,
     paste0("Min. NLL = ",min(jit.likes)))
dev.off()

