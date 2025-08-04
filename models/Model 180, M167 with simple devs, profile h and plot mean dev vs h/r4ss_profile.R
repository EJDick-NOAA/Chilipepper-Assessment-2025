library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 180, M167 with simple devs, profile h and plot mean dev vs h')
dir.prof <- getwd()

label.string = "h"
par.string = "SR_BH_steep"
plot.string = "BH_steepness (h)"
par.vec <- c(0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.72, 0.75, 0.8, 0.85, 0.9, 0.95)

# starter file should be changed to change
# 'Chili_2025.ctl' to 'control.ss'

prof.table <- profile(
  dir = dir.prof,
  oldctlfile = "control.ss_new",
  newctlfile = "control.ss",
  string = par.string,
  profilevec = par.vec,
  exe = "ss3_opt_win",
  extras = "-nohess -nox"
)
prof.table
write.csv(prof.table, paste0(label.string,"_profile.csv"))

## re-run iterations 7 & 11 from phase 4 due to failed convergence
#prof.table2 <- profile(
#  dir = dir.prof,
#  oldctlfile = "control.ss_new",
#  newctlfile = "control.ss",
#  string = par.string,
#  profilevec = par.vec,
#  whichruns = c(7, 11),
#  exe = "ss3_opt_win",
#  extras = "-nohess -phase 4"
#)
#write.csv(prof.table2, paste0(label.string,"_profile2.csv"))
#
## that worked, combine converged runs into single table
#prof.table3 <- rbind.data.frame(subset(prof.table, !(Value %in% c(0.55,0.72))), prof.table2)
#prof.table3 <- prof.table3[order(prof.table3$Value), ]
#prof.table3
#write.csv(prof.table3, paste0(label.string,"_profile3.csv"))


result.list <- SSgetoutput(
                  keyvec = 1:length(par.vec))
out <- SSsummarize(result.list)
save.image('h_profile.RData')

# plot the mean of the recruitment deviations vs. steepness
library(tidyverse)
# extract the mean of the main period rec devs from each run
rec.dev.means <- apply(subset(out$recdevs, substr(Label,1,4)=="Main")[1:length(par.vec)], 2, mean)
the.result <- cbind.data.frame(h=par.vec, rec.dev.means)
the.plot <- ggplot(the.result, aes(x=h, y=rec.dev.means)) + geom_line() + geom_point()
ggsave("rec_dev_mean_vs_steepness.png", width=7, height=5, dpi=300)

SSplotComparisons(out, print=TRUE, plotdir="plot_compare", legendlabels = paste0(label.string,"=",round(par.vec,3)), ptsize=8)
dev.off()

####### DO THESE ONE AT A TIME AND RENAME

# profile by data type
SSplotProfile(out, print=TRUE, profile.string=par.string, add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label=plot.string)
			  
# profile length like by fleet
PinerPlot(out, print=TRUE, component = "Length_like", main="Lengths", profile.string=par.string, add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label=plot.string)
			  
# profile age like by fleet
PinerPlot(out, print=TRUE, component = "Age_like", main="Ages", profile.string=par.string, add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label=plot.string)
			  			  
# profile survey like by fleet
PinerPlot(out, print=TRUE, component = "Surv_like", main="Indices", profile.string=par.string, add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label=plot.string)
			  			  
mod.sum <- out
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

legend.labels = paste0(label.string,"=",round(par.vec,3))

model.comparison.table <- rbind(npar.vec, likelihood, parms.of.interest, der.quants)
row.names(model.comparison.table) <- 1:nrow(model.comparison.table)
names(model.comparison.table)[2:(mod.sum$n+1)] <- legend.labels
model.comparison.table
write.csv(model.comparison.table, paste0(getwd(),"/plot_compare/model_comparison_table.csv"), row.names=FALSE)

save.image(paste0(label.string,"_profiles_v2.RData"))
