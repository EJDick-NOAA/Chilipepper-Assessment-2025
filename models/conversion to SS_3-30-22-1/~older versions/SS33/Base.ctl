#V3.30.08.02-safe;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: Base.dat // Base.ctl
#V3.30.08.02-safe;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
4 #_Nblock_Patterns
 5 10 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1970 1979 1980 1988 1989 1991 1992 1998 1999 2016
 1972 1977 1978 1980 1981 1983 1984 1986 1987 1989 1990 1992 1993 1995 1996 1998 1999 2001 2002 2006
 2003 2016
 1891 1891
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
2 #_Age(post-settlement)_for_L1;linear growth below this
18 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.05 0.3 0.16 0.22 0.8 6 -4 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 15 30 19.659 19.659 20 6 -4 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 25 70 47.3 47.3 20 6 -2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.3 0.1945 0.1945 0.8 6 -2 0 0 0 0 0.5 1 0 # VonBert_K_Fem_GP_1
 0.02 0.3 0.06 0.06 0.8 6 -2 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.02 0.3 0.06 0.06 0.8 6 -2 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 -3 3 4.05e-06 4.1e-06 100 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 -3 10 3.2 3.25 0.5 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 1 50 24.4 25 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -3 3 -0.27 -0.3 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 300 132.355 132.355 0.8 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 100 59 59 0.8 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 -6 3 0.232 0.1279 0.8 6 -4 0 0 0 0 0.5 0 0 # NatM_p_1_Mal_GP_1
 -6 3 -0.03 -0.03 0.8 6 -4 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.35 -0.35 0.8 6 -2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.605 0.605 0.8 6 -2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -3 3 0 0 0.8 6 -2 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -3 3 0 0 0.8 6 -2 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
 -3 3 2.24e-06 2.2e-06 100 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal
 -3 10 3.32 3.32 0.05 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 4 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_month_1
 1 1 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
# timevary MG parameters 
#_ LO HI INIT PRIOR PR_SD PR_type  PHASE
 -1.35841 0.43335 -0.127863 0 0.216675 6 4 # VonBert_K_Fem_GP_1_BLK1mult_1970
 -1.35841 0.43335 0.226566 0 0.216675 6 4 # VonBert_K_Fem_GP_1_BLK1mult_1980
 -1.35841 0.43335 0.137345 0 0.216675 6 4 # VonBert_K_Fem_GP_1_BLK1mult_1989
 -1.35841 0.43335 -0.0306157 0 0.216675 6 4 # VonBert_K_Fem_GP_1_BLK1mult_1992
 -1.35841 0.43335 0.125159 0 0.216675 6 4 # VonBert_K_Fem_GP_1_BLK1mult_1999
# info on dev vectors created for MGparms are reported with other devs after tag parameter section 
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             5            15       10.5955          10.5             5             6          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.57         0.573         0.183             6         -4          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             1             1             6         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             6         -3          0          0          0          0          0          0          0 # SR_regime
             0           0.5             0             0            99             0         -2          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1965 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
