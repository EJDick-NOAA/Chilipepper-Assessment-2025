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
 0.01 0.5 0.179249 -1.86895 0.31 3 2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 5 15 7.3 7 50 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 44 52 48.1477 48 50 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.15 0.25 0.19396 0.2 50 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.2 0.109209 0 50 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.15 0.0378103 0 50 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 8.41443e-06 8.41443e-06 50 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.13495 3.13495 50 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 20 30 24.4 24.4 50 0 -99 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -1 0 -0.27 -0.27 50 0 -99 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 0.01 5.6822e-08 1.00579e-07 50 0 -99 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 2 5 4.177 3.79 50 0 -99 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -0.5 1 0.241293 0 50 0 2 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -0.6 0 0 0 50 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -0.8 0 -0.33765 0 50 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.2 1 0.548194 0 50 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 1 0.214217 0 50 0 2 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 2 0.152194 0 50 0 2 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
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
             8            13       10.1779            10             5             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
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
 -30 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1961.6 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1979.5 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2023.5 #_last_yr_fullbias_adj_in_MPD
 2025 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.8454 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_year Input_value
#
# all recruitment deviations
#  1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020R 2021R 2022R 2023R 2024R 2025F 2026F 2027F 2028F 2029F 2030F 2031F 2032F 2033F 2034F 2035F 2036F
#  0.0649987 0.0735243 0.0831949 0.0944108 0.107493 0.122437 0.139422 0.158322 0.179467 0.203518 0.230918 0.261421 0.293692 0.32707 0.359437 0.386274 0.402848 0.406438 0.403363 0.408599 0.445724 0.529161 0.608476 0.508811 0.212662 -0.066308 -0.239367 -0.259201 -0.0771643 0.362113 0.53369 0.386516 1.02139 0.207522 -0.0260825 0.522681 0.0201191 1.08118 -0.347857 -0.436336 -0.591869 0.664093 -0.370049 -0.962442 -1.48946 -1.19135 1.63735 -1.3255 0.135091 0.000955944 0.226463 0.261001 -0.415266 0.0392325 -1.10414 0.196977 -0.995488 -0.481785 -1.15828 -1.04311 -0.808312 2.4611 -1.39623 0.139002 -0.666354 0.701449 -0.841316 -1.87659 -2.18844 -0.618278 -0.93717 0.789483 1.17134 0.0540854 0.972369 1.48688 -0.223888 0.706793 -0.0289453 -0.370673 -1.42781 -0.873377 -0.243155 0.323002 -0.717836 0.0900066 0.901644 0 0 0 0 0 0 0 0 0 0 0 0
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
# NoCA_HKL 0.000205371 0.000410971 0.000616832 0.000823213 0.00103011 0.00123775 0.00144609 0.00165533 0.0018654 0.00207647 0.00228846 0.00250152 0.00271557 0.00293069 0.00314695 0.00336427 0.00358277 0.00380236 0.00402316 0.00424506 0.00446821 0.00469248 0.00491802 0.0051447 0.00537259 0.00560178 0.00583214 0.00606381 0.00629667 0.00653085 0.00676624 0.00700298 0.00724094 0.00748026 0.00772082 0.00796277 0.00820597 0.00845051 0.00869646 0.0089437 0.00919237 0.00944395 0.0147778 0.0175383 0.0122317 0.0125051 0.0103544 0.00888693 0.00956328 0.00552877 0.0070546 0.0112756 0.00806157 0.0103472 0.00862144 0.0118021 0.0121827 0.00856104 0.00718033 0.00737192 0.00855526 0.00699712 0.00553734 0.00704065 0.00739832 0.00579452 0.00446478 0.0020114 0.00258189 0.00181427 0.00293046 0.00256412 0.00446166 0.00134337 0.0013471 0.00191652 0.00125348 0.000975207 0.000355424 0.000663801 0.000286182 0.000415785 0.000283784 0.000526026 0.000423362 0.000661702 0.000416635 0.000418019 0.00036698 0.000159647 0.000258888 0.00110709 0.00111737 0.000540572 0.0011055 0.00136489 0.00191787 0.00316683 0.0028769 0.0053782 0.00334364 0.00603799 0.00488371 0.0108467 0.0104869 0.00443784 0.00762769 0.026339 0.00549258 0.00705508 0.0304973 0.0466346 0.025964 0.053022 0.0499416 0.0494653 0.0396395 0.08916 0.0767513 0.0471563 0.0332318 0.0277789 0.0392656 0.0277375 0.0146271 0.00706489 0.00368246 0.000330101 1.24442e-05 0.000174846 0.0001537 0.000262316 0.000166775 0.00020106 2.44518e-05 6.86202e-06 3.40011e-05 5.36211e-05 4.35156e-05 5.10777e-05 4.52307e-05 1.65591e-05 0.000100948 8.3007e-05 0.000427802 0.000604768 0.000850409 0.00126282 0.00219121 0.00269215 0.00286283 0.00314797 0.0059168 0.0058847 0.00585905 0.00583285 0.00579961 0.00577286 0.00574621 0.0057131 0.00568668 0.00566033
# SoCA_HKL 0.000178817 0.00035779 0.000536953 0.000716432 0.00089634 0.00107667 0.00125754 0.00143892 0.00162089 0.00180351 0.00198673 0.00217061 0.00235521 0.00254046 0.00272646 0.00291314 0.00310055 0.00328873 0.00347762 0.00366727 0.00385771 0.00404888 0.00424082 0.00443357 0.00462706 0.00482138 0.00501645 0.00521231 0.00540901 0.00560648 0.00580475 0.00600387 0.00620377 0.00640453 0.00660608 0.00680845 0.0070117 0.00721575 0.00742065 0.00762644 0.00783304 0.00804182 0.0130447 0.0119818 0.00721261 0.00784194 0.00684541 0.00672777 0.00901461 0.0120614 0.0132074 0.0165245 0.014377 0.0122813 0.0123623 0.0129472 0.0150004 0.0100559 0.00620514 0.00697396 0.00755488 0.00446412 0.00364402 0.00257785 0.00341003 0.0038445 0.00389546 0.00172129 0.00121448 0.000166538 0.000345037 0.000653673 0.0006619 0.00094974 0.0010906 0.000941062 0.0010971 0.000803739 0.000575648 0.000819696 0.000939833 0.00101337 0.000939422 0.000787897 0.000767413 0.000825341 0.000763395 0.0006373 0.000908424 0.000735596 0.000894895 0.000732335 0.000895171 0.000880204 0.000697512 0.000488851 0.000531909 0.000866448 0.000825509 0.000643279 0.0010262 0.00123173 0.00094798 0.00134524 0.00203733 0.00198375 0.00220769 0.00360907 0.00198601 0.00333903 0.00198922 0.00105564 0.00157801 0.0068939 0.023647 0.00458834 0.0149422 0.0062507 0.00522065 0.00103046 0.000899702 0.00111975 0.00324481 0.000771888 0.000581658 0.000109763 7.28121e-05 3.68186e-05 3.51729e-06 8.13249e-06 8.43482e-06 3.56633e-06 1.58542e-05 5.3544e-05 1.74282e-05 8.16337e-06 3.92588e-06 1.15697e-05 1.62367e-05 1.48413e-05 8.4483e-06 3.97711e-06 6.46332e-06 1.12999e-05 1.15671e-05 1.57234e-05 5.4561e-05 8.183e-05 0.000117044 0.000180281 0.000125055 0.00012232 0.000367214 0.000365211 0.000363587 0.000361951 0.000359911 0.000358281 0.000356658 0.000354636 0.000353021 0.000351407
# CA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000348681 0.000543768 0.000640138 0.000446734 0.000455815 0.00037633 0.000323329 0.000349255 0.000201021 0.000165202 0.000495674 0.000910697 0.00117157 0.00138813 0.00145545 0.00100209 0.00119223 0.00182038 0.0017504 0.00155862 0.00165101 0.00199397 0.00167864 0.00173404 0.00136797 0.00105642 0.000271774 0.00280254 0.0122915 0.0259237 0.019625 0.0135723 0.0110495 0.012795 0.0159106 0.0256016 0.0260566 0.0310645 0.0290251 0.0289885 0.0319864 0.0337564 0.0392787 0.0328761 0.0260581 0.0201046 0.0182908 0.0207831 0.0142308 0.015306 0.0344227 0.0480733 0.0306872 0.0150535 0.0187083 0.0164803 0.0245407 0.0568719 0.0649051 0.0583383 0.0619496 0.0472191 0.0331425 0.0514262 0.0731192 0.0669774 0.0537356 0.0640934 0.0884414 0.0786304 0.0664504 0.0751663 0.092683 0.121487 0.127633 0.166171 0.0851734 0.0872651 0.0907284 0.12469 0.126877 0.146582 0.113563 0.0902907 0.0778013 0.060146 0.0513026 0.00365341 0.00828356 0.00807893 0.0093818 0.00642876 0.00741269 0.0156126 0.020745 0.0173817 0.015343 0.0224979 0.0191219 0.0114205 0.00442313 0.00794285 0.0153493 0.0216188 0.0250387 0.0272111 0.0298916 0.0405484 0.0454612 0.0657672 0.0694036 0.121001 0.12034 0.119815 0.11928 0.1186 0.118051 0.117503 0.116823 0.116281 0.11574
# OR_WA_Comm 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.07713e-07 7.54561e-07 3.47047e-07 3.15929e-08 9.45794e-08 1.2576e-07 0 4.69616e-07 1.43497e-06 1.58519e-06 2.04525e-06 4.91414e-06 5.57452e-06 1.03115e-05 3.55571e-05 6.12227e-05 7.56093e-05 5.4069e-05 4.73748e-05 9.80081e-05 0.000102877 6.5188e-05 9.27861e-05 0.000133672 7.65774e-05 0.000339995 0.000307772 0.000716888 0.000382134 0.000117701 0.000107334 0.000243008 0.00021161 0.000220763 0.000451787 0.000186437 8.09087e-05 7.00133e-05 9.49311e-05 6.46052e-05 6.71748e-05 5.30406e-05 5.83348e-05 3.2284e-05 2.90072e-05 2.76881e-05 5.86436e-05 3.94135e-05 1.56134e-05 1.90416e-05 2.77342e-05 9.18258e-05 0.000214338 0.0011288 0.00115018 0.000149135 0.000180803 0.000148459 5.85785e-05 0.000656372 0.000360132 0.000240044 0.000434024 0.0012111 0.000955877 0.00191745 0.00105952 0.00113046 0.00137591 0.00272185 0.000803429 0.00013475 0.000106556 3.83757e-05 0.000144552 2.34423e-06 5.31096e-06 0 1.16516e-06 1.63871e-07 6.65742e-05 1.83647e-05 6.33508e-05 2.91544e-05 9.76508e-05 5.84239e-05 8.47887e-05 0.000191099 0.00209794 0.000579039 0.00108595 0.00104928 0.00141806 0.000701404 0.000631547 0.000343713 0.00118835 0.0013057 0.00261688 0.00260264 0.00259128 0.00257972 0.00256504 0.00255321 0.00254141 0.00252675 0.00251504 0.00250337
# CA_NET 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000102287 6.9419e-05 8.84546e-05 8.3358e-05 0.000232765 0.000663356 0.000687597 0.000639282 0.000722762 0.00120735 0.00255419 0.00224402 0.00375889 0.00470897 0.0213431 0.0154997 0.0537107 0.103107 0.0486743 0.0339437 0.0450388 0.0461594 0.0440353 0.0420509 0.0359149 0.016828 0.0151772 0.00990458 0.0155079 0.0158214 0.00206995 0.00133774 0.0010807 5.04507e-05 1.0092e-05 0.000105809 5.26777e-06 1.17775e-05 1.14329e-05 5.05178e-06 0 0 0 0 0 0 3.5199e-07 0 0 0 0 0 3.76267e-06 0 0 0 5.49552e-08 6.15477e-08 3.18074e-06 3.16321e-06 3.14933e-06 3.1353e-06 3.11746e-06 3.10302e-06 3.08858e-06 3.07064e-06 3.05633e-06 3.04207e-06
# NoCA_OR_WA_Rec 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.52181e-05 9.06353e-05 0.000104375 0.000139609 0.000174689 0.000209228 0.000243504 0.000277826 0.000311892 0.00036852 0.000361311 0.000315105 0.000452669 0.000416788 0.000219832 0.000208393 0.000170155 0.000227631 0.000393841 0.000310922 0.000615512 0.000789581 0.000953089 0.00108235 0.000938192 0.000795155 0.000982028 0.00115871 0.00127864 0.00145726 0.00196461 0.00152623 0.00136953 0.000816584 0.00110835 0.000891001 0.00114131 0.00105577 0.00153162 0.00143812 0.00159242 0.00149777 0.00181282 0.00156634 0.00175746 0.00237518 0.00285241 0.00265086 0.00292958 0.00274203 0.00329658 0.00387344 0.00221383 0.0022638 0.00713068 0.00430942 0.00653762 0.00900282 0.0179678 0.00808432 0.0250134 0.0125495 0.0133338 0.0119133 0.0104292 0.00831679 0.00586228 0.00316365 0.00221423 0.00856892 0.000135462 0.00255815 0.00487508 0.00684763 0.00062023 1.03625e-06 1.11106e-07 4.42255e-05 4.01523e-06 3.24465e-06 1.00306e-06 1.25552e-07 2.70396e-07 1.27442e-06 1.76629e-06 2.49922e-06 7.38957e-07 1.91937e-06 2.36596e-07 2.58623e-06 1.21068e-06 3.62531e-06 1.64316e-06 6.9735e-06 3.68251e-05 0.00520268 0.00220112 0.00651134 0.00710619 0.00629878 0.00626467 0.00623731 0.0062094 0.00617408 0.00614566 0.00611732 0.00608211 0.00605402 0.006026
# SoCA_Rec 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.15785e-06 1.23357e-05 1.85395e-05 2.47858e-05 3.10145e-05 3.71379e-05 4.32469e-05 4.93679e-05 4.9282e-05 9.92407e-05 8.41383e-05 7.2269e-05 4.69925e-05 4.32034e-05 2.27454e-05 2.15154e-05 1.75602e-05 2.34455e-05 4.04659e-05 0.000147273 0.000428264 0.00054766 0.000465049 0.000388562 0.000611758 0.000655723 0.00134234 0.00197472 0.00229143 0.00149622 0.00111347 0.000702553 0.00084067 0.000914718 0.000880823 0.000732146 0.000929971 0.0011424 0.00192408 0.00232006 0.00258079 0.00293989 0.00428052 0.00368817 0.00447403 0.00555557 0.00685312 0.0064825 0.00607316 0.005362 0.00475234 0.00756622 0.00472096 0.0057004 0.00609969 0.00195717 0.000666399 0.00938288 0.00555628 0.000132104 0.00148972 0.00469825 0.00187575 0.00161608 0.00128947 0.000872853 0.00133622 0.000610049 0.000885703 7.73901e-05 0.000577487 0.000589795 0.000803169 0.000123526 0.000388398 1.5544e-05 0.000403743 0.000555336 0.000114409 0.000521768 0.000263414 0.000217107 0.000301845 0.000522378 0.000575437 0.000463916 0.000480419 0.000293475 0.000247587 0.000120965 9.84161e-05 0.000308982 9.83236e-05 0.000254221 0.000274982 0.00262568 0.00280493 0.00298658 0.00273068 0.0050466 0.00501897 0.00499676 0.0049745 0.00494665 0.00492436 0.00490212 0.00487438 0.00485221 0.00483007
# TWL_discard 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00374037 0.00557955 0.00544533 0.0029166 0.0011062 0.000152824 0.00048229 0.00120361 0.00316937 0.00448965 0.00716453 0.00628623 0.00834686 0.00950371 0.0122633 0.0104537 0.0265177 0.0263713 0.026253 0.0261358 0.0259905 0.0258747 0.0257589 0.0256141 0.0254982 0.0253824
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
           -15             0      -5.10716             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CA_TWL(3)
           -15             0      -12.7055             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NoCA_OR_WA_Rec(6)
           -15             3      0.783714             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_WCGBT_Survey(9)
           -15             3      0.115904             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial_Survey(10)
           -15             0      -3.97838             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CalCOFI_Survey(11)
             0             1      0.290881           0.1             1             0          1          0          0          0          0          0          0          0  #  Q_extraSD_CalCOFI_Survey(11)
           -15             0      -5.11132             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RREAS_YOY_Survey(12)
             0             3       1.24086           0.1             1             0          1          0          0          0          0          0          0          0  #  Q_extraSD_RREAS_YOY_Survey(12)
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
 24 0 0 0 # 9 WCGBT_Survey
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
            10            59       41.2416            30            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_peak_NoCA_HKL(1)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NoCA_HKL(1)
          0.01            12        4.4206             3            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_ascend_se_NoCA_HKL(1)
          0.01            12       5.10416             5            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_descend_se_NoCA_HKL(1)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NoCA_HKL(1)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NoCA_HKL(1)
