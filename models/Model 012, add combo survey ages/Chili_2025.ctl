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
1 5.5 1 0 # black rockfish YOY typically settle May-June
#
2 #_Nblock_Patterns
1 2#_blocks_per_pattern 
# begin and end years of blocks
# Time Block Pattern #1
1875 2016 # spatial expansion of CCFRP survey
# Time Block Pattern #2
1875 2007 2008 2016 # major depth restrictions for recreational fleets
#
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
0.20 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0    #_placeholder for future growth feature
0    #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1    #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#

#
#_growth_parms
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma 
###########
# FEMALES #
###########
#_LO   HI   INIT        PRIOR    PR_SD  PR_type  PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# M prior median = ln(5.4/35) = ln(0.1542857) = -1.86895
0.01   0.5  0.16        -1.86895    0.31  3       2    0            0        0         0         0      0     0         # NatM_p_1_Fem_GP_1
# length-at-age; fixing female length at age 0 to roughly mean size of YOY in July; fixing CV(a=0) at 0.1; see regression of CV(L) vs. age
   3   30   8           7           50    0       2    0            0        0         0         0      0     0         # L_at_Amin_Fem_GP_1
  40   55   48.4258     48          50    0       2    0            0        0         0         0      0     0         # L_at_Amax_Fem_GP_1
0.10   0.3  0.1924      0.20        50    0       2    0            0        0         0         0      0     0         # VonBert_K_Fem_GP_1
0.01   0.3  0.12        0           50    0       3    0            0        0         0         0      0     0         # CV_young_Fem_GP_1
0.01   0.2  0.15        0           50    0       3    0            0        0         0         0      0     0         # CV_old_Fem_GP_1
# weight-length from WCGBTS survey data
   0   1    8.41443e-06 8.41443e-06 50    0      -9    0            0        0         0         0      0     0         # Wtlen_1_Fem
   2   4    3.134949    3.134949    50    0      -9    0            0        0         0         0      0     0         # Wtlen_2_Fem
# maturity ogive
  30  50    40.36       40.36       50    0      -9    0            0        0         0         0      0     0         # Mat50%_Fem
  -1   0    -0.38061    -0.38061    50    0      -9    0            0        0         0         0      0     0         # Mat_slope_Fem
# fecundity F=aL^b; 'a' is scaled so spawning output has units of billions of eggs
   0   1    1.4067E-08  1.4067E-08  50    0      -9    0            0        0         0         0      0     0         # Eggs/kg_inter_Fem
   2   5    4.6851      4.6851      50    0      -9    0            0        0         0         0      0     0         # Eggs/kg_slope_wt_Fem
#
#########
# MALES # M and length-at-age parameters are exponential offsets
######### offsets = ln(Male/Female); Male = Female*exp(offset)
#
  -2   2    0           0           50    0       3    0            0        0         0         0      0     0         # NatM_p_1_Mal_GP_1
# length-at-age; L(a=0) and CV(L(a=0)) fixed equal to female for YOYs                               
  -1   1    0           0           50    0       2    0            0        0         0         0      0     0         # L_at_Amin_Mal_GP_1
  -1   1   -0.3032      0           50    0       2    0            0        0         0         0      0     0         # L_at_Amax_Mal_GP_1
  -0.5 1.5  0.4022      0           50    0       2    0            0        0         0         0      0     0         # VonBert_K_Mal_GP_1
  -1   1    0           0           50    0      -3    0            0        0         0         0      0     0         # CV_young_Mal_GP_1
  -1   1    0           0           50    0      -3    0            0        0         0         0      0     0         # CV_old_Mal_GP_1
# weight-length from WCGBTS survey data
   0   1    6.93782e-06 6.93782e-06 50    0      -9    0            0        0         0         0      0     0         # Wtlen_1_Mal
   2   4    3.202012    3.202012    50    0      -9    0            0        0         0         0      0     0         # Wtlen_2_Mal
# recruitment distribution (comment out with recr_dist_method = 4)
  #0   0    0           0           0     0      -9    0            0        0         0         0      0     0         # RecrDist_GP_1
  #0   0    0           0           0     0      -9    0            0        0         0         0      0     0         # RecrDist_Area_1
  #0   0    0           0           0     0      -9    0            0        0         0         0      0     0         # RecrDist_timing_1
#
   1   1    1           1           1     0      -9    0            0        0         0         0      0     0         # CohortGrowDev