0 # (0/1) to read 13 advanced options
#_Cond 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
#_Cond -4 #_recdev_early_phase
#_Cond 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#_Cond 1 #_lambda for Fcast_recr_like occurring before endyr+1
#_Cond 892 #_last_early_yr_nobias_adj_in_MPD
#_Cond 1871 #_first_yr_fullbias_adj_in_MPD
#_Cond 2014 #_last_yr_fullbias_adj_in_MPD
#_Cond 2017 #_first_recent_yr_nobias_adj_in_MPD
#_Cond 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#_Cond 0 #_period of cycles in recruitment (N parms read below)
#_Cond -5 #min rec_dev
#_Cond 5 #max rec_dev
#_Cond 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F
#  0.26526 0.182989 0.75983 1.0102 0.664379 0.919702 -0.279913 -0.384851 1.57674 -0.679608 1.32434 -1.27781 -0.694678 -0.190281 0.834036 -0.657251 -1.10191 -2.26288 -0.790298 2.00337 -1.09829 0.45664 0.216675 0.733456 0.737916 -0.0822298 0.264335 -0.171017 0.838061 -0.477326 -0.567885 -0.60291 -0.945029 0.827838 2.65212 -1.24972 -0.0717862 -0.285923 0.184878 -1.36661 -1.81269 -1.63262 -0.487338 -0.608085 1.32761 0.971952 -0.505008 -0.248977 0.709725 1.07085 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.5 # F ballpark
2006 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2028 2037
# F rates by fleet
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# trawl 0.000284612 0.000259967 0.000261028 0.000235728 0.000236378 0.000210587 0.00021096 0.000184847 0.000211468 0.000211735 0.000238552 0.00026551 0.000292613 0.000293214 0.000320566 0.000348081 0.000375765 0.000403625 0.000458834 0.000514639 0.000571104 0.000600954 0.00065874 0.000717311 0.00134419 0.00209001 0.00247131 0.001732 0.00176577 0.00145871 0.00125116 0.00134561 0.000767299 0.000641383 0.00187714 0.00312476 0.00398436 0.00443489 0.00477757 0.00392117 0.00342373 0.00477974 0.0045503 0.00479174 0.0040582 0.00470619 0.00469858 0.00548174 0.00403788 0.00311597 0.00096793 0.00447407 0.0142679 0.0302292 0.0232423 0.0160153 0.0122116 0.0139896 0.0186592 0.032603 0.033027 0.0409829 0.0384902 0.040356 0.045942 0.0519876 0.0606457 0.0524078 0.0437802 0.0344314 0.0320275 0.0524298 0.0441845 0.0306085 0.0684773 0.103037 0.0604202 0.0287844 0.0344176 0.0299476 0.0439085 0.100346 0.118038 0.106645 0.112002 0.0898696 0.0615623 0.0924611 0.125323 0.108657 0.0829863 0.0959347 0.133105 0.112609 0.0966306 0.111264 0.126593 0.151298 0.152736 0.15507 0.100604 0.104208 0.108184 0.140755 0.142242 0.156085 0.117721 0.0896538 0.0582244 0.0461472 0.0257969 0.0012 0.00643675 0.00293765 0.00453749 0.00451584 0.0053659 0.0122911 0.0166172 0.0148636 0.014225 0.0182439 0.0134778 0.00784499 0.00343427 0.11159 0.111521 0.111733 0.112241 0.112341 0.11234 0.112297 0.112251 0.112217 0.112194 0.112179 0.112169
# hookline 0.00625948 0.00595662 0.00561586 0.00526809 0.00500667 0.00470975 0.00443979 0.00413575 0.00457621 0.00501898 0.00549547 0.00594382 0.00639523 0.00684983 0.00730754 0.00776861 0.00823313 0.00927279 0.0103561 0.0114533 0.0125338 0.0136624 0.0147759 0.01594 0.0103004 0.0164334 0.0165596 0.010609 0.0112267 0.00959567 0.00894942 0.011097 0.012112 0.0139112 0.0176872 0.013423 0.0121478 0.0111262 0.0128446 0.0151122 0.0101239 0.00551818 0.00643424 0.00695474 0.00463083 0.00293636 0.00238014 0.00240325 0.00318679 0.00324537 0.0016845 0.000899027 0.00122218 0.00204332 0.0020796 0.00336086 0.0022598 0.00217809 0.0024178 0.00226371 0.00155318 0.00087216 0.00146407 0.00137489 0.0015307 0.00134283 0.00142321 0.00135517 0.00198573 0.0017493 0.00172229 0.00754138 0.00557586 0.00238649 0.00272387 0.00286652 0.00236908 0.00216849 0.00200853 0.00255929 0.00400141 0.00370295 0.00586202 0.00484828 0.00724707 0.00628022 0.0123156 0.0141194 0.00568356 0.00813576 0.0215408 0.00506784 0.00648896 0.0206209 0.0298986 0.0197772 0.0364558 0.039305 0.0205311 0.0564961 0.106704 0.0949795 0.0561927 0.0383277 0.0315541 0.0441803 0.0290444 0.014537 0.00697761 0.00343578 0.000793831 2.40817e-05 0.000130031 0.000150587 0 0.000169315 0 2.62172e-05 8.40556e-06 3.60934e-05 6.42139e-05 5.30955e-05 5.06074e-05 6.47813e-05 1.94537e-05 0.000306233 0.000312245 0.00031498 0.000316025 0.000317493 0.000320203 0.000322603 0.000324233 0.00032528 0.000325992 0.000326525 0.000326961
# setnet 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00368457 0.00770163 0.00643311 0.00985068 0.0115325 0.0466302 0.0321448 0.111625 0.206636 0.10481 0.0747919 0.097196 0.0979165 0.0830035 0.0772269 0.0651654 0.0320932 0.0283761 0.0179968 0.0267799 0.0269805 0.00335215 0.0020006 0.00149895 0.000120752 1.27111e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# rec 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.35765e-05 0.000107384 0.000129628 0.000173011 0.000217065 0.000260392 0.000303125 0.000345929 0.000380214 0.000506804 0.000478521 0.00041581 0.00051862 0.0004782 0.000253377 0.00024111 0.000197602 0.000264845 0.000464199 0.000541134 0.00128936 0.00167077 0.00174135 0.00178551 0.00201594 0.00196693 0.00338427 0.00477888 0.00563214 0.00459032 0.00468326 0.00346052 0.00363896 0.00310565 0.00355808 0.00299798 0.00400534 0.00447801 0.00701268 0.00761971 0.00843037 0.0088436 0.0119437 0.0102246 0.0120239 0.0150787 0.0187177 0.017975 0.0174721 0.0155572 0.0148281 0.0205998 0.0117148 0.0128276 0.0192215 0.00843715 0.00876291 0.0256959 0.0312441 0.0095636 0.0261506 0.0175061 0.0137102 0.0100971 0.00630064 0.00172639 0.00174103 0.000917706 0.00291888 0.00683633 0.000730142 0.0025714 0.00419929 0.00522922 0.000966787 1.24484e-06 0.000875014 0.000886167 0.00025268 0.00146855 0.000608434 0.000430222 0.000535079 0.000656223 0.000800635 0.000864782 0.000957048 0.000770356 0.000844891 0.00537788 0.00572851 0.00561271 0.00534748 0.00516631 0.00505321 0.00498208 0.00493473 0.00490021 0.00487241 0.00484813 0.00482601
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         1         0         0         0         1  #  trawl
         5         1         0         0         0         1  #  triennial
         6         1         0         0         0         1  #  combined
         8         1         0         0         0         1  #  juvenile
        10         1         0         0         0         1  #  ghost
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15         -4.82             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_trawl(1)
           -15            15      -2.76507             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_triennial(5)
           -15            15       1.02873             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_combined(6)
           -15            15      -4.78075             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_juvenile(8)
           -15            15      -9.78038             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ghost(10)