# 2   SoCA_HKL LenSelex
           8.5          59.5       24.2827            30            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_peak_SoCA_HKL(2)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_SoCA_HKL(2)
           0.5            15       1.42739             3            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_SoCA_HKL(2)
           0.5            20       5.81705            10            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_descend_se_SoCA_HKL(2)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_SoCA_HKL(2)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_SoCA_HKL(2)
# 3   CA_TWL LenSelex
            10            59       44.7841            30            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_peak_CA_TWL(3)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_CA_TWL(3)
          0.01            12       4.50355             3            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_ascend_se_CA_TWL(3)
          0.01            20       2.98893            15            99             0          3          0          0          0          0          0          3          2  #  Size_DblN_descend_se_CA_TWL(3)
           -10            10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_CA_TWL(3)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_CA_TWL(3)
# 4   OR_WA_Comm LenSelex
            10            59        42.305            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_OR_WA_Comm(4)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_OR_WA_Comm(4)
          0.01            12       4.50784             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_OR_WA_Comm(4)
          0.01            20            10            10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_OR_WA_Comm(4)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_OR_WA_Comm(4)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_OR_WA_Comm(4)
# 5   CA_NET LenSelex
            10            59       45.9007            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_CA_NET(5)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_CA_NET(5)
          0.01            12       4.30787             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_CA_NET(5)
          0.01            12        3.6629             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_CA_NET(5)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_CA_NET(5)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_CA_NET(5)
