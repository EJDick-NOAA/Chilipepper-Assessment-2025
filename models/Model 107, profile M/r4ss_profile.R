library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 107, profile M')


M.vec <- c(0.1, 0.125, 0.150, 0.175, 0.178691, 0.2, 0.225, 0.25)
prof.table <- profile(dir = getwd(),
                      #oldctlfile = "Chili_2025.ctl",
                      string = "NatM_uniform_Fem",
		              profilevec = M.vec,
		              usepar = TRUE,
					  parstring = "MGparm[1]",
		              exe = "ss3_opt_win",
		              extras = "-nohess -nox")
prof.table
write.csv(prof.table, "M_profile.csv")

result.list <- SSgetoutput(
                  keyvec = 1:length(M.vec))
out <- SSsummarize(result.list)

SSplotComparisons(out, print=TRUE, plotdir="plot_compare", legendlabels = paste0("M=",round(M.vec,3)), ptsize=8)
dev.off()

####### DO THESE ONE AT A TIME AND RENAME

# profile by data type
SSplotProfile(out, print=TRUE, profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label="Female Natural Mortality (M)")
			  
# profile length like by fleet
PinerPlot(out, print=TRUE, component = "Length_like", main="Lengths", profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label="Female Natural Mortality (M)")
			  
# profile age like by fleet
PinerPlot(out, print=TRUE, component = "Age_like", main="Ages", profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label="Female Natural Mortality (M)")
			  
# profile survey like by fleet
PinerPlot(out, print=TRUE, component = "Surv_like", main="Indices", profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
			  profile.label="Female Natural Mortality (M)")

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

legend.labels = paste0("M=",round(M.vec,3))

model.comparison.table <- rbind(npar.vec, likelihood, parms.of.interest, der.quants)
row.names(model.comparison.table) <- 1:nrow(model.comparison.table)
names(model.comparison.table)[2:(mod.sum$n+1)] <- legend.labels
model.comparison.table
write.csv(model.comparison.table, paste0(getwd(),"/plot_compare/model_comparison_table.csv"), row.names=FALSE)

save.image('M_profiles.RData')
