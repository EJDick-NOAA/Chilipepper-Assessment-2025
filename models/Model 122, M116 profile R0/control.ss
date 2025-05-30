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
 0.01 0.5 0.171052 -1.86895 0.31 3 2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 5 15 7.3 7 50 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 44 52 48.19 48 50 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.15 0.25 0.193531 0.2 50 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.2 0.110246 0 50 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.15 0.0372932 0 50 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 8.41443e-06 8.41443e-06 50 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.13495 3.13495 50 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 20 30 24.4 24.4 50 0 -99 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -1 0 -0.27 -0.27 50 0 -99 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 0.01 5.6822e-08 1.00579e-07 50 0 -99 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 2 5 4.177 3.79 50 0 -99 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -0.5 1 0.260589 0 50 0 2 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -0.6 0 0 0 50 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -0.8 0 -0.337454 0 50 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.2 1 0.549249 0 50 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 1 0.208244 0 50 0 2 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 2 0.148289 0 50 0 2 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
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
             8            13       10.2476            10             5             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
         0.201         0.999          0.72          0.72          0.16             2         -5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             1             1             0        -99          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0        -99          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
2 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1968 # first year of main recr_devs; early devs can precede this era
2024 # last year of main recr_devs; forecast devs start in following year
4 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1962.67 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1978.62 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2022.77 #_last_yr_fullbias_adj_in_MPD
 2025 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.8596 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  0.215774 0.281206 0.850584 0.110302 -0.138578 0.368552 -0.0666152 0.948482 -0.429684 -0.543345 -0.684959 0.55216 -0.479439 -1.07625 -1.59204 -1.30382 1.52519 -1.39864 0.0319222 -0.0983812 0.123596 0.154649 -0.506112 -0.0660128 -1.18605 0.0908533 -1.0846 -0.592325 -1.25068 -1.13527 -0.900113 2.37236 -1.46026 0.0677963 -0.751079 0.603603 -0.94136 -1.9764 -2.29024 -0.727453 -1.07038 0.682041 1.05989 -0.0511576 0.858607 1.36662 -0.325432 0.600276 -0.131592 -0.465181 -1.51379 -0.965292 -0.32518 0.24673 -0.781518 -0.00796958 0.729759 0 0 0 0 0 0 0 0 0 0 0 0
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
# NoCA_HKL 0.000168156 0.000336476 0.000504969 0.000673829 0.000843039 0.00101277 0.00118298 0.00135383 0.00152525 0.00169738 0.00187014 0.00204367 0.00221788 0.00239284 0.00256862 0.00274513 0.00292248 0.00310059 0.00327956 0.00345929 0.00363991 0.00382132 0.00400361 0.00418671 0.00437066 0.00455552 0.00474119 0.00492779 0.00511521 0.00530357 0.00549276 0.0056829 0.00587388 0.00606582 0.00625861 0.00645237 0.006647 0.00684255 0.00703909 0.00723651 0.00743493 0.00763533 0.0119352 0.0141412 0.00985319 0.0100711 0.00833882 0.00715914 0.00770553 0.00445478 0.00568327 0.00907638 0.00648304 0.0083162 0.00692602 0.00947606 0.00977364 0.00686589 0.00576178 0.00592008 0.00687421 0.00562615 0.00445687 0.00567252 0.00596559 0.00467564 0.00360542 0.00162615 0.00209063 0.00147145 0.00238015 0.00208778 0.00365056 0.00110689 0.00111957 0.00160847 0.00106338 0.000837285 0.000309373 0.000586945 0.000257678 0.000382299 0.000267287 0.000509262 0.000422457 0.000681338 0.000442573 0.000457615 0.000413767 0.000185222 0.00030901 0.00136524 0.00142857 0.000710252 0.00146431 0.00178863 0.00244739 0.00389441 0.00340729 0.0061743 0.00374906 0.00665764 0.00532007 0.011697 0.0112173 0.00471807 0.00806733 0.027723 0.005755 0.00736283 0.0317481 0.0485141 0.0269801 0.0549976 0.0518045 0.051377 0.0416587 0.0940303 0.0811557 0.0499452 0.0352486 0.0295319 0.0419118 0.0297463 0.0157257 0.00759334 0.00394839 0.000353583 1.33381e-05 0.000187138 0.000163865 0.000278184 0.000175874 0.000210861 2.55044e-05 7.11835e-06 3.50794e-05 5.50464e-05 4.45162e-05 5.21602e-05 4.61335e-05 1.68744e-05 0.000102823 8.44675e-05 0.000434397 0.000612112 0.000857187 0.00126669 0.0021859 0.00266985 0.00282147 0.0030818 0.00560452 0.0055741 0.00554979 0.00552501 0.00549361 0.00546833 0.00544312 0.00541179 0.00538679 0.00536184
# SoCA_HKL 0.000148913 0.000297941 0.000447098 0.000596479 0.00074617 0.000896155 0.00104653 0.00119727 0.00134843 0.00150007 0.00165213 0.00180467 0.00195773 0.00211126 0.00226533 0.00241989 0.00257498 0.00273063 0.00288679 0.0030435 0.00320078 0.00335859 0.00351695 0.00367591 0.00383539 0.00399548 0.0041561 0.0043173 0.0044791 0.00464145 0.00480438 0.00496793 0.00513203 0.00529675 0.00546204 0.00562791 0.00579442 0.0059615 0.00612918 0.0062975 0.00646639 0.00663683 0.010757 0.00986812 0.00593646 0.00645383 0.005634 0.00553873 0.0074226 0.00993101 0.0108727 0.0135943 0.0118186 0.0100914 0.0101546 0.0106309 0.0123094 0.00825038 0.00509344 0.00572797 0.00620765 0.00366992 0.00299791 0.00212229 0.00280901 0.0031685 0.00321298 0.00142228 0.00100673 0.000138626 0.000288495 0.000549619 0.000560884 0.000812601 0.000943482 0.00082404 0.00097339 0.000723587 0.000526926 0.000764708 0.000896054 0.000990312 0.000943734 0.000815843 0.000820179 0.000909793 0.000866252 0.000743168 0.00108907 0.000907401 0.00113494 0.000953456 0.00118868 0.00117025 0.00090665 0.0006114 0.000636775 0.000997294 0.000923912 0.000707916 0.00111767 0.00133207 0.00101914 0.00143711 0.00216403 0.00209805 0.00232613 0.0037882 0.00207658 0.00347961 0.00206871 0.00109715 0.00163814 0.00714514 0.0245159 0.00476327 0.0155558 0.00653227 0.00547116 0.00108184 0.000945943 0.00117984 0.0034318 0.000819985 0.000619227 0.000116787 7.98174e-05 4.04891e-05 3.85536e-06 8.884e-06 9.18118e-06 3.8686e-06 1.71312e-05 5.7623e-05 1.86761e-05 8.71346e-06 4.17249e-06 1.2249e-05 1.71533e-05 1.56391e-05 8.90198e-06 4.19464e-06 6.80246e-06 1.18637e-05 1.21061e-05 1.63967e-05 5.66684e-05 8.46002e-05 0.000120303 0.000184135 0.000126801 0.000123122 0.000358286 0.000356334 0.000354752 0.000353159 0.000351171 0.000349582 0.000347999 0.000346026 0.00034445 0.000342876
# CA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000294861 0.000459585 0.000540593 0.000377125 0.000384786 0.000317707 0.000273015 0.000294931 0.000169743 0.000139475 0.000418281 0.000768113 0.000987854 0.00117022 0.00122666 0.000844238 0.00100433 0.00153398 0.00147556 0.0013142 0.00139253 0.00168254 0.00141707 0.00146434 0.00115563 0.000893771 0.000230945 0.00239764 0.0105954 0.0225135 0.0171841 0.012005 0.00988921 0.0116019 0.0146339 0.0239168 0.0247704 0.0301251 0.028792 0.0294969 0.0334735 0.0364028 0.0436916 0.0376854 0.0306933 0.0242714 0.022643 0.0265082 0.0187375 0.0206031 0.0465395 0.0639851 0.0393107 0.0182594 0.0215606 0.0184201 0.0270633 0.0622551 0.0707505 0.0633203 0.0669328 0.0507933 0.0354501 0.0547497 0.0775917 0.0708413 0.0566185 0.0672904 0.0926011 0.0821816 0.0693914 0.0783545 0.0965996 0.126837 0.133423 0.174154 0.0895755 0.0920074 0.0957954 0.131839 0.134451 0.155976 0.121408 0.0967615 0.0830049 0.0640337 0.0544407 0.00386344 0.00873755 0.00850052 0.00983998 0.00671709 0.0077129 0.0161758 0.0214004 0.0178495 0.0156815 0.0228893 0.0193795 0.011541 0.00446084 0.00800109 0.0154491 0.0217332 0.0251217 0.0272255 0.0298017 0.0402527 0.0449 0.0645652 0.0676649 0.114148 0.113524 0.113028 0.112525 0.111885 0.111368 0.110852 0.110212 0.109701 0.109191
# OR_WA_Comm 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.36143e-07 6.21899e-07 2.85888e-07 2.60216e-08 7.79335e-08 1.03679e-07 0 3.87456e-07 1.18463e-06 1.30941e-06 1.69023e-06 4.06301e-06 4.61367e-06 8.55677e-06 2.96444e-05 5.13463e-05 6.38073e-05 4.59564e-05 4.06354e-05 8.49803e-05 9.02899e-05 5.79735e-05 8.37101e-05 0.000122537 7.1487e-05 0.000324051 0.000300338 0.000718323 0.000394167 0.000125228 0.000117834 0.000274782 0.000245828 0.000263147 0.000553567 0.000235216 0.000104799 9.24404e-05 0.000126075 8.43459e-05 8.42229e-05 6.32299e-05 6.64519e-05 3.56286e-05 3.1466e-05 2.97904e-05 6.27833e-05 4.20307e-05 1.65824e-05 2.01147e-05 2.91375e-05 9.60949e-05 0.000223681 0.00117466 0.00119269 0.000154134 0.000186526 0.000153114 6.02999e-05 0.00067253 0.000368185 0.000245765 0.000446153 0.00125032 0.000989406 0.00198813 0.00110064 0.0011776 0.00143919 0.00286013 0.000846539 0.000142009 0.000112102 4.02119e-05 0.00015061 2.4361e-06 5.51729e-06 0 1.20604e-06 1.68919e-07 6.8309e-05 1.87511e-05 6.43322e-05 2.94294e-05 9.79704e-05 5.83153e-05 8.43765e-05 0.000189935 0.0020843 0.000575157 0.00107797 0.00103984 0.00140144 0.000690569 0.000618775 0.000334725 0.00114894 0.00125248 0.00244532 0.00243201 0.0024214 0.0024106 0.00239692 0.0023859 0.00237489 0.00236121 0.00235028 0.00233938
# CA_NET 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000135242 8.80301e-05 0.000106699 9.60347e-05 0.000259683 0.000727058 0.000746757 0.000690645 0.000777441 0.00129199 0.00271958 0.0023799 0.00397216 0.0049576 0.0223857 0.0162042 0.056045 0.107543 0.0507194 0.0353141 0.0468596 0.0480743 0.0459811 0.0440743 0.0377506 0.0177206 0.0160059 0.0104678 0.0164513 0.0168586 0.00221045 0.00142788 0.00115063 5.35554e-05 1.06894e-05 0.000111926 5.55978e-06 1.23824e-05 1.19606e-05 5.25579e-06 0 0 0 0 0 0 3.53423e-07 0 0 0 0 0 3.74665e-06 0 0 0 5.3538e-08 5.95231e-08 3.00746e-06 2.99091e-06 2.97777e-06 2.96452e-06 2.94769e-06 2.93408e-06 2.92046e-06 2.90353e-06 2.89002e-06 2.87655e-06
# NoCA_OR_WA_Rec 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.81727e-05 7.6495e-05 8.80647e-05 0.00011774 0.000147307 0.000176498 0.000205504 0.000234537 0.000263392 0.000311378 0.000305442 0.000266495 0.000383078 0.000353284 0.000187003 0.000178268 0.000146548 0.000197439 0.000344366 0.0002746 0.000549994 0.000714732 0.000874975 0.00100896 0.00088962 0.000768735 0.000970508 0.00117381 0.00133128 0.00156273 0.00217291 0.00174056 0.00160707 0.000983821 0.00137058 0.00113323 0.00149247 0.00140982 0.0020666 0.00193219 0.00208451 0.0018733 0.00215618 0.0017866 0.00194849 0.00259382 0.0030949 0.00286627 0.00315879 0.00294697 0.00352699 0.00412605 0.0023506 0.00239674 0.00752549 0.00453311 0.00685831 0.00942979 0.0188097 0.00845045 0.0260899 0.0130822 0.0139087 0.0124584 0.0109455 0.00875053 0.00617828 0.00333974 0.00234349 0.00910709 0.000144651 0.00273873 0.0052189 0.00732045 0.000662624 1.10543e-06 1.18179e-07 4.6862e-05 4.23566e-06 3.4065e-06 1.04796e-06 1.30532e-07 2.79768e-07 1.3123e-06 1.81078e-06 2.55333e-06 7.53092e-07 1.95269e-06 2.40438e-07 2.62558e-06 1.22725e-06 3.6666e-06 1.65683e-06 7.00512e-06 3.68302e-05 0.00517761 0.00217848 0.00640496 0.00694311 0.00594254 0.00591034 0.00588453 0.00585824 0.005825 0.00579824 0.00577154 0.00573835 0.00571186 0.00568544
# SoCA_Rec 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.23347e-06 1.0482e-05 1.575e-05 2.10494e-05 2.63369e-05 3.15455e-05 3.67464e-05 4.19557e-05 4.18939e-05 8.43954e-05 7.15792e-05 6.15014e-05 4.00279e-05 3.69243e-05 1.9557e-05 1.86404e-05 1.53375e-05 2.06434e-05 3.59501e-05 0.000132261 0.000389429 0.000504911 0.000435281 0.000369806 0.000593264 0.000649602 0.00136213 0.00205773 0.00245709 0.00165281 0.00126706 0.000822234 0.00100939 0.00112606 0.00111514 0.000956959 0.00124744 0.0015436 0.00256723 0.00300609 0.00319662 0.00346354 0.00486893 0.00412364 0.00494636 0.00609747 0.00748449 0.00704512 0.00657349 0.0057777 0.00509556 0.00807678 0.00502072 0.00604106 0.00644235 0.00206045 0.000699468 0.00982765 0.00581692 0.000138448 0.00156177 0.00492667 0.0019688 0.00170093 0.00136206 0.000923916 0.00141615 0.000647408 0.000942495 8.26976e-05 0.000619827 0.000634323 0.000863124 0.000136054 0.000427534 1.7015e-05 0.00044042 0.000604269 0.000124067 0.00056307 0.000282846 0.00023194 0.000321036 0.000553175 0.000607766 0.000488728 0.000505115 0.000309339 0.00026103 0.000127056 0.000103026 0.000322175 0.00010206 0.0002626 0.000282509 0.00268021 0.00284401 0.0030044 0.00273376 0.00487946 0.0048528 0.00483136 0.00480986 0.00478295 0.0047614 0.00473989 0.00471306 0.00469163 0.00467021
# TWL_discard 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0039569 0.00588977 0.00573937 0.00307079 0.00116527 0.00016115 0.000508012 0.00126337 0.00331191 0.00466928 0.00741318 0.00646709 0.0085286 0.00964439 0.0123587 0.010466 0.0257805 0.0256384 0.0255237 0.0254099 0.0252686 0.025156 0.0250434 0.0249026 0.02479 0.0246775
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
           -15             0      -5.05784             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CA_TWL(3)
           -15             0       -12.658             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NoCA_OR_WA_Rec(6)
           -15             3      0.812175             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_WCGBT_Survey(9)
           -15             3      0.181108             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial_Survey(10)
           -15             0      -3.87272             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CalCOFI_Survey(11)
             0             1      0.313158           0.1             1             0          1          0          0          0          0          0          0          0  #  Q_extraSD_CalCOFI_Survey(11)
           -15             0      -5.03945             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RREAS_YOY_Survey(12)
             0             3       1.23343           0.1             1             0          1          0          0          0          0          0          0          0  #  Q_extraSD_RREAS_YOY_Survey(12)
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
            10            59       41.2474            30            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_peak_NoCA_HKL(1)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NoCA_HKL(1)
          0.01            12       4.42847             3            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_ascend_se_NoCA_HKL(1)
          0.01            12       5.02413             5            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_descend_se_NoCA_HKL(1)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NoCA_HKL(1)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NoCA_HKL(1)