# 6   NoCA_OR_WA_Rec LenSelex
            10            59       43.6141            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_NoCA_OR_WA_Rec(6)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NoCA_OR_WA_Rec(6)
          0.01            12       5.09151             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NoCA_OR_WA_Rec(6)
          0.01            12       4.37659             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NoCA_OR_WA_Rec(6)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NoCA_OR_WA_Rec(6)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NoCA_OR_WA_Rec(6)
# 7   SoCA_Rec LenSelex
           8.5            50       24.6738            30            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_peak_SoCA_Rec(7)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_SoCA_Rec(7)
           0.5            10       2.91911             3            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_SoCA_Rec(7)
          0.01             8       3.33464             5            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_descend_se_SoCA_Rec(7)
           -11           -10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_SoCA_Rec(7)
           -12            12      -1.06421           -10            99             0          3          0          0          0          0          0          2          2  #  Size_DblN_end_logit_SoCA_Rec(7)
# 8   TWL_discard LenSelex
            10            50        29.598            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_TWL_discard(8)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_TWL_discard(8)
           0.5             8        4.1852             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_TWL_discard(8)
          0.01             8         3.194             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_TWL_discard(8)
           -11           -10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_TWL_discard(8)
           -11           -10           -10           -10            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_TWL_discard(8)
