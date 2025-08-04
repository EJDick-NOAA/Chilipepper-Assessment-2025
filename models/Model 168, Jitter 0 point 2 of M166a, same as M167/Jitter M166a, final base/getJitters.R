# create data frame object containing parameter 'init' values in row 1, and jittered values in subsequent rows

setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 168, Jitter 0 point 2 of M166a, same as M167/Jitter M166a, final base')
library(r4ss)
Njit = 100 # automate this later

for (i in 1:Njit) {
   if (i==1) {
      
      # determine how many columns to read
      header.names <- scan(paste0("ParmTrace",i,".sso"), what="character", nlines=1)
      # exclude columns with component likelihoods
      header.names <- header.names[1:(which(header.names=="Component_like_starts_here")-1)]
      header.names
      max.col <- length(header.names)
      # get jittered values from first iteration
	  jits.df <- read.table(paste0("ParmTrace",i,".sso"), skip=1)[1,1:max.col]
	  names(jits.df) <- header.names
   } else {
      # get jittered values from iterations 2:Njit
	  tmp <- read.table(paste0("ParmTrace",i,".sso"), skip=1)[1,1:max.col]
	  names(tmp) <- header.names
	  jits.df <- rbind.data.frame(jits.df, tmp)
	  rm(tmp)
   }
}
summary(jits.df)

# get asymptotic standard errors and bounds for each parameter
# use r4ss 'parameters' object from base model run
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 167, proposed base model, Friday AM')
myreplist <- SS_output(dir=getwd(), covar=TRUE)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 168, Jitter 0 point 2 of M166a, same as M167/Jitter M166a, final base')

write.csv(myreplist$parameters, "parameters.csv", row.names=F, quote=F)
myreplist$parameters[!is.na(myreplist$parameters$Active_Cnt), 1:12]

# convert jittered parms and bounds to z-scores


# plot z-score version of jitters (horizontally jittered) with z-score bounds



