#V3.30.23.1;_fast(opt);_compile_date:_Dec  5 2024;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-ost/ss3-source-code
#C Chilipepper Rockfish 2025 Assessment
#C Stock_Synthesis_v3.30.23.1
#_data_and_control_files: Chili_2025.dat // Chili_2025.ctl
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond sd_ratio_rd < 0: platoon_sd_ratio parameter required after movement params.
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 6 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
3 #_Nblock_Patterns
 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1875 1990
 1875 2000
 1875 1999
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 0 0 0 0 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: P(y)=f(TVP,env_Zscore) w/ logit to stay in min-max;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  5: like 4 with logit transform to stay in base min-max
#_DevLinks(more):  21-25 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, wt-len, maturity, fecundity, (hermaphro), recr_distr, cohort_grow, (movement), (age error), (catch_mult), sex ratio 
#_NATMORT
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity;_6=Lorenzen_range
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement) for L1 (aka Amin); first growth parameter is size at this age; linear growth below this
20 #_Age(post-settlement) for L2 (aka Amax); 999 to treat as Linf
0.16 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
2 #_fecundity_at_length option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.5 0.165249 -1.86895 0.31 3 2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 5 15 7.3 7 50 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 44 52 47.9006 48 50 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.15 0.25 0.196942 0.2 50 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.2 0.105029 0 50 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.15 0.0386426 0 50 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 8.41443e-06 8.41443e-06 50 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.13495 3.13495 50 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 20 30 24.4 24.4 50 0 -99 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -1 0 -0.27 -0.27 50 0 -99 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 0.01 5.6822e-08 1.00579e-07 50 0 -99 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 2 5 4.177 3.79 50 0 -99 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -0.5 1 0.265697 0 50 0 2 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -0.6 0 0 0 50 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -0.8 0 -0.32826 0 50 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.2 1 0.526306 0 50 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 1 0.235858 0 50 0 2 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 2 0.1 0 50 0 -2 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 6.93782e-06 6.93782e-06 50 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.20201 3.20201 50 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution 
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Platoon StDev Ratio 
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.1 0.9 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#  M2 parameter for each predator fleet
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             8            13       10.0316            10             5             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
         0.201         0.999          0.72          0.72          0.16             2         -5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             1             1             0        -99          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0        -99          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1968 # first year of main recr_devs; early devs can precede this era
2024 # last year of main recr_devs; forecast devs start in following year
4 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1957.53 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1977.71 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2023.64 #_last_yr_fullbias_adj_in_MPD
 2025 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.8899 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -4 #min rec_dev
 4 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_year Input_value
