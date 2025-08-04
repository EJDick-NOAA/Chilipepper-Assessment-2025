library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 102, profile steepness again, including h=072')


h.vec <- c(0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.72, 0.75, 0.8, 0.85, 0.9, 0.95)
prof.table <- profile(dir = getwd(),
                      #oldctlfile = "Chili_2025.ctl",
                      string = "SR_BH_steep",
		              profilevec = h.vec,
		              usepar = TRUE,
					  parstring = "SR_parm[2]",
		              exe = "ss3_opt_win",
		              extras = "-nohess -nox")

write.csv(prof.table, "Steepness_profile.csv")

