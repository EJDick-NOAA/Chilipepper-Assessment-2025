#C Chilipepper Rockfish 2025 Assessment
#C Stock_Synthesis_v3.30.23.1

0 # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#
4 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#
# GPattern month_of_settlement  area  age
# (for each settlement assignment)
1 6 1 0 # chilipepper YOY typically settle around June
#
4 #_Nblock_Patterns
1 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
# Time Block Pattern #1
1875 1990 # bocaccio rockfish comm. sort requirement in 1991 (effectively changed chilipepper mcat from mixed to single species)
# Time Block Pattern #2
1875 2000 # CCA in So. CA
# Time Block Pattern #3
1875 1999 # overfishing decl. for bocaccio, shelf closure
# Time Block Pattern #4
1875 2001 # No. CA rec depth restrictions
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# autogen; useful when setting up time-varying parameters (see user manual)
# where: 0 = autogen all time-varying parms;
#        1 = READ EACH TIME-VARYING PARM LINE; ### set 5th element =1 for time-varying selex
#        2 = read then autogen if parm min==-12345
0 0 0 0 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
0    #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
1    # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0    #_Age(post-settlement)_for_L1; linear growth below this
20   #_Growth_Age_for_L2 (999 to use as Linf)
0.16 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0    #_placeholder for future growth feature
0    #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1    #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma 
###########
# FEMALES #
###########
#_LO   HI   INIT        PRIOR    PR_SD  PR_type  PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# M prior median = ln(5.4/35) = ln(0.1542857) = -1.86895
0.01   0.5  0.1543     -1.86895     0.31  3       2    0            0        0         0         0      0     0         # NatM_p_1_Fem_GP_1
# length-at-age; fixing female length at age 0 to roughly mean size of YOY in July; fixing CV(a=0) at 0.1; see regression of CV(L) vs. age
   5   15   7.3         7           50    0      -2    0            0        0         0         0      0     0         # L_at_Amin_Fem_GP_1
  44   52   48          48          50    0       2    0            0        0         0         0      0     0         # L_at_Amax_Fem_GP_1
0.15   0.25 0.18        0.20        50    0       2    0            0        0         0         0      0     0         # VonBert_K_Fem_GP_1
0.01   0.2  0.1         0           50    0       2    0            0        0         0         0      0     0         # CV_young_Fem_GP_1
0.01   0.15 0.1         0           50    0       2    0            0        0         0         0      0     0         # CV_old_Fem_GP_1
# weight-length from WCGBTS survey data
   0   1    8.41443e-06 8.41443e-06 50    0      -99   0            0        0         0         0      0     0         # Wtlen_1_Fem
   2   4    3.134949    3.134949    50    0      -99   0            0        0         0         0      0     0         # Wtlen_2_Fem
# maturity ogive
  20  30    24.4        24.4        50    0      -99   0            0        0         0         0      0     0         # Mat50%_Fem
  -1   0   -0.27       -0.27        50    0      -99   0            0        0         0         0      0     0         # Mat_slope_Fem
# fecundity F=aL^b; 'a' is scaled so spawning output reported by SS3 has units of billions of eggs
# these estimates were adjusted to account for size-dependent multiple broods
   0   0.01 5.6822E-08  1.00579E-07 50    0      -99   0            0        0         0         0      0     0         # Eggs/kg_inter_Fem
   2   5    4.177       3.790       50    0      -99   0            0        0         0         0      0     0         # Eggs/kg_slope_wt_Fem
#
#########
# MALES # M and length-at-age parameters are exponential offsets
######### offsets = ln(Male/Female); Male = Female*exp(offset)
#
-0.5   1    0.2         0           50    0       2    0            0        0         0         0      0     0         # NatM_p_1_Mal_GP_1
# length-at-age; L(a=0) and CV(L(a=0)) fixed equal to female for YOYs                               
-0.6   0    0           0           50    0      -2    0            0        0         0         0      0     0         # L_at_Amin_Mal_GP_1
-0.8   0   -0.2         0           50    0       2    0            0        0         0         0      0     0         # L_at_Amax_Mal_GP_1
 0.2   1    0.3         0           50    0       2    0            0        0         0         0      0     0         # VonBert_K_Mal_GP_1
  -1   1    0           0           50    0       2    0            0        0         0         0      0     0         # CV_young_Mal_GP_1
  -1   2    0           0           50    0       2    0            0        0         0         0      0     0         # CV_old_Mal_GP_1