#
# all recruitment deviations
#  1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020R 2021R 2022R 2023R 2024R 2025F 2026F 2027F 2028F 2029F 2030F 2031F 2032F 2033F 2034F 2035F 2036F
#  0.743604 0.643706 0.908871 0.351782 0.100954 0.493154 0.201611 1.07798 -0.226997 -0.457605 -0.25892 0.738999 -0.17224 -0.978621 -1.35891 -1.01999 1.67186 -1.12598 0.193478 0.0868349 0.332658 0.293633 -0.247956 0.0285806 -0.997508 0.231979 -0.939343 -0.36989 -0.990297 -1.32086 -0.549153 2.47702 -0.612956 0.157584 -0.479188 0.749747 -0.702236 -1.79571 -2.25239 -0.63139 -0.773873 0.864099 1.28365 0.171207 1.09996 1.7017 0.0871056 0.92155 0.189673 -0.0546004 -1.09203 -0.717615 0.0590565 0.618488 -0.388617 0.596421 1.43792 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-1 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
4 # max F (methods 2-4) or harvest fraction (method 1)
4  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
#_year:  1875 1876 1877 1878 1879 1880 1881 1882 1883 1884 1885 1886 1887 1888 1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028 2029 2030 2031 2032 2033 2034 2035 2036
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# NoCA_HKL 0.000227151 0.000454556 0.000682254 0.000910534 0.0011394 0.0013691 0.00159961 0.00183114 0.00206363 0.00229728 0.002532 0.00276797 0.0030051 0.00324348 0.00348322 0.00372419 0.00396657 0.00421023 0.00445533 0.00470175 0.00494965 0.00519889 0.00544963 0.00570175 0.00595533 0.00621045 0.00646698 0.00672508 0.00698461 0.00724573 0.0075083 0.00777249 0.00803816 0.00830547 0.00857428 0.00884475 0.00911675 0.00939036 0.00966567 0.00994255 0.0102212 0.0105031 0.0164393 0.019516 0.013615 0.0139235 0.0115324 0.00990075 0.0106571 0.00616275 0.0078654 0.0125745 0.00899241 0.0115445 0.00962119 0.013174 0.0136028 0.0095616 0.00802124 0.00823667 0.0095602 0.00781968 0.00618833 0.00786793 0.00826679 0.00647388 0.00498747 0.00224657 0.00288427 0.00202908 0.0032869 0.00288994 0.00506156 0.00153636 0.00155555 0.00223826 0.0014837 0.00117245 0.000434989 0.000829063 0.000365706 0.00054551 0.000383728 0.000736251 0.000615019 0.000997076 0.000649775 0.000673056 0.000609536 0.000273064 0.00045542 0.00201783 0.00212911 0.00106703 0.00220525 0.00269401 0.00368506 0.00585582 0.0051151 0.00922618 0.00554156 0.00970413 0.00764373 0.0165622 0.0156952 0.00655221 0.0111526 0.0382079 0.00790275 0.0100584 0.0432204 0.0660569 0.0365753 0.0739526 0.0695769 0.0693387 0.0416733 0.0939591 0.0805837 0.0492063 0.0345051 0.0287933 0.0407615 0.028835 0.0151333 0.00723676 0.00374039 0.000337577 1.28997e-05 0.00018213 0.000159654 0.000270006 0.000169091 0.000199886 2.37758e-05 6.51846e-06 3.15551e-05 4.87508e-05 3.90615e-05 4.57049e-05 4.05375e-05 1.48365e-05 8.98354e-05 7.29147e-05 0.000369461 0.000511906 0.000703489 0.00101812 0.0017169 0.0020464 0.00210968 0.00224707 0.00517933 0.00515127 0.00512885 0.00510592 0.00507684 0.00505346 0.00503018 0.00500126 0.00497823 0.00495525
# SoCA_HKL 0.000184966 0.000370096 0.000555426 0.000741093 0.000927216 0.00111379 0.00130095 0.00148867 0.00167703 0.00186609 0.00205583 0.00224629 0.00243754 0.00262952 0.00282233 0.0030159 0.00321028 0.00340552 0.00360157 0.00379846 0.00399624 0.00419484 0.00439431 0.00459469 0.00479591 0.00499807 0.00520107 0.00540497 0.00560982 0.00581554 0.00602218 0.00622977 0.00643825 0.00664771 0.00685807 0.00706937 0.00728166 0.00749486 0.00770903 0.00792421 0.00814032 0.00835879 0.013562 0.0124607 0.00750311 0.00815994 0.00712477 0.00700375 0.00938607 0.0125604 0.013756 0.0172143 0.0149804 0.0127994 0.0128865 0.0134993 0.0156443 0.0104901 0.00647407 0.00727691 0.00788361 0.00465843 0.00380242 0.00268961 0.00355741 0.00401018 0.00406367 0.00179701 0.00127063 0.000174938 0.000364689 0.000696541 0.000712055 0.00103271 0.00120016 0.00104964 0.00124287 0.000926959 0.000677556 0.000987424 0.00116193 0.00129025 0.00123609 0.00107507 0.00108716 0.00121085 0.00115534 0.000991898 0.00145453 0.00121191 0.0015146 0.00127553 0.00160276 0.00158962 0.00123378 0.000831282 0.000862917 0.00133892 0.00122318 0.000923296 0.00143732 0.00169295 0.00128216 0.00179006 0.00267601 0.00258573 0.00286012 0.00464052 0.00252815 0.00420195 0.00248032 0.00130937 0.001943 0.00844543 0.0290813 0.00566619 0.0184896 0.00773746 0.00643722 0.00126172 0.00109338 0.00135393 0.0039206 0.000933753 0.000701 0.000131132 5.74336e-05 3.39957e-05 3.15695e-06 6.73762e-06 6.37861e-06 2.5156e-06 1.03427e-05 3.20201e-05 9.61005e-06 4.25531e-06 2.03252e-06 6.58807e-06 1.0133e-05 9.52705e-06 5.54708e-06 2.62818e-06 4.10155e-06 6.82448e-06 6.5617e-06 8.28796e-06 2.65581e-05 3.7184e-05 5.1238e-05 7.834e-05 5.34936e-05 5.2745e-05 0.000182679 0.000181681 0.000180875 0.00018006 0.00017904 0.000178224 0.000177412 0.000176402 0.000175597 0.000174794
# CA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00034737 0.000541778 0.000637874 0.000445221 0.000454342 0.000375167 0.000322371 0.000348256 0.000200465 0.00016476 0.000494392 0.000908445 0.00116882 0.00138506 0.00145243 0.00100015 0.00119009 0.00181734 0.00174763 0.00155627 0.00164858 0.00199108 0.00167619 0.00173145 0.00136596 0.00105604 0.000272703 0.00282947 0.0125068 0.0266253 0.020372 0.0142527 0.0117489 0.0137915 0.0174123 0.0285127 0.02961 0.0361202 0.0346346 0.0355946 0.0405352 0.0442543 0.0533534 0.046211 0.0377289 0.0298579 0.0278485 0.0326033 0.0230385 0.0253117 0.0573082 0.0793477 0.0490441 0.0227936 0.0268567 0.0226594 0.0322401 0.0720702 0.080997 0.0720443 0.0757885 0.0572841 0.0397555 0.0611427 0.0865294 0.0789255 0.0626826 0.0736234 0.100092 0.0882133 0.0742266 0.083637 0.102532 0.133891 0.140478 0.182889 0.0936746 0.0956475 0.0989754 0.135858 0.138496 0.160687 0.124777 0.0986947 0.0782747 0.0596528 0.0505093 0.00364834 0.00843801 0.00830266 0.00960989 0.00649766 0.00733374 0.0150324 0.0193638 0.0156944 0.0134066 0.0191562 0.0161083 0.00965464 0.00376959 0.00680197 0.013111 0.0182696 0.0207789 0.0220566 0.0235427 0.0308644 0.0333065 0.0463067 0.0470043 0.10363 0.103063 0.102614 0.102158 0.101577 0.101109 0.100641 0.10006 0.0995971 0.0991357
# OR_WA_Comm 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.06862e-07 7.53108e-07 3.46439e-07 3.15429e-08 9.44426e-08 1.25591e-07 0 4.69038e-07 1.43321e-06 1.58319e-06 2.04257e-06 4.90773e-06 5.56999e-06 1.03222e-05 3.57318e-05 6.18954e-05 7.70618e-05 5.5647e-05 4.92875e-05 0.000103171 0.000109702 7.05169e-05 0.000102042 0.00014982 8.77031e-05 0.000399057 0.000371236 0.000891569 0.000491482 0.000156967 0.00014844 0.000347253 0.000311066 0.000332998 0.000700599 0.000297589 0.00013246 0.000117111 0.000160932 0.000108412 0.00010839 8.12268e-05 8.47933e-05 4.46976e-05 3.86081e-05 3.58938e-05 7.47007e-05 4.95655e-05 1.94153e-05 2.33868e-05 3.37239e-05 0.000111025 0.000257851 0.00134755 0.00135769 0.000173773 0.000208451 0.000170054 6.66845e-05 0.000744475 0.000408451 0.000271851 0.000491171 0.00137028 0.00107779 0.00214982 0.00118215 0.00125936 0.00153679 0.00304932 0.000897318 0.000149237 0.000116994 4.23389e-05 0.000161608 2.62299e-06 5.87706e-06 0 1.24996e-06 1.73289e-07 6.94251e-05 1.88941e-05 6.43768e-05 2.93308e-05 9.76473e-05 5.82416e-05 8.41478e-05 0.000188019 0.00203639 0.000552073 0.00101449 0.000959882 0.00127027 0.000615243 0.000542158 0.00028867 0.000975269 0.00104335 0.00256481 0.00255088 0.00253977 0.00252844 0.00251405 0.00250246 0.00249092 0.00247658 0.00246515 0.00245376
# CA_NET 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000171808 0.000111786 0.000135239 0.000120893 0.000322879 0.00089031 0.000901202 0.00082392 0.000918394 0.00151089 0.0031559 0.0027523 0.00458429 0.00570047 0.0255628 0.01833 0.0628654 0.119959 0.0561294 0.0389161 0.0521307 0.0541116 0.0520312 0.049845 0.0424411 0.0197407 0.0176499 0.0114409 0.0178693 0.0182329 0.00237504 0.00151993 0.00121089 5.59156e-05 1.13112e-05 0.000121583 6.10838e-06 1.35257e-05 1.28716e-05 5.55392e-06 0 0 0 0 0 0 3.40497e-07 0 0 0 0 0 3.44732e-06 0 0 0 4.43746e-08 4.80827e-08 3.25379e-06 3.23582e-06 3.22165e-06 3.20737e-06 3.1892e-06 3.1745e-06 3.15978e-06 3.14147e-06 3.12687e-06 3.11233e-06
# NoCA_OR_WA_Rec 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.23918e-05 8.49932e-05 9.79063e-05 0.000131004 0.000163972 0.000196417 0.000228601 0.000260823 0.000292785 0.000345882 0.000339036 0.000295611 0.000424678 0.000391384 0.000206967 0.000197101 0.000162009 0.000218634 0.000382255 0.000305296 0.000612035 0.000795999 0.000975676 0.00112769 0.000997449 0.000865005 0.00109637 0.00133129 0.00151658 0.00178902 0.0025016 0.00201473 0.00186702 0.00114507 0.00159621 0.00132067 0.00173951 0.00164214 0.00241319 0.00227328 0.0024692 0.00222141 0.00254776 0.00208757 0.00223148 0.00291117 0.00342616 0.00314496 0.00344451 0.00319575 0.00380085 0.00442593 0.00251539 0.00255584 0.00797005 0.0047515 0.00710425 0.00967225 0.0191823 0.00859745 0.0266113 0.0134285 0.0143427 0.0128701 0.0112914 0.00898071 0.00629888 0.00338465 0.00236492 0.00916401 0.000144983 0.00272451 0.00514529 0.00719399 0.000658788 1.1135e-06 1.19559e-07 4.72756e-05 4.24279e-06 3.37702e-06 1.02494e-06 1.25628e-07 2.64593e-07 1.21986e-06 1.65988e-06 2.32418e-06 6.85015e-07 1.77747e-06 2.18329e-07 2.36672e-06 1.09345e-06 3.2194e-06 1.42999e-06 5.93206e-06 3.05461e-05 0.00419755 0.00172472 0.00494885 0.00522418 0.00562729 0.00559678 0.00557231 0.00554736 0.00551579 0.00549043 0.00546517 0.00543379 0.00540879 0.00538386
# SoCA_Rec 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.19231e-06 1.24063e-05 1.86483e-05 2.49349e-05 3.12054e-05 3.73702e-05 4.35206e-05 4.96829e-05 4.95978e-05 9.98766e-05 8.46752e-05 7.27284e-05 4.73204e-05 4.36355e-05 2.30982e-05 2.20035e-05 1.81093e-05 2.44181e-05 4.26199e-05 0.000157006 0.000462574 0.000600062 0.00051777 0.00044069 0.000708756 0.000778243 0.00163678 0.00247984 0.00297071 0.00200548 0.00154377 0.0010056 0.0012372 0.00138114 0.00136749 0.00117361 0.00152945 0.0018912 0.00315231 0.00371538 0.00397233 0.00430489 0.00600476 0.00494831 0.00574582 0.00697015 0.00849739 0.0079551 0.00739627 0.00647255 0.00568021 0.00897244 0.00557273 0.00667679 0.00705033 0.00222802 0.000749959 0.010487 0.00619015 0.000146564 0.00164267 0.00516683 0.0020586 0.00177185 0.00141338 0.000953622 0.00145725 0.000665452 0.000968397 8.48709e-05 0.000633095 0.000643493 0.000873835 0.000142117 0.000440866 1.7447e-05 0.000450164 0.000614471 0.000125367 0.000566195 0.000283759 0.000232973 0.00032125 0.000550292 0.000598882 0.000476587 0.00048926 0.000291378 0.000238704 0.000114772 9.23187e-05 0.000286244 8.97023e-05 0.00022925 0.00024475 0.00228721 0.00238829 0.00245098 0.00209144 0.00486936 0.00484234 0.00482066 0.00479906 0.00477215 0.00475067 0.00472927 0.00470259 0.00468131 0.00466004
# TWL_discard 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00394074 0.00580635 0.00557885 0.00294861 0.00109503 0.000146587 0.000450138 0.00110263 0.00286248 0.0039934 0.00628169 0.00545743 0.00714974 0.00797089 0.00993147 0.00793494 0.0254111 0.0252696 0.0251558 0.0250435 0.0249048 0.0247944 0.024684 0.0245456 0.0244349 0.0243242
#
#_Q_setup for fleets with cpue or survey or deviation data
#_1:  fleet number
#_2:  link type: 1=simple q; 2=mirror; 3=power (+1 parm); 4=mirror with scale (+1p); 5=offset (+1p); 6=offset & power (+2p)
#_     where power is applied as y = q * x ^ (1 + power); so a power value of 0 has null effect
#_     and with the offset included it is y = q * (x + offset) ^ (1 + power)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         3         1         0         0         0         1  #  CA_TWL
         6         1         0         0         0         1  #  NoCA_OR_WA_Rec
         9         1         0         0         0         1  #  WCGBT_Survey
        10         1         0         0         0         1  #  Triennial_Survey
        11         1         0         1         0         1  #  CalCOFI_Survey
        12         1         0         1         0         1  #  RREAS_YOY_Survey
