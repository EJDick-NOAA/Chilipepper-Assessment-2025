# test r4ss installation
#install.packages("remotes")
#remotes::install_github("r4ss/r4ss")
library(r4ss)
setwd('E:/github/Black-Rockfish-California-2023/c025_revise_historical_average_weights')

# directories where models were run need to be defined
dir1 <- 'E:/github/Black-Rockfish-California-2023/California black rockfish pre-STAR base models/Central California Black Rockfish update age0 indices'
dir2 <- 'E:/github/Black-Rockfish-California-2023/c025_revise_historical_average_weights'
#dir3 <- 'E:/github/Black-Rockfish-California-2023/c024_updated_age_matrix_AND_use_spline_functional_maturity'
#dir4 <- 'E:/ejdick/projects/~Black Rockfish California 2023/model/005_bridge model, SS version 33021'
plot.dir <- 'E:/github/Black-Rockfish-California-2023/c025_revise_historical_average_weights/plot_compare'

# read two models
mod1 <- SS_output(dir=dir1)
mod2 <- SS_output(dir=dir2)
#mod3 <- SS_output(dir=dir3)
#mod4 <- SS_output(dir=dir4)

# create list summarizing model results
mod.sum <- SSsummarize(list(mod1, mod2))

# legend labels and table column names
legend.labels <- c("Pre-STAR central base model","Pre-1980 rec. catches using 1980-89 MRFSS avg. weight")

# plot comparisons
SSplotComparisons(mod.sum, legendlabels=legend.labels, print=TRUE, plotdir=plot.dir, btarg = -1, minbthresh = -1)

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
der.quants <- subset(mod.sum$quants, Label %in% c("SSB_unfished","Totbio_unfished","Bratio_2023","Recr_unfished","Dead_Catch_SPR","OFLCatch_2023"))
der.quants <- der.quants[, c(mod.sum$n+1,1:mod.sum$n)] # reorder columns
der.quants

model.comparison.table <- rbind(npar.vec, likelihood, parms.of.interest, der.quants)
row.names(model.comparison.table) <- 1:nrow(model.comparison.table)
names(model.comparison.table)[2:(mod.sum$n+1)] <- legend.labels
model.comparison.table
write.csv(model.comparison.table, paste0(plot.dir,"/model_comparison_table.csv"), row.names=FALSE)