#_no timevary Q parameters
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
 1 0 1 0 # 1 trawl
 1 0 1 0 # 2 hookline
 24 0 0 0 # 3 setnet
 24 0 0 0 # 4 rec
 1 0 0 0 # 5 triennial
 1 0 0 0 # 6 combined
 0 0 0 0 # 7 juv
 0 0 0 0 # 8 juvenile
 0 0 0 0 # 9 juv2
 24 0 0 0 # 10 ghost
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
 10 0 0 0 # 1 trawl
 10 0 0 0 # 2 hookline
 10 0 0 0 # 3 setnet
 10 0 0 0 # 4 rec
 10 0 0 0 # 5 triennial
 10 0 0 0 # 6 combined
 11 0 0 0 # 7 juv
 11 0 0 0 # 8 juvenile
 10 0 0 0 # 9 juv2
 20 0 1 0 # 10 ghost
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
             5            50       32.4999            30           100             6          2          0          0          0          0          0          0          0  #  SizeSel_P1_trawl(1)
        0.0001            35       7.97291             5            10             6          3          0          0          0          0          0          0          0  #  SizeSel_P2_trawl(1)
             1            60            10            11           100             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleDogleg_trawl(1)
           -10            10             0             0            10             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleatZero_trawl(1)
           -10            10             0             0            10             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleatDogleg_trawl(1)
           -10            10             0             0            10             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleatMaxage_trawl(1)
             5            45       35.9934            40            10             6          2          0          0          0          0          0          0          0  #  SizeSel_P1_hookline(2)
        0.0001            35       6.47209             5            10             6          2          0          0          0          0          0          0          0  #  SizeSel_P2_hookline(2)
             1            60            16            20            10             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleDogleg_hookline(2)
           -10            10             0             0            10             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleatZero_hookline(2)
           -10            10             0             0            10             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleatDogleg_hookline(2)
           -10            10             0             0            10             6         -5          0          0          0          0        0.5          0          0  #  SzSel_MaleatMaxage_hookline(2)
            19            51       50.9996            50           100             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_setnet(3)
            -6             6      -5.57246         -0.75            10             6          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_setnet(3)
            -1             9       4.41322           3.5            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P3_setnet(3)
            -1             9       4.71138             5            10             6          4          0          0          0          0        0.5          0          0  #  SizeSel_P4_setnet(3)
           -50             9        -20.34          -4.5            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P5_setnet(3)
           -50             9      -20.5042           2.9            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P6_setnet(3)
            19            51       40.7558            32            10             6          2          0          0          0          0        0.5          3          0  #  SizeSel_P1_rec(4)
           -20             4      -11.0926         -0.75            10             6          2          0          0          0          0        0.5          3          0  #  SizeSel_P2_rec(4)
           -10             9       4.85561           3.5            10             6          2          0          0          0          0        0.5          3          0  #  SizeSel_P3_rec(4)
           -10             9       3.09674             5            10             6          2          0          0          0          0        0.5          3          0  #  SizeSel_P4_rec(4)
           -10             9      -8.45394          -4.5            10             6          2          0          0          0          0        0.5          3          0  #  SizeSel_P5_rec(4)
           -10             9     -0.259023           2.9            10             6          2          0          0          0          0        0.5          3          0  #  SizeSel_P6_rec(4)
             5            35          15.7          25.7            10             6         -2          0          0          0          0          0          0          0  #  SizeSel_P1_triennial(5)
        0.0001            35        0.0002             5            10             6         -2          0          0          0          0          0          0          0  #  SizeSel_P2_triennial(5)
             5            35       13.1105            15           100             6          2          0          0          0          0          0          0          0  #  SizeSel_P1_combined(6)
        0.0001            35       13.0341             5            10             6          2          0          0          0          0          0          0          0  #  SizeSel_P2_combined(6)
            19            51         38.74            32           100             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P1_ghost(10)
            -6             4      -5.15161         -0.75            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P2_ghost(10)
            -1             9       3.69324           3.5            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P3_ghost(10)
            -1             9       3.36357             5            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P4_ghost(10)
           -10             9      -7.48866          -4.5            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P5_ghost(10)
           -10             9     -0.967046           2.9            10             6          2          0          0          0          0        0.5          0          0  #  SizeSel_P6_ghost(10)
             0             0             0             0            10             6         -3          0          0          0          0          0          0          0  #  AgeSel_P1_juv(7)
             0             0             0             0            10             6         -3          0          0          0          0          0          0          0  #  AgeSel_P2_juv(7)
             0             0             0             0            10             6         -3          0          0          0          0          0          0          0  #  AgeSel_P1_juvenile(8)
             0             0             0             0            10             6         -3          0          0          0          0          0          0          0  #  AgeSel_P2_juvenile(8)
             1            10         1.113             1             1             6         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_ghost(10)
           -60            60         -59.9           -23             1             6         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_ghost(10)
           -40            20         -24.8           -20             1             6         -2          0          0          0          0        0.5          0          0  #  AgeSel_P3_ghost(10)
           -40            10         -0.12             0             1             6         -3          0          0          0          0        0.5          0          0  #  AgeSel_P4_ghost(10)
           -40            10         -33.5           -17             1             6         -2          0          0          0          0        0.5          0          0  #  AgeSel_P5_ghost(10)
           -40            20         -4.11          -4.5             1             6         -2          0          0          0          0        0.5          0          0  #  AgeSel_P6_ghost(10)
             1            60             2             2             1             6         -5          0          0          0          0        0.5          0          0  #  AgeSel_10MaleDogleg_ghost
           -10            10             0             0             1             6         -5          0          0          0          0        0.5          0          0  #  AgeSel_10MaleatZero_ghost
           -10            10             0             0             1             6         -5          0          0          0          0        0.5          0          0  #  AgeSel_10MaleatDogleg_ghost
           -10            10             0             0             1             6         -5          0          0          0          0        0.5          0          0  #  AgeSel_10MaleatMaxage_ghost
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -3             2     -0.585058             0            99            -1      4  # SizeSel_P1_rec(4)_BLK3mult_2003
            -3             2  -0.000387143             0            99            -1      4  # SizeSel_P2_rec(4)_BLK3mult_2003
            -3             2      -1.29333             0            99            -1      4  # SizeSel_P3_rec(4)_BLK3mult_2003
            -3             2     -0.148688             0            99            -1      4  # SizeSel_P4_rec(4)_BLK3mult_2003
            -3             2      -1.16805             0            99            -1      4  # SizeSel_P5_rec(4)_BLK3mult_2003
            -3             5       1.98855             0            99            -1      4  # SizeSel_P6_rec(4)_BLK3mult_2003
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      1     4     1     1     0     0     0     0     0     0     0     0
#      5    19     6     3     0     0     0     0     0     0     0     0
#      5    20     7     3     0     0     0     0     0     0     0     0
#      5    21     8     3     0     0     0     0     0     0     0     0
#      5    22     9     3     0     0     0     0     0     0     0     0
#      5    23    10     3     0     0     0     0     0     0     0     0
#      5    24    11     3     0     0     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
      1      1  0.036251
      4      1      0.69
      4      2      0.75
      4      3      0.73
      1      4   0.19632
      1      5 -0.049828
      4      5      0.69
      1      6      0.01
      4      6      0.96
      5      6      0.75
      1      8      0.64
      4     10       2.5
 -9999   1    0  # terminator
