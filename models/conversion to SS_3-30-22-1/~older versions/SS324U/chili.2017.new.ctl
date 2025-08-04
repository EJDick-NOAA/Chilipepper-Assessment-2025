# **************************************************************
#  Chilipepper rockfish .ctl file
#  final model from May 2015 assessment update
#  SS3 Version 3.20 by_Richard_Methot_(NOAA);_using_Otter_Research_ADMB_7.0.1
# **************************************************************
#
#
1	#_N_Growth_Patterns
1	#_N_submorphs
3	#_Nblock_Designs
5 10 1	#_blocks_per_pattern

# block design 1
1970 1979 
1980 1988 
1989 1991 
1992 1998
1999 2016
#2004 2014
#2009 2015

# block design 2
1972 1977
1978 1980
1981 1983
1984 1986
1987 1989
1990 1992
1993 1995
1996 1998
1999 2001
2002 2006

# block design 3
2003 2016

0.5	#_fracfemale
0	#_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate

1	# GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=not implemented; 4=not implemented
2	#_Growth_Age-at-L1 (Amin)
18	#_Growth_Age-at-L2 (Amax)
0	#_SD_add_to_LAA (set equal to 0.1 to mimic SS2 v1.xx)
0	#_CV_Growth_Pattern (0: CV=f(LAA) 1: CV=f(A) 2: SD=f(LAA) 3: SD=f(A))

1	#_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
1	#_First_Mature_Age
1	#_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b
0	#_hermaphroditism option:  0=none; 1=age-specific fxn
2	#_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1	#_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)

#_growth_parms
#_LO	HI 	INIT 	PRIOR 	PR_type SD 	PHASE 	env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
0.05 	0.3	0.16 	0.22 	0 	0.8 	-4 	0 	0 	0 	0 	0.5 	0 	0 #_Gpattern:_1_Gender:_1
15 	30 	19.659 	19.659 	0 	20	-4 	0 	0 	0 	0 	0.5 	0 	0
25 	70 	47.3	47.3 	0 	20 	-2 	0 	0 	0 	0 	0.5 	0 	0
0.05	0.3	0.1945 	0.1945 	0 	0.8 	-2 	0 	0 	0 	0 	0.5 	1 	0
0.02 	0.3 	0.06 	0.06 	0 	0.8 	-2 	0 	0 	0 	0 	0.5 	0 	0
0.02 	0.3 	0.06 	0.06 	0 	0.8 	-2 	0 	0 	0 	0 	0.5 	0 	0

-6 	3 	0.232 	0.1279	0 	0.8 	-4 	0 	0 	0 	0 	0.5 	0 	0 #_Gpattern:_1_Gender:_2
-6 	3 	-0.03	-0.03	0 	0.8 	-4 	0 	0 	0 	0 	0.5 	0 	0
-3 	3 	-0.35	-0.35 	0 	0.8 	-2 	0 	0 	0 	0 	0.5 	0 	0
-3 	3 	0.605	0.605 	0 	0.8 	-2 	0 	0 	0 	0 	0.5 	0 	0
-3 	3 	0	0 	0	0.8 	-2 	0 	0 	0 	0 	0.5 	0 	0
-3 	3 	0	0 	0	0.8 	-2 	0 	0 	0 	0 	0.5 	0 	0