# weight-length from WCGBTS survey data
   0   1    6.93782e-06 6.93782e-06 50    0      -99   0            0        0         0         0      0     0         # Wtlen_1_Mal
   2   4    3.202012    3.202012    50    0      -99   0            0        0         0         0      0     0         # Wtlen_2_Mal
# recruitment distribution (comment out with recr_dist_method = 4)
  #0   0    0           0           0     0      -99   0            0        0         0         0      0     0         # RecrDist_GP_1
  #0   0    0           0           0     0      -99   0            0        0         0         0      0     0         # RecrDist_Area_1
  #0   0    0           0           0     0      -99   0            0        0         0         0      0     0         # RecrDist_timing_1
#
   1   1    1           1           1     0      -99   0            0        0         0         0      0     0         # CohortGrowDev
# assume 50/50 sex ratio for recruits
 0.1   0.9  0.5         0.5         0.5   0      -99   0            0        0         0         0      0     0         # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#
#_LO   HI     INIT   PRIOR   PR_SD  PR_type  PHASE  env-var  use_dev  dev_mnyr  dev_mxyr  dev_PH  Block  Blk_Fxn # parm_name
8      13     11     10      5      0        1      0        0        0         0         0       0      0       # SR_LN(R0)
0.201  0.999  0.72   0.72    0.16   2       -5      0        0        0         0         0       0      0       # SR_BH_steep
0      2      1.0    1.0     1      0       -99     0        0        0         0         0       0      0       # SR_sigmaR
-5     5      0      0       1      0       -99     0        0        0         0         0       0      0       # SR_regime
0      0      0      0       0      0       -99     0        0        0         0         0       0      0       # SR_autocorr
#
# Recruitment deviations
# "Advice: I would run models with both option 1 and 2. If the results are very similar, choose option 2
#  because it’s simpler, you can run MCMC, and the choice of early/main/late periods has zero impact on results
#  so one fewer thing to worry about. If the results between options 1 and 2 are noticeably different, compare
#  likelihoods to see what data are better fit with main recdevs that don’t add up to zero and make sure that
#  there’s not some other model process that is worth using to better fit those data."
2 #do_recdev:  0=none; 1=devvector; 2=simple deviations
     1965 # first year of main recr_devs; early devs can preceed this era
     2024 # last year of main recr_devs; forecast devs start in following year
        4 #_recdev phase 
        1 # (0/1) to read 13 advanced options
      -30 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
        4 #_recdev_early_phase
        0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
        1 #_lambda for Fcast_recr_like occurring before endyr+1
   1961.0 #_last_early_yr_nobias_adj_in_MPD 
   1979.2 #_first_yr_fullbias_adj_in_MPD 
   2024.8 #_last_yr_fullbias_adj_in_MPD 
   2025.0 #_first_recent_yr_nobias_adj_in_MPD 
   0.8231 #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
        0 #_period of cycles in recruitment (N parms read below)
       -6 #min rec_dev
        6 #max rec_dev
        0 #_read_recdevs
