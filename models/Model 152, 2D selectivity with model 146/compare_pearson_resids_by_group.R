library(r4ss)
setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 152, 2D selectivity with model 146')

# NO HESSIAN
myreplist_2D <- SS_output(dir=getwd(), covar=FALSE)
len_resid_2D <- subset(myreplist_2D$lendbase, Fleet==3)

setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 146, revised pre-STAR base, hess_step')
myreplist_base <- SS_output(dir=getwd(), covar=FALSE)
len_resid_base <- subset(myreplist_base$lendbase, Fleet==3)

setwd('E:/ejdick/projects/~Chilipepper 2025/model/Model 152, 2D selectivity with model 146')

# add resids from 2D fit to base dataframe for easy plotting
len_resid_base$Pearson_2D <- len_resid_2D$Pearson

names(len_resid_base)

library(tidyverse)

len_resid_base$log10AbsResBase <- log10(abs(len_resid_base$Pearson))
len_resid_base$log10AbsRes2D   <- log10(abs(len_resid_base$Pearson_2D))

ggplot(len_resid_base, aes(x=log10AbsResBase, y=log10AbsRes2D, col=factor(sex))) + geom_point() + geom_abline()
ggsave('Pearson_resid_by_sex_CA_TWL_lengths.png')
ggplot(len_resid_base, aes(x=log10AbsResBase, y=log10AbsRes2D, col=Bin)) + geom_point() + geom_abline()
ggsave('Pearson_resid_by_Lbin_CA_TWL_lengths.png')