-3	3 	4.05e-006 4.1e-006 	0 	0 	-3	0	0 	0 	0 	0.5 	0 	0	#_wt-len-intercept female
-3	10 	3.2 	3.25	0 	0.5 	-3	0 	0 	0 	0 	0.5 	0 	0	#_wt-len-exponent female
1 	50 	24.4 	25 	0 	0.8 	-3 	0 	0 	0 	0 	0.5 	0 	0	#_Maturity: Length-inflection
-3 	3 	-0.27	-0.3 	0 	0.8 	-3 	0 	0 	0 	0 	0.5 	0 	0	#_Maturity: Slope; negative value required
#1 	50 	25.713 	25 	0 	0.8 	-3 	0 	0 	0 	0 	0.5 	0 	0	#_Maturity: Length-inflection
#-3 	3 	-0.316 -0.3 	0 	0.8 	-3 	0 	0 	0 	0 	0.5 	0 	0	#_Maturity: Slope; negative value required
-3 	300 	132.355	132.355	0 	0.8 	-3	0 	0 	0 	0 	0.5 	0 	0	#_Fecundity: eggs/gm intercept - from Beyer et al., He et al.
-3 	100 	59 	59 	0 	0.8 	-3	0 	0 	0 	0 	0.5 	0 	0	#_Fecundity: eggs/gm slope from Beyer et al., He et al.
#-3 	3 	1 	1 	0 	0.8 	-3	0 	0 	0 	0 	0.5 	0 	0	#_Fecundity: eggs/gm intercept
#-3 	3 	0 	0 	0 	0.8 	-3	0 	0 	0 	0 	0.5 	0 	0	#_Fecundity: eggs/gm slope
-3 	3 	2.24e-006 2.2e-006 	0 	0 	-3 		0 	0 	0 	0 	0.5 	0 	0	#_wt-len-intercept male
-3 	10 	3.32 	3.32 	0 	0.05 	-3 	0 	0 	0 	0 	0.5 	0 	0	#_wt-len-exponent male

-4 	4 	0 	0 	-1 	99 	-3 	0 	0 	0 	0 	0.5 	0 	0 #_recrdistribution_by_growth_pattern
-4 	4 	0 	0 	-1 	99 	-3 	0 	0 	0 	0 	0.5 	0 	0 #_recrdistribution_by_area 1
-4 	4 	4 	0 	-1 	99 	-3 	0 	0 	0 	0 	0.5 	0 	0 #_recrdistribution_by_season 1
1 	1 	1 	1 	-1	99 	-3 	0 	0 	0 	0 	0.5 	0 	0 #_cohort_growth_deviation 

#
#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
#
#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_Cond No MG parm trends 
#

# Growth K blocks
1  #custom_MG-block_setup (0/1)
#_LO 	HI 	INIT 	PRIOR 	PR_type SD 	PHASE
-10	10	0	0	0	0.5	5
-10	10	0	0	0	0.5	5
-10	10	0	0	0	0.5	5
-10	10	0	0	0	0.5	5
-10	10	0	0	0	0.5	5
#-10	10	0	0	0	0.5	5
#-10	10	0	0	0	0.5	5

#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K

#_Spawner-Recruitment
3 	#_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm
#_LO 	HI 	INIT 	PRIOR 	PR_type SD	PHASE
5	15 	10.5	10.5	0 	5 	1 	# SR_LN(R0)
0.2	1 	0.57	0.573	0	0.183	-4 	# SR_BH_steep
#0.2	1 	0.81	0.573	0	0.183	-4 	# SR_BH_steep
0 	2	1	1	0	1	-3	# SR_sigmaR
-5	5	0	0	0	1	-3	# SR_envlink
-5	5	0	0	0	1	-3	# SR_R1_offset
0	0.5 	0	0	-1	99	-2	# SR_autocorr
0		#_SR_env_link
0		#_SR_env_target_0=none;1=devs;_2=R0;_3=steepness

1		# do_recdev:  0=none; 1=devvector; 2=simple deviations
1965	# first year of main recr_devs; early devs can preceed this era
2014	# last year of main recr_devs; forecast devs start in following year
2		#_recdev phase 

0		# (0/1) to read 13 advanced options
#1950	#_recdev_early_start (0=none; neg value makes relative to recdev_start)
#3		#_recdev_early_phase
#0		#_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#1		#_lambda for Fcast_recr_like occurring before endyr+1
#1950		#_last_early_yr_nobias_adj_in_MPD
#1950		#_first_yr_fullbias_adj_in_MPD
#2006		#_last_yr_fullbias_adj_in_MPD
#2006 		#_first_recent_yr_nobias_adj_in_MPD
#1.0 			#_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#0		#_period of cycles in recruitment (N parms read below)
#-3		#min rec_dev
#3		#max rec_dev
#0		#_read_recdevs
#_end of advanced SR options
#

#Fishing Mortality info
0.5	# F ballpark for tuning early phases
2006	# F ballpark year
1		# F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.9		# max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# read overall start F value; overall phase; N detailed inputs to read for Fmethod 2
# read N iterations for tuning for Fmethod 3 (recommend 3 to 7)
# if FMethod=2 (instan.), active next line
# 0.1	4	0	# overall start F value; overall phase; N detailed inputs to read