# assume 50/50 sex ratio for recruits
 0.1   0.9  0.5         0.5         0.5   0      -9    0            0        0         0         0      0     0         # FracFemale_GP_1
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
6      13     10     10      5      0        1      0        0        0         0         0       0      0       # SR_LN(R0)
0.201  0.999  0.72   0.72    0.16   2       -4      0        0        0         0         0       0      0       # SR_BH_steep
0      1      0.6    0.6     1      0       -9      0        0        0         0         0       0      0       # SR_sigmaR
-5     5      0      0       1      0       -9      0        0        0         0         0       0      0       # SR_regime
0      0      0      0       0      0       -9      0        0        0         0         0       0      0       # SR_autocorr
#
# Recruitment deviations
0 #do_recdev:  0=none; 1=devvector; 2=simple deviations
     1955 # first year of main recr_devs; early devs can preceed this era
     2022 # last year of main recr_devs; forecast devs start in following year
        4 #_recdev phase 
        1 # (0/1) to read 13 advanced options
      -20 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
        4 #_recdev_early_phase
        0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
        1 #_lambda for Fcast_recr_like occurring before endyr+1
     1960 #_last_early_yr_nobias_adj_in_MPD                   
     1970 #_first_yr_fullbias_adj_in_MPD                      
     2022 #_last_yr_fullbias_adj_in_MPD                       
     2024 #_first_recent_yr_nobias_adj_in_MPD                 
        1 #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
        0 #_period of cycles in recruitment (N parms read below)
       -6 #min rec_dev
        6 #max rec_dev
        0 #_read_recdevs
#_end of advanced SR options
#
#Fishing Mortality info 
0.2 # F ballpark
-1 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4.0 # max F or harvest rate, depends on F_Method
6 # if Fmethod=3; read N iterations for tuning
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_fleet  link  link_info  extra_se  biasadj float # fleetname
      8     1          0         0        0     0 # WCGBT_TWL_Survey
      9     1          0         0        0     0 # Triennial_TWL_Survey
  -9999     0          0         0        0     0 # terminate
#
#_Q_parms(if_any); units_are_ln(q)
#_LO   HI   INIT   PRIOR   PR_SD   PR_type   PHASE   env-var   use_dev   dev_mnyr   dev_mxyr   dev_PH   Block   Blk_Fxn # parm_name
 -10   3    -1     0       1       0         2       0         0         0          0          0        0       0       # ln_q_WCGBT_TWL_Survey
 -10   3    -1     0       1       0         2       0         0         0          0          0        0       0       # ln_q_Triennial_TWL_Survey
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
 15 0 0  1 # SoCA_HKL              #  2
 24 0 0  0 # CA_TWL                #  3
 15 0 0  3 # OR_WA_Comm            #  4
 24 0 0  0 # CA_NET                #  5
 15 0 0  1 # NoCA_OR_WA_Rec        #  6
 15 0 0  1 # SoCA_Rec              #  7
 24 0 0  1 # WCGBT_Survey          #  8 # survey fleets
 15 0 0  8 # Triennial_TWL_Survey  #  9
#  0 0 0  0 # RREAS_YOY_Survey      # 10
#  0 0 0  0 # NWFSC_HKL_Survey      # 11
#  0 0 0  0 # CalCOFI_Survey        # 12
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
 0 0 0  0 # WCGBT_Survey          #  8 # survey fleets
 0 0 0  0 # Triennial_TWL_Survey  #  9
# 0 0 0  0 # RREAS_YOY_Survey      # 10
# 0 0 0  0 # NWFSC_HKL_Survey      # 11
# 0 0 0  0 # CalCOFI_Survey        # 12
#
#_Parameters_for_all_selectivity_functions
#LO     HI      INIT    PRIOR   PR_SD   PR_type PHASE   env-var use_dev dev_mnyr dev_mxyr dev_PH Block  Blk_Fxn #  parm_name
# NoCA_HKL
# 15      45      30      30      99      0      3       0       0       0        0        0      0      0        #  Inflection
#  1      10      2       2       99      0      3       0       0       0        0        0      0      0        #  95% width
 20      59      30      30      99      0       3       0       0       0        0        0.5    0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0.5    0      0        #  DN Top
 0.5     6       3       3       99      0       3       0       0       0        0        0.5    0      0        #  DN Ascending Scale
 0.01    8       7       5       99      0       3       0       0       0        0        0.5    0      0        #  DN Descending Scale