# 2   SoCA_HKL LenSelex
           8.5          59.5       24.2451            30            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_peak_SoCA_HKL(2)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_SoCA_HKL(2)
           0.5            15       1.41033             3            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_SoCA_HKL(2)
           0.5            20       5.78144            10            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_descend_se_SoCA_HKL(2)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_SoCA_HKL(2)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_SoCA_HKL(2)
# 3   CA_TWL LenSelex
            10            59       44.6731            30            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_peak_CA_TWL(3)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_CA_TWL(3)
          0.01            12       4.50165             3            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_ascend_se_CA_TWL(3)
          0.01            20       2.98528            15            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_descend_se_CA_TWL(3)
           -10            10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_CA_TWL(3)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_CA_TWL(3)
# 4   OR_WA_Comm LenSelex
            10            59        41.925            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_OR_WA_Comm(4)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_OR_WA_Comm(4)
          0.01            12       4.47569             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_OR_WA_Comm(4)
          0.01            20            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_OR_WA_Comm(4)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_OR_WA_Comm(4)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_OR_WA_Comm(4)
# 5   CA_NET LenSelex
            10            59       45.8676            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_CA_NET(5)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_CA_NET(5)
          0.01            12       4.30744             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_CA_NET(5)
          0.01            12       3.63213             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_CA_NET(5)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_CA_NET(5)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_CA_NET(5)