# 9   WCGBT_Survey LenSelex
            10            59       10.5108            30            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_peak_WCGBT_Survey(9)
           -10            10            -6            -6            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_WCGBT_Survey(9)
          0.01            12      0.227485             3            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_WCGBT_Survey(9)
          0.01            12       11.8389             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_WCGBT_Survey(9)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_start_logit_WCGBT_Survey(9)
         -1000          -998          -999          -999            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_WCGBT_Survey(9)
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
            10          59.5       50.2233            30            99             0      3  # Size_DblN_peak_NoCA_HKL(1)_BLK1repl_1875
           0.5            10        4.0476             4            99             0      3  # Size_DblN_ascend_se_NoCA_HKL(1)_BLK1repl_1875
           0.5            10            10             4            99             0      -3  # Size_DblN_descend_se_NoCA_HKL(1)_BLK1repl_1875
           8.5          59.5       47.4492            30            99             0      3  # Size_DblN_peak_SoCA_HKL(2)_BLK2repl_1875
           0.5            15       4.71468             4            99             0      3  # Size_DblN_ascend_se_SoCA_HKL(2)_BLK2repl_1875
           0.5            15            10            10            99             0      -3  # Size_DblN_descend_se_SoCA_HKL(2)_BLK2repl_1875
            10            59       33.6937            30            99             0      3  # Size_DblN_peak_CA_TWL(3)_BLK3repl_1875
          0.01            12       3.25562             4            99             0      3  # Size_DblN_ascend_se_CA_TWL(3)_BLK3repl_1875
          0.01            20            19            19            99             0      -3  # Size_DblN_descend_se_CA_TWL(3)_BLK3repl_1875
           8.5            50        30.639            30            99             0      3  # Size_DblN_peak_SoCA_Rec(7)_BLK2repl_1875
           0.5            10       3.73766             4            99             0      3  # Size_DblN_ascend_se_SoCA_Rec(7)_BLK2repl_1875
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
      4      1    0.5354
      4      2   2.47932
      4      3  0.249441
      4      4  0.090606
      4      5  0.407265
      4      6  0.367387
      4      7  0.171849
      4      8  0.020586
      4      9  0.035178
      4     10  0.058722
      5      1  0.030076
      5      3  0.016183
      5      4         1
      5      5  0.063589
      5      6         1
      5      9   0.09316
      5     10  0.115543
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