#
6 #_maxlambdaphase
0 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 56 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 1 1 1 1 1
 1 2 1 0 1
 1 3 1 0 1
 1 4 1 0 1
 1 5 1 1 1
 1 6 1 1 1
 1 7 1 0 1
 1 8 1 1 1
 1 9 1 0 1
 1 10 1 1 1
 4 1 1 0.1 1
 4 2 1 0.1 1
 4 3 1 0.1 1
 4 4 1 1 1
 4 5 1 0.1 1
 4 6 1 0.1 1
 4 7 1 0 1
 4 8 1 0 1
 4 9 1 0 1
 4 10 1 1 1
 5 1 1 1 1
 5 2 1 1 1
 5 3 1 1 1
 5 4 1 0 1
 5 5 1 1 1
 5 6 1 1 1
 5 7 1 0 1
 5 8 1 0 1
 5 9 1 0 1
 5 10 1 0 1
 9 1 1 0 1
 9 2 1 0 1
 9 3 1 0 1
 9 4 1 0 1
 9 5 1 0 1
 9 6 1 0 1
 9 7 1 0 1
 9 8 1 0 1
 9 9 1 0 1
 9 10 1 0 1
 11 1 1 0 1
 11 2 1 0 1
 11 3 1 0 1
 11 4 1 0 1
 11 5 1 0 1
 11 6 1 0 1
 11 7 1 0 1
 11 8 1 0 1
 11 9 1 0 1
 11 10 1 0 1
 12 1 1 1 1
 13 1 1 100 1
 17 1 1 0 1
 17 2 1 0 1
 17 3 1 0 1
 17 4 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 1 1 1 1 1 #_CPUE/survey:_1