# 6   NoCA_OR_WA_Rec LenSelex
            10            59       43.4907            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_NoCA_OR_WA_Rec(6)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NoCA_OR_WA_Rec(6)
          0.01            12       5.08974             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NoCA_OR_WA_Rec(6)
          0.01            12       4.32053             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NoCA_OR_WA_Rec(6)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NoCA_OR_WA_Rec(6)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NoCA_OR_WA_Rec(6)
# 7   SoCA_Rec LenSelex
           8.5            50       24.6445            30            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_peak_SoCA_Rec(7)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_SoCA_Rec(7)
           0.5            10       2.91266             3            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_SoCA_Rec(7)
          0.01             8       3.36501             5            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_descend_se_SoCA_Rec(7)
           -11           -10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_SoCA_Rec(7)
           -12            12      -1.10801           -10            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_end_logit_SoCA_Rec(7)
# 8   TWL_discard LenSelex
            10            50       29.5467            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_TWL_discard(8)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_TWL_discard(8)
           0.5             8       4.18199             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_TWL_discard(8)
          0.01             8       3.20012             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_TWL_discard(8)
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
            10          59.5       50.2373            30            99             0      3  # Size_DblN_peak_NoCA_HKL(1)_BLK1repl_1875
           0.5            10       4.05049             4            99             0      3  # Size_DblN_ascend_se_NoCA_HKL(1)_BLK1repl_1875
           0.5            10            10             4            99             0      -3  # Size_DblN_descend_se_NoCA_HKL(1)_BLK1repl_1875
           8.5          59.5       47.4103            30            99             0      3  # Size_DblN_peak_SoCA_HKL(2)_BLK2repl_1875
           0.5            15       4.71708             4            99             0      3  # Size_DblN_ascend_se_SoCA_HKL(2)_BLK2repl_1875
           0.5            15            10            10            99             0      -3  # Size_DblN_descend_se_SoCA_HKL(2)_BLK2repl_1875
            10            59       33.5853            30            99             0      3  # Size_DblN_peak_CA_TWL(3)_BLK3repl_1875
          0.01            12       3.23437             4            99             0      3  # Size_DblN_ascend_se_CA_TWL(3)_BLK3repl_1875
          0.01            20            19            19            99             0      -3  # Size_DblN_descend_se_CA_TWL(3)_BLK3repl_1875
           8.5            50       30.5808            30            99             0      3  # Size_DblN_peak_SoCA_Rec(7)_BLK2repl_1875
           0.5            10       3.73193             4            99             0      3  # Size_DblN_ascend_se_SoCA_Rec(7)_BLK2repl_1875
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
#      5     4     3     1     2     0     0     0     0     0     0     0
#      5     7     4     2     2     0     0     0     0     0     0     0
#      5     9     5     2     2     0     0     0     0     0     0     0
#      5    10     6     2     2     0     0     0     0     0     0     0
#      5    13     7     3     2     0     0     0     0     0     0     0
#      5    15     8     3     2     0     0     0     0     0     0     0
#      5    16     9     3     2     0     0     0     0     0     0     0
#      5    37    10     2     2     0     0     0     0     0     0     0
#      5    39    11     2     2     0     0     0     0     0     0     0
#      5    40    12     2     2     0     0     0     0     0     0     0
#      5    42    13     2     2     0     0     0     0     0     0     0
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
      4      1  0.538544
      4      2   2.46105
      4      3  0.244897
      4      4  0.090563
      4      5  0.409513
      4      6  0.379803
      4      7  0.170576
      4      8    0.0206
      4      9  0.035994
      4     10  0.058115
      5      1  0.030383
      5      3    0.0162
      5      4         1
      5      5  0.064152
      5      6         1
      5      9  0.095485
      5     10  0.116064
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

