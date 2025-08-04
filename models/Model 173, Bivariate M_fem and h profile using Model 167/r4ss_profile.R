library(r4ss)
setwd('C:/Users/ejdick/Desktop/chili/Bivariate M_fem and h profile using Model 167')
dir.prof <- getwd()

Mvec = c(0.14, 0.15, 0.16, 0.165249, 0.17, 0.175467, 0.18, 0.19, 0.2)
hvec = c(0.3, 0.325, 0.35, 0.383418, 0.4, 0.5, 0.6, 0.7, 0.72, 0.75, 0.8, 0.85, 0.9, 0.95)

length(Mvec)*length(hvec)

par_table <- expand.grid(
  Mvec,
  hvec
)
par_table

prof.table <- profile(
  dir = dir.prof,
  oldctlfile = "control.ss_new",
  newctlfile = "control.ss",
  string = c("NatM_uniform_Fem_GP_1", "steep"),
  profilevec = par_table,
  exe = "ss3_opt_win",
  extras = "-nohess -nox"
)
write.csv(prof.table, "bivariate_M+h_profile.csv")

result.list <- SSgetoutput(
                  keyvec = 1:nrow(par_table))
out <- SSsummarize(result.list)

# plots for 100 runs will get messy, just extract the important quants
##SSplotComparisons(out, print=TRUE, plotdir="plot_compare", legendlabels = paste0("M=",round(M.vec,3)), ptsize=8)
##dev.off()
##
######### DO THESE ONE AT A TIME AND RENAME
##
### profile by data type
##SSplotProfile(out, print=TRUE, profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
##              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
##			  profile.label="Female Natural Mortality (M)")
##			  
### profile length like by fleet
##PinerPlot(out, print=TRUE, component = "Length_like", main="Lengths", profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
##              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
##			  profile.label="Female Natural Mortality (M)")
##			  
### profile age like by fleet
##PinerPlot(out, print=TRUE, component = "Age_like", main="Ages", profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
##              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
##			  profile.label="Female Natural Mortality (M)")
##			  
### profile survey like by fleet
##PinerPlot(out, print=TRUE, component = "Surv_like", main="Indices", profile.string="NatM_uniform_Fem", add_cutoff=TRUE, plotdir="plot_compare",
##              cex=0.7, cex.total=1, cex.main=1, ptsize=8,
##			  profile.label="Female Natural Mortality (M)")
##
##mod.sum <- out
### make a table of likelihoods, estimated parameters, and derived quantities
### get parameters, excluding recdevs
### only include parameters that change across runs, exclude rec devs
##parameters <- mod.sum$pars[mod.sum$pars$recdev==FALSE, c(mod.sum$n+1,1:mod.sum$n)]
##parms.that.change <- parameters[apply(parameters[2:(mod.sum$n+1)], 1, function(x) length(unique(x))>1),]
### catchabilities are not estimated
##parms.of.interest <- subset(parms.that.change, substr(Label, 1, 3) != "LnQ")
##likelihood <- mod.sum$likelihoods[mod.sum$likelihoods$Label %in%
##                                  c("TOTAL","Survey","Length_comp","Age_comp","Recruitment","Parm_priors",""), c(mod.sum$n+1,1:mod.sum$n)]
### create row with number of estimated parameters per model (including rec devs)
##npar.vec <- likelihood[1,] # use first row of likelihood to initialize object
##npar.vec["Label"] <- "N.Parms"
##npar.vec[1,2:(mod.sum$n+1)] <- mod.sum$npar
##names(npar.vec) <- names(likelihood)
##npar.vec
##
### get derived quantities
##der.quants <- subset(mod.sum$quants, Label %in% c("SSB_unfished","Totbio_unfished","Bratio_2025","Recr_unfished","Dead_Catch_SPR","OFLCatch_2025"))
##der.quants <- der.quants[, c(mod.sum$n+1,1:mod.sum$n)] # reorder columns
##der.quants
##
##legend.labels = paste0("M=",round(M.vec,3))
##
##model.comparison.table <- rbind(npar.vec, likelihood, parms.of.interest, der.quants)
##row.names(model.comparison.table) <- 1:nrow(model.comparison.table)
##names(model.comparison.table)[2:(mod.sum$n+1)] <- legend.labels
##model.comparison.table
##write.csv(model.comparison.table, paste0(getwd(),"/plot_compare/model_comparison_table.csv"), row.names=FALSE)

save.image('bivariate_M+h_profiles_v1.RData')

# compile data
tmp <- cbind.data.frame(par_table, t(out$likelihoods[,1:nrow(par_table)]))
names(tmp) <- c("M_female","BH_steepness",out$likelihoods$Label)
tmp$NLL.change <- with(tmp, TOTAL - min(TOTAL))
tmp
write.csv(tmp, "bivariate_M+h_profile.csv", row.names=F, quote=F)

library(tidyverse)
library(ggsci)
bivar.Mh <- ggplot(tmp, aes(x=M_female, y=BH_steepness, z=NLL.change)) +
                   geom_contour_filled(breaks=c(0,
				                                qchisq(0.75,2)/2,
												qchisq(0.90,2)/2,
												qchisq(0.95,2)/2,
												qchisq(0.99,2)/2)) #+
#                   scale_fill_discrete(labels=c('75% C.I.', '90% C.I.', '95% C.I.', '99% C.I.'))
bivar.Mh + guides(fill=guide_legend(title="NLL-min(NLL)")) + scale_fill_grey() +
   geom_point(x=0.175467, y=0.383418, colour='white') + # MLE
   geom_point(x=0.165249, y=0.72, colour='red')   # base
   
ggsave("bivariate_M+h_profile.png", units='in', height=4, width=5, dpi=300)