#  0 0 0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 1 #_CPUE/survey:_6
#  0 0 0 0 0 0 #_CPUE/survey:_7
#  1 1 1 1 1 1 #_CPUE/survey:_8
#  0 0 0 0 0 0 #_CPUE/survey:_9
#  1 1 1 1 1 1 #_CPUE/survey:_10
#  0.1 0.1 0.1 0.1 0.1 0.1 #_lencomp:_1
#  0.1 0.1 0.1 0.1 0.1 0.1 #_lencomp:_2
#  0.1 0.1 0.1 0.1 0.1 0.1 #_lencomp:_3
#  1 1 1 1 1 1 #_lencomp:_4
#  0.1 0.1 0.1 0.1 0.1 0.1 #_lencomp:_5
#  0.1 0.1 0.1 0.1 0.1 0.1 #_lencomp:_6
#  0 0 0 0 0 0 #_lencomp:_7
#  0 0 0 0 0 0 #_lencomp:_8
#  0 0 0 0 0 0 #_lencomp:_9
#  1 1 1 1 1 1 #_lencomp:_10
#  1 1 1 1 1 1 #_agecomp:_1
#  1 1 1 1 1 1 #_agecomp:_2
#  1 1 1 1 1 1 #_agecomp:_3
#  0 0 0 0 0 0 #_agecomp:_4
#  1 1 1 1 1 1 #_agecomp:_5
#  1 1 1 1 1 1 #_agecomp:_6
#  0 0 0 0 0 0 #_agecomp:_7
#  0 0 0 0 0 0 #_agecomp:_8
#  0 0 0 0 0 0 #_agecomp:_9
#  0 0 0 0 0 0 #_agecomp:_10
#  0 0 0 0 0 0 #_init_equ_catch
#  1 1 1 1 1 1 #_recruitments
#  0 0 0 0 0 0 #_parameter-priors
#  1 1 1 1 1 1 #_parameter-dev-vectors
#  100 100 100 100 100 100 #_crashPenLambda
#  0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