#_end of advanced SR options
#
#Fishing Mortality info 
0.2 # F ballpark
-1 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid; 4=mix of 2&3 (F's not high enough to be an issue here, using 3)
4.0 # max F or harvest rate, depends on F_Method
#-9999 1 1 # only required for F_Method 4
4 # if Fmethod=3; read N iterations for tuning
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_fleet  link  link_info  extra_se  biasadj float # fleetname
      3     1          0         0        0     1 # TWL_logbook
      6     1          0         0        0     1 # DWV_onboard_CPFV_observer
      9     1          0         0        0     1 # WCGBT_Survey
     10     1          0         0        0     1 # Triennial_Survey
     11     1          0         1        0     1 # CalCOFI_Survey
     12     1          0         1        0     1 # RREAS
  -9999     0          0         0        0     0 # terminate
#
#_Q_parms(if_any); units_are_ln(q)
#_LO   HI   INIT   PRIOR   PR_SD   PR_type   PHASE   env-var   use_dev   dev_mnyr   dev_mxyr   dev_PH   Block   Blk_Fxn # parm_name
 -10   0    -4     0       1       0         -1      0         0         0          0          0        0       0       # ln_q_Comm_TWL_Logbook
#   0   2     0.5   0.1     1       0          1      0         0         0          0          0        0       0       # add_var_Comm_TWL_Logbook
 -10   0    -4     0       1       0         -1      0         0         0          0          0        0       0       # ln_q_DWV_onboard_CPFV_observer
#   0   1     0.1   0.1     1       0          1      0         0         0          0          0        0       0       # add_var_DWV_onboard_CPFV_observer
 -10   3     1     0       1       0         -1      0         0         0          0          0        0       0       # ln_q_WCGBT_TWL_Survey
 -10   3     0     0       1       0         -1      0         0         0          0          0        0       0       # ln_q_Triennial_TWL_Survey
 -10   0    -5     0       1       0         -1      0         0         0          0          0        0       0       # ln_q_CalCOFI_Survey
   0   1     0.4   0.1     1       0          1      0         0         0          0          0        0       0       # add_var_CalCOFI_Survey
 -10   0    -5     0       1       0         -1      0         0         0          0          0        0       0       # ln_q_RREAS
   0   3     1     0.1     1       0          1      0         0         0          0          0        0       0       # add_var_RREAS
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0  0 # NoCA_HKL              #  1 # catch fleets
 24 0 0  0 # SoCA_HKL              #  2
 24 0 0  0 # CA_TWL                #  3
 15 0 0  3 # OR_WA_Comm            #  4
 24 0 0  0 # CA_NET                #  5
 24 0 0  0 # NoCA_OR_WA_Rec        #  6
 24 0 0  0 # SoCA_Rec              #  7
 24 0 0  0 # TWL_discard           #  8
 24 0 0  0 # WCGBT_Survey          #  9 # survey fleets
  0 0 0  0 # Triennial_TWL_Survey  #  10
  0 0 0  0 # CalCOFI_Survey        #  11
  0 0 0  0 # RREAS_YOY_Survey      #  12
#
#_age_selex_types
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 0 0 0  0 # NoCA_HKL              #  1 # catch fleets
 0 0 0  0 # SoCA_HKL              #  2
 0 0 0  0 # CA_TWL                #  3
 0 0 0  0 # OR_WA_Comm            #  4
 0 0 0  0 # CA_NET                #  5
 0 0 0  0 # NoCA_OR_WA_Rec        #  6
 0 0 0  0 # SoCA_Rec              #  7
 0 0 0  0 # TWL_discard           #  8
 0 0 0  0 # WCGBT_Survey          #  9 # survey fleets
10 0 0  0 # Triennial_TWL_Survey  #  10
 0 0 0  0 # CalCOFI_Survey        #  11
 0 0 0  0 # RREAS_YOY_Survey      #  12
# 0 0 0  0 # NWFSC_HKL_Survey      # 13
#
#_Parameters_for_all_selectivity_functions
# for time-varying parms, element 13 indexes the time block pattern (see start of file), element 14 should be 2 ('replace parameter')
#LO     HI      INIT    PRIOR   PR_SD   PR_type PHASE   env-var use_dev dev_mnyr dev_mxyr dev_PH Block  Blk_Fxn #  parm_name
# NoCA_HKL; p5=p6="-999" determines begin/end selex by decay of ascending/descending scale (p5 & p6 ignored)
# 15      45      30      30      99      0      3       0       0       0        0        0      0      0        #  Inflection
#  1      10      2       2       99      0      3       0       0       0        0        0      0      0        #  95% width
## 10      59.5    30      30      99      0       3       0       0       0        0        0      1      2        #  DN Peak
##-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
## 0.5     10      3       3       99      0       3       0       0       0        0        0      1      2        #  DN Ascending Scale
## 0.01    8       5       5       99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
##-11     -9      -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
##-12      12      10      10      99      0      -3       0       0       0        0        0      0      0        #  DN Final
 8.5     59.5    30      30      99      0       3       0       0       0        0        0      1      2        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.5     15      3       3       99      0       3       0       0       0        0        0      1      2        #  DN Ascending Scale
 0.5     15      10      10      99      0       3       0       0       0        0        0      1      2        #  DN Descending Scale
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
# SoCA_HKL; landings since bocaccio overfishing declaration have been minor; not fitting to years with minimal landings
# 10      59.5      30      30      99      0      3       0       0       0        0        0      0      0        #  Inflection
#  1      30      5       5       99      0        3       0       0       0        0        0      0      0        #  95% width
 8.5     59.5    30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.5     15      3       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
 0.5     20      10      10      99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
# CA_TWL; wants to be asymptotic
# 25      50      30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
#-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
# 2       6       3       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
# 1       8       7       7       99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
#-11     -9      -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
#-12      12      10      10      99      0      -3       0       0       0        0        0      0      0        #  DN Final
 10      59      30      30      99      0       3       0       0       0        0        0      3      2        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.01    12      3       3       99      0       3       0       0       0        0        0      3      2        #  DN Ascending Scale
 0.01    20      15      15      99      0      -3       0       0       0        0        0      3      2        #  DN Descending Scale
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
# OR_WA_Comm; wants to be asymptotic
# 10      59      30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
#-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
# 0.5     10      3       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
# 1       8       7       7       99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
#-11     -9      -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
#-12      12      10      10      99      0      -3       0       0       0        0        0      0      0        #  DN Final
# 10      59      30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
#-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
# 0.01    12      3       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
# 0.01    20      15      15      99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
#-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
#-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
# CA_NET; descending scale is poorly informed; fixing at asymptotic does not change results
# 10      59      40      40      99      0       3       0       0       0        0        0      0      0        #  DN Peak
#-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
# 2       7       2       2       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
# 0.01    8       7       7       99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
#-11     -9      -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
#-12      12      10      10      99      0      -3       0       0       0        0        0      0      0        #  DN Final
 10      59      30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.01    12      3       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
 0.01    20      15      15      99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
# NoCA_OR_WA_Rec
# 20      59      30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
#-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
# 3       8       4       4       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
# 0.01    8       7       5       99      0      -3       0       0       0        0        0      0      0        #  DN Descending Scale
#-11     -10     -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
#-12      12      10      10      99      0      -3       0       0       0        0        0      0      0        #  DN Final
 10      59      30      30      99      0       3       0       0       0        0        0      4      2        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.01    12      3       3       99      0       3       0       0       0        0        0      4      2        #  DN Ascending Scale
 0.01    12      10      10      99      0      -3       0       0       0        0        0      4      2        #  DN Descending Scale
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
# SoCA_Rec; fit improved by estimating ending logit
 8.5     50      30      30      99      0       3       0       0       0        0        0      2      2        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.5     10      3       3       99      0       3       0       0       0        0        0      2      2        #  DN Ascending Scale
 0.01    8       7       5       99      0       3       0       0       0        0        0      2      2        #  DN Descending Scale
-11     -10    -10      -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
-12      12    -10      -10      99      0       3       0       0       0        0        0      2      2        #  DN Final
# TWL_discard
 10      50      30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.5     8       3       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
 0.01    8       5       5       99      0       3       0       0       0        0        0      0      0        #  DN Descending Scale
-11     -10     -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
-11     -10     -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Final
# WCGBT_Survey; p5=p6="-999" determines begin/end selex by decay of ascending/descending scale (p5 & p6 ignored)
 10      59      30      30      99      0       3       0       0       0        0        0      0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
 0.01    12      5       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
 0.01    12      5       5       99      0       3       0       0       0        0        0      0      0        #  DN Descending Scale
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
# Triennial_Survey; p5=p6="-999" determines begin/end selex by decay of ascending/descending scale (p5 & p6 ignored)
# 10      59      20      20      99      0       3       0       0       0        0        0      0      0        #  DN Peak
#-10      10     -6      -6       99      0      -3       0       0       0        0        0      0      0        #  DN Top
# 0.01    12      5       3       99      0       3       0       0       0        0        0      0      0        #  DN Ascending Scale
# 0.01    12      5       5       99      0       3       0       0       0        0        0      0      0        #  DN Descending Scale
#-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Init
#-1000   -998    -999    -999     99      0      -3       0       0       0        0        0      0      0        #  DN Final
#
# 'SHORT' PARAMETER LINES FOR TIME-BLOCKED PARAMETERS
# IF USING PATTERNS WITH >1 BLOCK, GROUP LINES BY PARAMETER (NOT BY BLOCK)
#LO     HI      INIT    PRIOR   PR_SD   PR_type PHASE	#Parm name
 8.5     59.5   30     30      99      0       3	    # NoCA_HKL PEAK, block pattern 3 (1875-1999); shelf closure
# 8.5     59.5   30     30      99      0       3	    # NoCA_HKL PEAK, block pattern 1 (1991-1999); boc sort to shelf closure
 0.5    15      3      3       99      0       3	    # NoCA_HKL ASCENDING SCALE, block pattern 3 (1875-1999); shelf closure
# 0.5    15      3      3       99      0       3	    # NoCA_HKL ASCENDING SCALE, block pattern 1 (1991-1999); boc sort to shelf closure
 0.5    15      10     5       99      0      -3	    # NoCA_HKL DESCENDING SCALE, block pattern 3 (1875-1999); shelf closure
# 0.5    15      5      5       99      0       3	    # NoCA_HKL DESCENDING SCALE, block pattern 1 (1991-1999); boc sort to shelf closure
#8.5     59.5   30     30      99      0       3	    # SoCA_HKL PEAK, block pattern 2 (1875-2000); CCA
#0.5    15      3      3       99      0       3	    # SoCA_HKL ASCENDING SCALE, block pattern 2 (1875-2000); CCA
#0.5    15      10     10      99      0      -3	    # SoCA_HKL DESCENDING SCALE, block pattern 2 (1875-2000); CCA
 10     59      30     30      99      0       3	    # TWL PEAK, block pattern 3 (1875-1999); shelf closure
 0.01   12      3      3       99      0       3	    # TWL ASCENDING SCALE, block pattern 3 (1875-1999); shelf closure
 0.01   20      15     15      99      0      -3	    # TWL DESCENDING SCALE, block pattern 3 (1875-1999); shelf closure
 10     59      30     30      99      0       3	    # NoCA_Rec PEAK, block pattern 4 (1875-2001); depth restrictions
 0.01   12      3      3       99      0       3	    # NoCA_Rec ASCENDING SCALE, block pattern 4 (1875-2001); depth restrictions
 0.01   12      5      5       99      0       3	    # NoCA_Rec DESCENDING SCALE, block pattern 4 (1875-2001); depth restrictions
 8.5    50      30     30      99      0       3	    # SoCA_Rec PEAK, block pattern 2 (1875-2000); CCA
 0.5    10      3      3       99      0       3	    # SoCA_Rec ASCENDING SCALE, block pattern 2 (1875-2000); CCA
 0.01   8       7      5       99      0      -3	    # SoCA_Rec DESCENDING SCALE, block pattern 2 (1875-2000); CCA
-12     12      10     10      99      0      -3	    # SoCA_Rec ENDING LOGIT, block pattern 2 (1875-2000); CCA
#
0   #  use 2D_AR1 selectivity(0/1)
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#
# Input variance adjustments factors: 
#_1=add_to_survey_CV
#_2=add_to_discard_stddev
#_3=add_to_bodywt_CV
#_4=mult_by_lencomp_N
#_5=mult_by_agecomp_N
#_6=mult_by_size-at-age_N
#_7=mult_by_generalized_sizecomp
#factor fleet New_Var_adj hash Old_Var_adj New_Francis   New_MI Francis_mult Francis_lo Francis_hi  MI_mult Type             Name                              Note
      4     1    0.554749    #    0.566766    0.554749 1.148903     0.978798   0.653839   1.859275 2.027121  len         NoCA_HKL                                  
      4     2    2.405668    #    2.412300    2.405668 4.735858     0.997251   0.743257   2.947643 1.963213  len         SoCA_HKL                                  
      4     3    0.224964    #    0.226314    0.224964 0.588387     0.994034   0.691495   1.612225 2.599870  len           CA_TWL                                  
      4     4    0.134023    #    0.133055    0.134023 0.404635     1.007277   0.569301   3.288556 3.041107  len       OR_WA_Comm                                  
      4     5    0.430434    #    0.430804    0.430434 1.636950     0.999141   0.601188   2.511688 3.799755  len           CA_NET                                  
      4     6    0.741721    #    0.742719    0.741721 1.634347     0.998656   0.732994   1.663755 2.200492  len   NoCA_OR_WA_Rec                                  
      4     7    0.157156    #    0.157321    0.157156 0.612832     0.998951   0.663583   1.837040 3.895422  len         SoCA_Rec                                  
      4     8    0.019174    #    0.019176    0.019174 0.066241     0.999916   0.642520   3.390245 3.454366  len      TWL_discard                                  
      4     9    0.038248    #    0.038505    0.038248 0.140002     0.993337   0.642349   2.083703 3.635932  len     WCGBT_Survey                                  
      4    10    0.056677    #    0.055529    0.056677 0.171380     1.020682   0.718845   4.116927 3.086322  len Triennial_Survey                                  
      5     1    0.035890    #    0.035851    0.035890 0.147699     1.001100   0.485387   6.741928 4.119799  age         NoCA_HKL                                  
      5     3    0.019627    #    0.019574    0.019627 0.022888     1.002696   0.573293   2.362176 1.169320  age           CA_TWL                                  
      5     4    8.218963    #    1.000000    8.218963 0.415264     8.218963   6.129286  50.451129 0.415264  age       OR_WA_Comm                                  
      5     5    0.072436    #    0.072392    0.072436 0.162318     1.000610   0.587047   3.242044 2.242206  age           CA_NET                                  
      5     6    2.113407    #    1.000000    2.113407 0.563581     2.113407   2.113407        Inf 0.563581  age   NoCA_OR_WA_Rec                                  
      5     9    0.088032    #    0.087957    0.088032 0.006418     1.000848   0.612836   3.106024 0.072966  age     WCGBT_Survey                                  
      5    10    0.116370    #    0.116274          NA 0.116370           NA         NA         NA 1.000822  age Triennial_Survey No Francis weight--using MI value
-9999  0  0   #  terminator
#
7 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter

# read changes to default Lambdas (default value is 1.0)
# columns = like_code, fleet, beginning_phase, value, code_for_sizefreq
#  like_code options are:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
#     10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime.
#  2nd value (fleet) only used for like_codes 1 - 9, which are fleet-specific, except
#     2nd value is used for Tag-Group, instead of fleet, for like_codes 15 & 16.
#  5th value is used only for like_code=6 and specifies the SizeFreq method used, which is in addition to fleet designation.
#like  #fleet #phase #value #code_for_sizefreq
#_indices
1      3      1      0      1 # Commercial Trawl Logbook Index Lambda=0 (NOT FIT; displayed for comparison only)
1      6      1      0      1 # DWV indexLambda=0 (NOT FIT; displayed for comparison only)
1      9      1      1      1 # WCGBTS Index
1     10      1      1      1 # Triennial Index
1     11      1      1      1 # CalCOFI
1     12      1      1      1 # RREAS
#_lengths
4      1      1      1      1
4      2      1      1      1
4      3      1      1      1
4      4      1      1      1
4      5      1      1      1
4      6      1      1      1
4      7      1      1      1
4      8      1      1      1
4      9      1      1      1
4     10      1      1      1
#_ages
5      1      1      1      1
#5      2      1      1      1
5      3      1      1      1
5      4      1      1      1
5      5      1      1      1
5      6      1      1      1
5      9      1      1      1
5     10      1      1      1
-9999  1      1      1      1 # terminator
#
0 # (0/1) read specs for more stddev reporting 
999
