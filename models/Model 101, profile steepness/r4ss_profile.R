library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 101, profile steepness')


h.vec <- seq(0.3, 0.9, 0.05)
prof.table <- profile(dir = getwd(),
                      oldctlfile = "Chili_2025.ctl",
                      string = "SR_BH_steep",
		              profilevec = h.vec,
		              #usepar = TRUE,
					  #globalpar = TRUE,
		              exe = "ss3_opt_win",
		              extras = "-nohess -nox")

write.csv(prof.table, "Steepness_profile.csv")

result.list <- SSgetoutput(
                  keyvec = length(h.vec))

PinerPlot(result.list)
