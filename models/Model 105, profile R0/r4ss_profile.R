library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 105, profile R0')


R0.vec <- c(9.25, 9.5, 9.75, 10, 10.1544, 10.25, 10.5, 10.75, 11)
prof.table <- profile(dir = getwd(),
                      #oldctlfile = "Chili_2025.ctl",
                      string = "R0",
		              profilevec = R0.vec,
		              usepar = TRUE,
					  parstring = "SR_parm[1]",
		              exe = "ss3_opt_win",
		              extras = "-nohess -nox")
prof.table
write.csv(prof.table, "R0_profile.csv")

result.list <- SSgetoutput(
                  keyvec = 1:length(R0.vec))
out <- SSsummarize(result.list)

SSplotComparisons(out, print=TRUE, plotdir="plot_compare", legendlabels = paste0("log(R0)=",round(R0.vec,2)), ptsize=8)
dev.off()

####### DO THESE ONE AT A TIME AND RENAME

# profile by data type
SSplotProfile(out, print=TRUE, profile.string="R0", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8)
			  
# profile length like by fleet
PinerPlot(out, print=TRUE, component = "Length_like", main="Lengths", profile.string="R0", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8)
			  
# profile age like by fleet
PinerPlot(out, print=TRUE, component = "Age_like", main="Ages", profile.string="R0", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8)
			  
# profile survey like by fleet
PinerPlot(out, print=TRUE, component = "Surv_like", main="Indices", profile.string="R0", add_cutoff=TRUE, plotdir="plot_compare",
              cex=0.7, cex.total=1, cex.main=1, ptsize=8)

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

legend.labels = paste0("log(R0)=",round(R0.vec,2))

model.comparison.table <- rbind(npar.vec, likelihood, parms.of.interest, der.quants)
row.names(model.comparison.table) <- 1:nrow(model.comparison.table)
names(model.comparison.table)[2:(mod.sum$n+1)] <- legend.labels
model.comparison.table
write.csv(model.comparison.table, paste0(getwd(),"/plot_compare/model_comparison_table.csv"), row.names=FALSE)

save.image('R0_profiles.RData')