# Number of tuning iterations in hybrid F: 4 or 5 may be good - check how catches data match estimated catches
# if FMethod=3 (hybrid), active next line: phase for FMothod=3
# 4		#_Phase for FMethod=3

#_initial_F_parms
#_LO 	HI 	INIT 	PRIOR 	PR_type SD	PHASE
0 	0.1 	0	0.01 	0 	0.2 	-1
0 	0.1 	0 	0.05 	0 	0.2 	-1
0 	1 	0 	0	0 	0.2 	-1
0 	1 	0 	0 	0	0.2 	-1

# Q_setup details: for columns A, B, C, D
# A = do power: 0=skip, index is proportional to abundance, 1= add an extra parameter for non-linearity
# B = envir links: 0=skip, 1= add parameter for envior effect on Q
# C = extra SD: 0=skip, 1= add additional parameter for additive constant to input SE (in ln space)
# D = Q type: <0=mirror lower abs(#) fleet, 0=no par Q is median unbiased, 1=no par Q is mean unbiased, 2=estimate par for ln(Q)
# 		3 = ln(Q) + set of devs about ln(Q) for all years. 4=ln(Q) + set of devs about Q for indexyr-1

# D definition in SS3 (devtype): <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked

#_Q_setup
# Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den-dep  env-var  extra_se  Q_type
#_A B  	C  	D
0 0 0 0 # 1 trawl
0 0 0 0 # 2 hookline
0 0 0 0 # 3 setnet
0 0 0 0 # 4 rec
0 0 0 0 # 5 triennial
0 0 0 0 # 6 combined
0 0 0 0 # 7 juvsurvey
0 0 0 0 # 8 calcofi
0 0 0 0 # 9 juv2
0 0 0 0 # 10 ghost


#_size_selex_types
#_Pattern Discard Male Special
1 	0 	1 	0 	# 1
1 	0 	1 	0 	# 2
24 	0 	0 	0 	# 3
24	0 	0 	0 	# 4
1 	0 	0 	0 	# 5
1	0 	0 	0 	# 6
0 	0 	0 	0 	# 7
0 	0 	0 	0 	# 8
30 	0 	0 	0 	# 9
24 	0 	0 	0 	# 10

#_age_selex_types
#_Pattern Discard Male Special
 10 0 0 0 # 1
 10 0 0 0 # 2
 10 0 0 0 # 3
 10 0 0 0 # 4
 10 0 0 0 # 5
 10 0 0 0 # 6
 11 0 0 0 # 7
 11 0 0 0 # 8
 10 0 0 0 # 9
 20 0 1 0 # 10

#_selex_parms
#_size_sel: 1
#size sel 1 logistic
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
5	50 	40.28 	30 	0 	100 	2 	0 	0 	0 	0 	0 	0 	0 	#
0.0001 	35	14.31 	5 	0 	10 	3 	0 	0 	0 	0 	0 	0 	0 	#
1	60	10	11	0	100	-5	0	0	0	0	0.5	0	0	# male offset size@dogleg
-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel) at minL
-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel) at dogleg
-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel) at maxL

#_size_sel: 2
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
5 	45 	45 	40 	0 	10 	2 	0 	0 	0 	0 	0 	0 	0 	#
0.0001 	35	14.31 	5 	0 	10 	2 	0 	0 	0 	0 	0 	0 	0 	#
1	60	16	20	0	10	-5	0	0	0	0	0.5	0	0	# male offset size@dogleg
-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel)at minL
-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel)at dogleg
-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel) at maxL

# size sel 3
#5 	45 	45 	40 	0 	10 	2 	0 	0 	0 	0 	0 	0 	0 	#
#0.0001 35	14.31 	5 	0 	10 	2 	0 	0 	0 	0 	0 	0 	0 	#
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
19	51	45.17	50	0	100	2	0	0	0	0	0.5	0	0	#	PEAK	value
-6	6	-2.19	-0.75	0	10	4	0	0	0	0	0.5	0	0	#	TOP	logistic
-1	9	3.87	3.5	0	10	2	0	0	0	0	0.5	0	0	#	WIDTH	exp
-1	9	1.98	5	0	10	4	0	0	0	0	0.5	0	0	#	WIDTH	exp
-50	9	-4.76	-4.5	0	10	2	0	0	0	0	0.5	0	0	#	INIT	logistic
-50	9	-0.54	2.9	0	10	2	0	0	0	0	0.5	0	0	#	FINAL	logistic

