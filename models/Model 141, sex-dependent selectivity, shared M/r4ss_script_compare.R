# test r4ss installation
#install.packages("remotes")
#remotes::install_github("r4ss/r4ss")
library(r4ss)
model.dir <- "Model 141, sex-dependent selectivity, shared M"
setwd(paste0("E:/ejdick/projects/~Chilipepper 2025/model/",model.dir))

# directories where models were run need to be defined
# dir1 is the current model
dir1 <- getwd()

# dir2, dir3, etc. are the models being compared


dir2 <- "E:/ejdick/projects/~Chilipepper 2025/model/Model 116, pre-STAR base, no early devs, hess_step"
#dir3 <- "E:/ejdick/projects/~Chilipepper 2025/model/Model 084, allow domed for NET (check with hess)"
#dir4 <- "E:/ejdick/projects/~Chilipepper 2025/model/Model 083, M066 with h=0.72 no retuning, ~1 change in NLL"
#dir5 <- "E:/ejdick/projects/~Chilipepper 2025/model/Model 066, add GMT catch projects to forecast file"

# comparison plots are saved to current model directory in subfolder "plot_compare"
plot.dir <- paste0("E:/ejdick/projects/~Chilipepper 2025/model/",model.dir,"/plot_compare")

# read models
mod1 <- SS_output(dir=dir1)
mod2 <- SS_output(dir=dir2)
#mod3 <- SS_output(dir=dir3)
#mod4 <- SS_output(dir=dir4)
#mod5 <- SS_output(dir=dir5)

# create list summarizing model results
mod.sum <- SSsummarize(list(mod1, mod2)) #, mod3, mod4, mod5))

# legend labels and table column names
legend.labels <- c("M141 est apical male selex", "M116 Pre-STAR base")

# plot comparisons
#SSplotComparisons(mod.sum, legendlabels=legend.labels, print=TRUE, plotdir=plot.dir, btarg = -1, minbthresh = -1)
SSplotComparisons(mod.sum, legendlabels=legend.labels, print=TRUE, plotdir=plot.dir)

# make a table of likelihoods, estimated parameters, and derived quantities
# get parameters, excluding recdevs
# only include parameters that change across runs, exclude rec devs
parameters <- mod.sum$pars[mod.sum$pars$recdev==FALSE, c(mod.sum$n+1,1:mod.sum$n)]
parms.that.change <- parameters[apply(parameters[2:(mod.sum$n+1)], 1, function(x) length(unique(x))>1),]
# catchabilities are not estimated
parms.of.interest <- subset(parms.that.change, substr(Label, 1, 3) != "LnQ")
likelihood <- mod.sum$likelihoods[mod.sum$likelihoods$Label %in%
                                  c("TOTAL","Survey","Length_comp","Age_comp","Recruitment","Parm_priors",""), c(mod.sum$n+1,1:mod.sum$n)]
# create row with number of estimated parameters per model (including rec devs)
npar.vec <- likelihood[1,] # use first row of likelihood to initialize object
npar.vec["Label"] <- "N.Parms"
npar.vec[1,2:(mod.sum$n+1)] <- mod.sum$npar
names(npar.vec) <- names(likelihood)
npar.vec

# get derived quantities
der.quants <- subset(mod.sum$quants, Label %in% c("SSB_unfished","Totbio_unfished","Bratio_2025","Recr_unfished","Dead_Catch_SPR","OFLCatch_2025"))
der.quants <- der.quants[, c(mod.sum$n+1,1:mod.sum$n)] # reorder columns
der.quants

model.comparison.table <- rbind(npar.vec, likelihood, parms.of.interest, der.quants)
row.names(model.comparison.table) <- 1:nrow(model.comparison.table)
names(model.comparison.table)[2:(mod.sum$n+1)] <- legend.labels
model.comparison.table
write.csv(model.comparison.table, paste0(plot.dir,"/model_comparison_table.csv"), row.names=FALSE)

