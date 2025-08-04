# test r4ss installation

#install.packages("remotes")
#library(remotes)
#remotes::install_github("r4ss/r4ss")

library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 176, retrospective with M167 (post-STAR base)')

# The function retro() can be used to run retrospective analyses starting from an existing Stock Synthesis model.
#Note that it is safest to create a copy of your original Stock Synthesis model that the retrospective is run on,
# just in case there are problems with the run. For example, a five year retrospective could be done:

# run the retrospective analyses
retro(
  dir = getwd(), # wherever the model files are
  #oldsubdir = "", # subfolder within dir
  newsubdir = "retrospectives", # new place to store retro runs within dir
  years = 0:-5, # years relative to ending year of model
  exe = "ss3_opt_win",
  extras = "-nohess -nox"
)

#After running this retrospective, six new folders would be created within a new "retrospectives" directory,
# where each folder would contain a different run of the retrospective (removing 0 to 5 years of data).

# After the retrospective models have run, the results can be used as a diagnostic:

# load the 6 models
retroModels <- SSgetoutput(dirvec = file.path(
  getwd(), "retrospectives",
  paste0("retro", 0:-5)
))
# summarize the model results
retroSummary <- SSsummarize(retroModels)
# create a vector of the ending year of the retrospectives
endyrvec <- retroSummary[["endyrs"]] + 0:-5
endyrvec
# make plots comparing the 6 models
# showing 2 out of the 19 plots done by SSplotComparisons
SSplotComparisons(retroSummary,
  endyrvec = endyrvec,
  legendlabels = paste("Data", 0:-5, "years"),
  subplot = 1:20, # only show one plot in vignette
  print = TRUE, # send plots to PNG file
  plot = FALSE, # don't plot to default graphics device
  plotdir = file.path(getwd(), "retrospectives")
)
#knitr::include_graphics(file.path(new_mod_path, "compare2_spawnbio_uncertainty.png"))
#fls <- list.files(new_mod_path, pattern = "*.png", full.name = TRUE)
#to <- here::here("vignettes")
#file.copy(fls, to = to)

# calculate Mohn's rho, a diagnostic value
rho_output <- SSmohnsrho(
  summaryoutput = retroSummary,
  endyrvec = endyrvec,
  startyr = retroSummary[["endyrs"]] - 5,
  verbose = FALSE
)

write.csv(cbind.data.frame(value=unlist(rho_output)), "~MOHN'S RHO.csv", quote=F)
