library(r4ss)
setwd('C:/Users/ejdick/Desktop/chili/Model 149, profile R0')
dir.prof <- getwd()

label.string = "logR0"
par.string = "R0"
plot.string = "log_R0"
par.vec <- c(8.5, 9, 9.5, 10, 10.2399, 10.5, 11, 11.5)

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
write.csv(prof.table, paste0(label.string,"_profile.csv"))

# one run didn't converge, try starting from different phase
prof.table2 <- profile(
  dir = dir.prof,
  oldctlfile = "control.ss_new",
  newctlfile = "control.ss",
  string = par.string,
  profilevec = par.vec,
  whichruns = 2,
  exe = "ss3_opt_win",
  extras = "-nohess -phase 2"
)
prof.table2
write.csv(prof.table2, paste0(label.string,"_profile2.csv"))

# that worked, combine converged runs into single table
prof.table3 <- rbind.data.frame(subset(prof.table, Value!=9), prof.table2)
prof.table3 <- prof.table3[order(prof.table3$Value), ]
prof.table3
write.csv(prof.table3, paste0(label.string,"_profile3.csv"))

result.list <- SSgetoutput(
                  keyvec = 1:length(par.vec))
out <- SSsummarize(result.list)

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