#1	60	16	20	0	10	-5	0	0	0	0	0.5	0	0	# male offset size@dogleg
#-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel)at minL
#-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel)at dogleg
#-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	# male offset log(relmalesel) at maxL

#_size_sel: 4
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
19	51	33.85	32	0	10	2	0	0	0	0	0.5	3	0	#	PEAK	value
-20	4	-1.27	-0.75	0	10	2	0	0	0	0	0.5	3	0	#	TOP	logistic
-10	9	3.4	3.5	0	10	2	0	0	0	0	0.5	3	0	#	WIDTH	exp
-10	9	3.68	5	0	10	2	0	0	0	0	0.5	3	0	#	WIDTH	exp
-10	9	-3.37	-4.5	0	10	2	0	0	0	0	0.5	3	0	#	INIT	logistic
-10	9	0.79	2.9	0	10	2	0	0	0	0	0.5	3	0	#	FINAL	logistic

#_size_sel: 5
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
5 	35 	15.7 	25.7 	0 	10 	-2 	0 	0 	0 	0 	0 	0 	0 	#
0.0001	35	0.0002 	5 	0 	10 	-2 	0 	0 	0 	0 	0 	0 	0 	#

# size sel 6
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
5 	35	20 	15 	0 	100 	2 	0 	0 	0 	0 	0 	0 	0 	#
0.0001 	35	14 	5 	0 	10 	2 	0 	0 	0 	0 	0 	0 	0 	#

#_size_sel: 7,8 - none- pre recruit survey
#_size_sel: 9 set to maturity- 										
#_size_sel: 10 Rec CPUE
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
19	51	33.85	32	0	100	2	0	0	0	0	0.5	0	0	#	PEAK	value
-6	4	-1.27	-0.75	0	10	2	0	0	0	0	0.5	0	0	#	TOP	logistic
-1	9	3.4	3.5	0	10	2	0	0	0	0	0.5	0	0	#	WIDTH	exp
-1	9	3.68	5	0	10	2	0	0	0	0	0.5	0	0	#	WIDTH	exp
-10	9	-3.37	-4.5	0	10	2	0	0	0	0	0.5	0	0	#	INIT	logistic
-10	9	0.79	2.9	0	10	2	0	0	0	0	0.5	0	0	#	FINAL	logistic

# size_se1: 10- male offsets- 4 lines
#1	60	16	20	0	10	-5	0	0	0	0	0.5	0	0	#	size@dogleg
#-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	#	log(relmalesel)at minL
#-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	#	log(relmalesel)at dogleg
#-10	10	0	0	0	10	-5	0	0	0	0	0.5	0	0	#	log(relmalesel) at maxL
#
#
#_age_sel: 1
#_age_sel: 2
#_age_sel: 3
#_age_sel: 5
#_age_sel: 6
#_age_sel: 7 - juv survey 1
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
0 	0 	0 	0	0 	10 	-3 	0 0 0 0 0 0 0 # 39
0 	0 	0 	0 	0 	10 	-3 	0 0 0 0 0 0 0 # 40
#_age_sel: 8 - juv survey 2
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
0 	0 	0 	0 	0 	10 	-3 	0 0 0 0 0 0 0 # 39
0 	0 	0 	0 	0 	10 	-3 	0 0 0 0 0 0 0 # 40
 
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
1	10	1.113	1	0	1	-2	0	0	0	0	0.5	0	0	#	PEAK	value
-60	60	-59.9	-23	0	1	-2	0	0	0	0	0.5	0	0	#	TOP	logistic
-40	20	-24.8	-20	0	1	-2	0	0	0	0	0.5	0	0	#	WIDTH	exp
-40	10	-0.12	0	0	1	-3	0	0	0	0	0.5	0	0	#	WIDTH	exp
-40	10	-33.5	-17	0	1	-2	0	0	0	0	0.5	0	0	#	INIT	logistic
-40	20	-4.11	-4.5	0	1	-2	0	0	0	0	0.5	0	0	#	FINAL	logistic

