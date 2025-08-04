# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 178, MI weights with M167')

# NO HESSIAN
myreplist <- SS_output(dir=getwd(), covar=FALSE)
tune_comps(myreplist, option="MI")
SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# REQUIRES HESSIAN
#myreplist <- SS_output(dir=getwd(), covar=TRUE) # need covar to estimate bias ramp
#write.csv(myreplist$sigma_R_info, "sigma_R_info.csv", row.names=F, quote=F)
#SS_fitbiasramp(myreplist, print=TRUE)
#tune_comps(myreplist, option="Francis")
#SS_plots(replist = myreplist, datplot=TRUE, ptsize=8)

# Exec Summ tables
###table_exec_summary(myreplist) # creates a 'tables' directory
###
#### note, this new version saves only .rda files
#### convert .rda files to .csv
###rda.names <- list.files(paste0(getwd(),"/tables"))
###obj.names <- sub("\\.[^.]+$", "", rda.names)
#### one of the files has a different filename than the data frame
###obj.names[which(obj.names=="mortality_all_years")] <- "mortality"
###for (i in 1:length(rda.names)) {
###   load(paste0(getwd(),"/tables/",rda.names[i]))
###   csv.name <- obj.names[i]
###   write.csv(get(csv.name)$table, paste0(getwd(),"/tables/",csv.name,".csv"), row.names=F, quote=F)
###}
###
