library(r4ss)
setwd('C:/Users/ejdick/Desktop/chili/Model bcd, M116 profile female M')
dir.prof <- getwd()

label.string = "M_female"
par.string = "NatM_uniform_Fem_GP_1"
plot.string = "Female Natural Mortality Rate (1/yr)"
par.vec <- c(0.1, 0.125, 0.15, 0.171052, 0.175, 0.2, 0.225, 0.25, 0.275, 0.3, 0.325, 0.35)

# starter file should be changed to change
# 'Chili_2025.ctl' to 'control.ss'

prof.table <- profile(
  dir = dir.prof,
  oldctlfile = "control.ss_new",
  newctlfile = "control.ss",
  string = par.string,
  profilevec = par.vec,
  exe = "ss3_opt_win",
  extras = "-nohess -phase 5"
)
write.csv(prof.table, paste0(label.string,"_profile.csv"))

# re-run iterations 1, 8, 10, 11, 12 from phase 1 due to failed convergence
prof.table2 <- profile(
  dir = dir.prof,
  oldctlfile = "control.ss_new",
  newctlfile = "control.ss",
  string = par.string,
  profilevec = par.vec,
  whichruns = c(1, 8, 10, 11, 12),
  exe = "ss3_opt_win",
  extras = "-nohess"
)
prof.table2
write.csv(prof.table2, paste0(label.string,"_profile2.csv"))

# re-run iteration 11 from phase 3 due to failed convergence
prof.table3 <- profile(
  dir = dir.prof,
  oldctlfile = "control.ss_new",
  newctlfile = "control.ss",
  string = par.string,
  profilevec = par.vec,
  whichruns = c(11),
  exe = "ss3_opt_win",
  extras = "-nohess"
)
prof.table3
write.csv(prof.table3, paste0(label.string,"_profile3.csv"))

# re-run iteration 6 (M=0.2) NLL very large ?
prof.table3a <- profile(
  dir = dir.prof,
  oldctlfile = "control.ss_new",
  newctlfile = "control.ss",
  string = par.string,
  profilevec = par.vec,
  whichruns = c(6),
  exe = "ss3_opt_win",
  extras = "-nohess -phase 5"
)
prof.table3a
write.csv(prof.table3a, paste0(label.string,"_profile3a.csv"))



# that worked, combine converged runs into single table
prof.table4 <- rbind.data.frame(subset(prof.table, converged=="TRUE"),
                                subset(prof.table2, converged=="TRUE"),
								prof.table3)
# replace M=0.2 with revised result
tmp <- subset(prof.table4, Value!=0.2)
tmp
prof.table4 <- rbind.data.frame(tmp, prof.table3a)
prof.table4 <- prof.table4[order(prof.table4$Value), ]
prof.table4
write.csv(prof.table4, paste0(label.string,"_profile4.csv"))

########################## exclude M values > 0.25 from profile (way too big, can't read plots)
#result.list <- SSgetoutput(
#                  keyvec = 1:length(par.vec))
result.list <- SSgetoutput(
                  keyvec = 1:8)
out <- SSsummarize(result.list)

SSplotComparisons(out, print=TRUE, plotdir="plot_compare", legendlabels = paste0(label.string,"=",round(par.vec[1:8],3)), ptsize=8)
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