-11     -9      -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
-12      12      10      10      99      0       3       0       0       0        0        0      0      0        #  DN Final
# CA_TWL
 20      59      30      30      99      0       3       0       0       0        0        0.5    0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0.5    0      0        #  DN Top
 0.5     6       3       3       99      0       3       0       0       0        0        0.5    0      0        #  DN Ascending Scale
 1       8       7       10      99      0      -3       0       0       0        0        0.5    0      0        #  DN Descending Scale
-11     -9      -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
-12      12      10      10      99      0      -3       0       0       0        0        0      0      0        #  DN Final
# CA_NET
 20      59      30      30      99      0       3       0       0       0        0        0.5    0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0.5    0      0        #  DN Top
 0.5     6       3       3       99      0       3       0       0       0        0        0.5    0      0        #  DN Ascending Scale
 0.01    8       5       5       99      0       3       0       0       0        0        0.5    0      0        #  DN Descending Scale
-11     -9      -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
-12      12      10      10      99      0       3       0       0       0        0        0      0      0        #  DN Final
# WCGBT_Survey
 20      59      30      30      99      0       3       0       0       0        0        0.5    0      0        #  DN Peak
-10      10     -6      -6       99      0      -3       0       0       0        0        0.5    0      0        #  DN Top
 0.5     10      3       3       99      0       3       0       0       0        0        0.5    0      0        #  DN Ascending Scale
 0.01    8       5       5       99      0       3       0       0       0        0        0.5    0      0        #  DN Descending Scale
-11     -10     -10     -10      99      0      -3       0       0       0        0        0      0      0        #  DN Init
-12      12      10      10      99      0       3       0       0       0        0        0      0      0        #  DN Final
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
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
#factor fleet New_Var_adj hash Old_Var_adj New_Francis   New_MI Francis_mult Francis_lo Francis_hi  MI_mult Type         Name Note
      4     1    0.498002    #    0.447537    0.498002 1.130154     1.112761   0.725782   2.134047 2.525275  len     NoCA_HKL     
      4     2    0.407349    #    0.430284    0.407349 2.666274     0.946697   0.640511   1.912872 6.196545  len     SoCA_HKL     
      4     3    0.167188    #    0.155212    0.167188 0.463728     1.077162   0.784794   1.646304 2.987707  len       CA_TWL     
      4     5    0.387635    #    0.363321    0.387635 1.527288     1.066921   0.592095   2.608785 4.203687  len       CA_NET     
      4     8    0.024760    #    0.025250    0.024760 0.115750     0.980590   0.709708   1.901563 4.584159  len WCGBT_Survey     
      5     8    0.049270    #    0.051788    0.049270 0.050399     0.951372   0.644568   2.052199 0.973173  age WCGBT_Survey
-9999  0  0   #  terminator
#
9 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter

# read changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
##indices
#  1  4 1 0 1   #_CPUE/survey:_MRFSS ### lambda=0
#  1  5 1 1 1   #_CPUE/survey:_PR_Central
#  1  7 1 1 1   #_CPUE/survey:_CCFRP
#  1  8 1 1 1   #_CPUE/survey:_DWV
#  1  9 1 1 1   #_CPUE/survey:_PCO_Central
#  1 10 1 0 1   #_CPUE/survey:_PISCO_SCUBA ### lambda=0
#  1 11 1 0 1   #_CPUE/survey:_RREAS_SWFSC ### lambda=0
#  1 12 1 0 1   #_CPUE/survey:_SWFSC_YOY_SCUBA ### lambda=0
##lengths
#  4  1 1 1 1   #_len_nonTrawl
#  4  3 1 1 1   #_len_Comm_discards
#  4  4 1 1 1   #_len_PC_retained_central
#  4  5 1 1 1   #_len_PR_retained_central
#  4  6 1 1 1   #_len_Rec_discard_central
#  4  7 1 1 1   #_len_CCFRP
#  4  8 1 1 1   #_len_DWV
#  4 10 1 0 1   #_len_PISCO_SCUBA ### lambda=0
#  4 13 1 1 1   #_len_CDFG_Lea_Research
##ages
#  5  1 1 1 1   #_age_nonTrawl
#  5  4 1 1 1   #_age_Pearson_CPFV_1980-82
#  5  5 1 1 1   #_age_CDFW_Rec_Bio_2022_PR_central
#  5  7 1 1 1   #_age_CCFRP
#  5 13 1 1 1   #_age_CDFG_Lea_Research
-9999 1 1 1 1  #  terminator
#
0 # (0/1) read specs for more stddev reporting 
999