-9999 0 0 0 0 0
#
#_Q_parameters
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15             0       -4.9943             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CA_TWL(3)
           -15             0      -12.6366             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NoCA_OR_WA_Rec(6)
           -15             3      0.589953             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_WCGBT_Survey(9)
           -15             3      0.219036             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial_Survey(10)
           -15             0       -3.7755             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CalCOFI_Survey(11)
             0             1       0.35495           0.1             1             0          1          0          0          0          0          0          0          0  #  Q_extraSD_CalCOFI_Survey(11)
           -15             0      -5.05032             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RREAS_YOY_Survey(12)
             0             1         0.683           0.1             1             0         -1          0          0          0          0          0          0          0  #  Q_extraSD_RREAS_YOY_Survey(12)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (mean over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2*special; non-parm len selex, read as N break points, then N selex parameters
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_2;  parm=6; double_normal with sel(minL) and sel(maxL), using joiners, back compatibile version of 24 with 3.30.18 and older
#Pattern:_25; parm=3; exponential-logistic in length
#Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (mean over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0 0 # 1 NoCA_HKL
 24 0 0 0 # 2 SoCA_HKL
 24 0 0 0 # 3 CA_TWL
 24 0 0 0 # 4 OR_WA_Comm
 24 0 0 0 # 5 CA_NET
 24 0 0 0 # 6 NoCA_OR_WA_Rec
 24 0 0 0 # 7 SoCA_Rec
 24 0 0 0 # 8 TWL_discard
 11 0 0 0 # 9 WCGBT_Survey
 0 0 0 0 # 10 Triennial_Survey
 0 0 0 0 # 11 CalCOFI_Survey
 0 0 0 0 # 12 RREAS_YOY_Survey
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic. Recommend using pattern 18 instead.
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (mean over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (mean over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 0 0 0 0 # 1 NoCA_HKL
 0 0 0 0 # 2 SoCA_HKL
 0 0 0 0 # 3 CA_TWL
 0 0 0 0 # 4 OR_WA_Comm
 0 0 0 0 # 5 CA_NET
 0 0 0 0 # 6 NoCA_OR_WA_Rec
 0 0 0 0 # 7 SoCA_Rec
 0 0 0 0 # 8 TWL_discard
 0 0 0 0 # 9 WCGBT_Survey
 10 0 0 0 # 10 Triennial_Survey
 0 0 0 0 # 11 CalCOFI_Survey
 0 0 0 0 # 12 RREAS_YOY_Survey
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   NoCA_HKL LenSelex
            10            59       40.9735            30            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_peak_NoCA_HKL(1)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NoCA_HKL(1)
          0.01            12       4.39925             3            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_ascend_se_NoCA_HKL(1)
          0.01            12             7             7            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NoCA_HKL(1)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NoCA_HKL(1)
           -12            12            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NoCA_HKL(1)
# 2   SoCA_HKL LenSelex
           8.5          59.5       23.7993            30            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_peak_SoCA_HKL(2)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_SoCA_HKL(2)
           0.5            15           1.2             3            99             0         -3          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_SoCA_HKL(2)
          0.01            12             7             7            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_SoCA_HKL(2)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_SoCA_HKL(2)
           -12            12            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_SoCA_HKL(2)
# 3   CA_TWL LenSelex
            10            59       44.9044            30            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_peak_CA_TWL(3)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_CA_TWL(3)
          0.01            12       4.55625             3            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_ascend_se_CA_TWL(3)
          0.01            12             7             7            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_CA_TWL(3)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_CA_TWL(3)
           -12            12            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_CA_TWL(3)
# 4   OR_WA_Comm LenSelex
            10            59       42.7525            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_OR_WA_Comm(4)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_OR_WA_Comm(4)
          0.01            12       4.55947             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_OR_WA_Comm(4)
          0.01            12             7             7            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_OR_WA_Comm(4)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_OR_WA_Comm(4)
           -12            12            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_OR_WA_Comm(4)
# 5   CA_NET LenSelex
            10            59       46.9908            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_CA_NET(5)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_CA_NET(5)
          0.01            12       4.42563             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_CA_NET(5)
          0.01            12             7             7            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_CA_NET(5)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_CA_NET(5)
           -12            12            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_CA_NET(5)
# 6   NoCA_OR_WA_Rec LenSelex
            10            59       43.8942            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_NoCA_OR_WA_Rec(6)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NoCA_OR_WA_Rec(6)
          0.01            12       5.13617             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NoCA_OR_WA_Rec(6)
          0.01            12             7             7            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NoCA_OR_WA_Rec(6)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NoCA_OR_WA_Rec(6)
           -12            12            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NoCA_OR_WA_Rec(6)
# 7   SoCA_Rec LenSelex
           8.5            50       24.7079            30            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_peak_SoCA_Rec(7)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_SoCA_Rec(7)
           0.5            10       2.92383             3            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_SoCA_Rec(7)
          0.01             8       3.31823             5            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_descend_se_SoCA_Rec(7)
           -11           -10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_SoCA_Rec(7)
           -12            12      -1.11196           -10            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_end_logit_SoCA_Rec(7)
# 8   TWL_discard LenSelex
            10            50       29.5523            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_TWL_discard(8)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_TWL_discard(8)
           0.5             8       4.16685             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_TWL_discard(8)
          0.01             8       3.19313             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_TWL_discard(8)
           -11           -10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_TWL_discard(8)
           -11           -10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_TWL_discard(8)
# 9   WCGBT_Survey LenSelex
             1            10             3             3            99             0        -99          0          0          0          0          0          0          0  #  SizeSel=1_BinLo_WCGBT_Survey(9)
            53            55            54            54            99             0        -99          0          0          0          0          0          0          0  #  SizeSel=1_BinHi_WCGBT_Survey(9)
# 10   Triennial_Survey LenSelex
# 11   CalCOFI_Survey LenSelex
# 12   RREAS_YOY_Survey LenSelex
# 1   NoCA_HKL AgeSelex
# 2   SoCA_HKL AgeSelex
# 3   CA_TWL AgeSelex
# 4   OR_WA_Comm AgeSelex
# 5   CA_NET AgeSelex
# 6   NoCA_OR_WA_Rec AgeSelex
# 7   SoCA_Rec AgeSelex
# 8   TWL_discard AgeSelex
# 9   WCGBT_Survey AgeSelex
# 10   Triennial_Survey AgeSelex
# 11   CalCOFI_Survey AgeSelex
# 12   RREAS_YOY_Survey AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            10          59.5       51.6041            30            99             0      3  # Size_DblN_peak_NoCA_HKL(1)_BLK1repl_1875
           0.5            10       4.15685             4            99             0      3  # Size_DblN_ascend_se_NoCA_HKL(1)_BLK1repl_1875
           8.5          59.5       48.8295            30            99             0      3  # Size_DblN_peak_SoCA_HKL(2)_BLK2repl_1875
           0.5            15        4.8242             4            99             0      3  # Size_DblN_ascend_se_SoCA_HKL(2)_BLK2repl_1875
            10            59       33.7915            30            99             0      3  # Size_DblN_peak_CA_TWL(3)_BLK3repl_1875
          0.01            12       3.28981             4            99             0      3  # Size_DblN_ascend_se_CA_TWL(3)_BLK3repl_1875
           8.5            50       30.6778            30            99             0      3  # Size_DblN_peak_SoCA_Rec(7)_BLK2repl_1875
           0.5            10       3.75181             4            99             0      3  # Size_DblN_ascend_se_SoCA_Rec(7)_BLK2repl_1875
          0.01             8             7             5            99             0      -3  # Size_DblN_descend_se_SoCA_Rec(7)_BLK2repl_1875
           -12            12            10            10            99             0      -3  # Size_DblN_end_logit_SoCA_Rec(7)_BLK2repl_1875
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity? (0/1)
#_no 2D_AR1 selex offset used
#_specs:  fleet, ymin, ymax, amin, amax, sigma_amax, use_rho, len1/age2, devphase, before_range, after_range
#_sigma_amax>amin means create sigma parm for each bin from min to sigma_amax; sigma_amax<0 means just one sigma parm is read and used for all bins
#_needed parameters follow each fleet's specifications
# -9999  0 0 0 0 0 0 0 0 0 0 # terminator
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     1     1     1     2     0     0     0     0     0     0     0
#      5     3     2     1     2     0     0     0     0     0     0     0
#      5     7     3     2     2     0     0     0     0     0     0     0
#      5     9     4     2     2     0     0     0     0     0     0     0
#      5    13     5     3     2     0     0     0     0     0     0     0
#      5    15     6     3     2     0     0     0     0     0     0     0
#      5    37     7     2     2     0     0     0     0     0     0     0
#      5    39     8     2     2     0     0     0     0     0     0     0
#      5    40     9     2     2     0     0     0     0     0     0     0
#      5    42    10     2     2     0     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_factor  fleet  value
      4      1  0.549754
      4      2   2.60463
      4      3  0.229748
      4      4   0.09169
      4      5  0.427312
      4      6  0.403535
      4      7  0.162278
      4      8  0.020526
      4      9   0.03462
      4     10  0.054124
      5      1  0.029681
      5      3  0.015459
      5      4         1
      5      5  0.064954
      5      6         1
      5      9  0.095144
      5     10  0.068007
 -9999   1    0  # terminator
#
7 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 23 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 3 1 0 1
 1 6 1 0 1
 1 9 1 1 1
 1 10 1 1 1
 1 11 1 1 1
 1 12 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 4 5 1 1 1
 4 6 1 1 1
 4 7 1 1 1
 4 8 1 1 1
 4 9 1 1 1
 4 10 1 1 1
 5 1 1 1 1
 5 3 1 1 1
 5 4 1 1 1
 5 5 1 1 1
 5 6 1 1 1
 5 9 1 1 1
 5 10 1 1 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 0 0 0 #_CPUE/survey:_4
#  0 0 0 0 0 0 0 #_CPUE/survey:_5
#  0 0 0 0 0 0 0 #_CPUE/survey:_6
#  0 0 0 0 0 0 0 #_CPUE/survey:_7
#  0 0 0 0 0 0 0 #_CPUE/survey:_8
#  1 1 1 1 1 1 1 #_CPUE/survey:_9
#  1 1 1 1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 1 1 1 #_CPUE/survey:_11
#  1 1 1 1 1 1 1 #_CPUE/survey:_12
#  1 1 1 1 1 1 1 #_lencomp:_1
#  1 1 1 1 1 1 1 #_lencomp:_2
#  1 1 1 1 1 1 1 #_lencomp:_3
#  1 1 1 1 1 1 1 #_lencomp:_4
#  1 1 1 1 1 1 1 #_lencomp:_5
#  1 1 1 1 1 1 1 #_lencomp:_6
#  1 1 1 1 1 1 1 #_lencomp:_7
#  1 1 1 1 1 1 1 #_lencomp:_8
#  1 1 1 1 1 1 1 #_lencomp:_9
#  1 1 1 1 1 1 1 #_lencomp:_10
#  0 0 0 0 0 0 0 #_lencomp:_11
#  0 0 0 0 0 0 0 #_lencomp:_12
#  1 1 1 1 1 1 1 #_agecomp:_1
#  0 0 0 0 0 0 0 #_agecomp:_2
#  1 1 1 1 1 1 1 #_agecomp:_3
#  1 1 1 1 1 1 1 #_agecomp:_4
#  1 1 1 1 1 1 1 #_agecomp:_5
#  1 1 1 1 1 1 1 #_agecomp:_6
#  0 0 0 0 0 0 0 #_agecomp:_7
#  0 0 0 0 0 0 0 #_agecomp:_8
#  1 1 1 1 1 1 1 #_agecomp:_9
#  1 1 1 1 1 1 1 #_agecomp:_10
#  0 0 0 0 0 0 0 #_agecomp:_11
#  0 0 0 0 0 0 0 #_agecomp:_12
#  1 1 1 1 1 1 1 #_init_equ_catch1
#  1 1 1 1 1 1 1 #_init_equ_catch2
#  1 1 1 1 1 1 1 #_init_equ_catch3
#  1 1 1 1 1 1 1 #_init_equ_catch4
#  1 1 1 1 1 1 1 #_init_equ_catch5
#  1 1 1 1 1 1 1 #_init_equ_catch6
#  1 1 1 1 1 1 1 #_init_equ_catch7
#  1 1 1 1 1 1 1 #_init_equ_catch8
#  1 1 1 1 1 1 1 #_init_equ_catch9
#  1 1 1 1 1 1 1 #_init_equ_catch10
#  1 1 1 1 1 1 1 #_init_equ_catch11
#  1 1 1 1 1 1 1 #_init_equ_catch12
#  1 1 1 1 1 1 1 #_recruitments
#  1 1 1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