# agesel 10- male offsets- 4 lines
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE	enVar	use_dev	dvMiYr	dvMxYr	dvStd	Block	Block_Fxn
1	60	2	2	0	1	-5	0	0	0	0	0.5	0	0	#	size@dogleg
-10	10	0	0	0	1	-5	0	0	0	0	0.5	0	0	#	log(relmalesel)at minL
-10	10	0	0	0	1	-5	0	0	0	0	0.5	0	0	#	log(relmalesel)at dogleg
-10	10	0	0	0	1	-5	0	0	0	0	0.5	0	0	#	log(relmalesel) at maxL

#1	#_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)

1  #custom_MG-block_setup (0/1)
-3	2 	0 	0 	-1 	99 	4 # 
-3	2 	0 	0 	-1 	99 	4 #
-3	2 	0 	0 	-1 	99 	4 #
-3	2 	0 	0 	-1 	99 	4 #
-3	2 	0 	0 	-1 	99 	4 #
-3	2 	0 	0 	-1 	99 	4 #

1	#_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
# Tag loss and Tag reporting parameters go next
0	# TG_custom:  0=no read; 1=read if tags exist
# -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters


1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 3 4 5 6 7 8 9 10 
0.036251 0 0 0.19632 -0.049828 0.01 0 0.64 0 0 	#_add_to_survey_CV
0 0 0 0 0 0 0 0 0 0 				#_add_to_discard_stddev
0 0 0 0 0 0 0 0 0 0 				#_add_to_bodywt_CV
0.69 0.75 0.73 1 0.69 0.96 1 1 1 2.5 		#_mult_by_lencomp_N
1 1 1 1 1 0.75 1 1 1 1 				#_mult_by_agecomp_N
1 1 1 1 1 1 1 1 1 1 				#_mult_by_size-at-age_N


6 #_maxlambdaphase
0 #_sd_offset

# lambda settings to match the 2007 model
56	# number of changes to make to default Lambdas (default value is 1.0)
# lambdas
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet/survey  phase  value  sizefreq_method

# survey
1	1	1	1.0	1
1	2	1	0.0	1
1	3	1	0.0	1
1	4	1	0.0	1
1	5	1	1.0	1
1	6	1	1.0	1
1	7	1	0.0	1
1	8	1	1.0	1
1	9	1	0.0	1
1	10	1	1.0	1

# length comps
4	1	1	0.1	1
4	2	1	0.1	1
4	3	1	0.1	1
4	4	1	1.0	1
4	5	1	0.1	1
4	6	1	0.1	1
4	7	1	0.0	1
4	8	1	0.0	1
4	9	1	0.0	1
4	10	1	1.0	1

# age comps
5	1	1	1.0	1
5	2	1	1.0	1
5	3	1	1.0	1
5	4	1	0.0	1
5	5	1	1.0	1
5	6	1	1.0	1
5	7	1	0.0	1
5	8	1	0.0	1
5	9	1	0.0	1
5	10	1	0.0	1

# init equ catch
9	1	1	0.0	1
9	2	1	0.0	1
9	3	1	0.0	1
9	4	1	0.0	1
9	5	1	0.0	1
9	6	1	0.0	1
9	7	1	0.0	1
9	8	1	0.0	1
9	9	1	0.0	1
9	10	1	0.0	1

# parameter priors
11	1	1	0.0	1
11	2	1	0.0	1
11	3	1	0.0	1
11	4	1	0.0	1
11	5	1	0.0	1
11	6	1	0.0	1
11	7	1	0.0	1
11	8	1	0.0	1
11	9	1	0.0	1
11	10	1	0.0	1

# parameter dev
12	1	1	1.0	1

# crush penalty
13	1	1	100.0	1

# F ball park
17	1	1	0.0	1
17	2	1	0.0	1
17	3	1	0.0	1
17	4	1	0.0	1


0 # (0/1) read specs for more stddev reporting

999
