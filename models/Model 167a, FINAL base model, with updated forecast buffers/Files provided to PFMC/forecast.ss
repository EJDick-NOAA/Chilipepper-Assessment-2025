1 # Benchmarks
2 # Do_MSY
0.5 # SPR target
0.4 # Biomass target
#_Bmark_years
 0 0 0 0 0 0 0 0 0 0
2 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below
#
1 # Forecast
12 # N forecast years 
1 # Fmult
-12345 #  Invoke New Forecast Format
#_MG_type method st_year end_year
        10      1       0        0
        11      1      -3        0
        12      1    -999        0
-9999 0 0 0
3 # Control rule method  
0.40 # Control rule inflection
0.10 # Control rule cutoff
-1 #_Flimitfraction
 #get_buffer(2025:2036, 0.5, 0.45, verbose = TRUE)
#year  buffer
 2025  1.000
 2026  1.000
 2027 0.933
 2028 0.926
 2029 0.920
 2030 0.914
 2031 0.907
 2032 0.901
 2033 0.895
 2034 0.889
 2035 0.883
 2036 0.877
-9999  0
3 #_N forecast loops 
3 #_First forecast loop with stochastic recruitment
0 #_Forecast recruitment
1 # value is ignored 
0 #_Forecast loop control #5 (reserved for future bells&whistles) 
2027  #FirstYear for caps and allocations
0 # stddev of log(realized catch/target catch) in forecast
0 # Do West Coast gfish rebuilder output: 0=no; 1=yes 
2025 # Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
2025 # Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
1 # fleet relative F:  1=use first-last alloc year; 2=read seas, fleet, alloc list below
2 # basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum); NOTE: same units for all fleets
# Conditional input if relative F choice = 2
# enter list of: fleet number, max annual catch for fleets with a max; terminate with fleet=-9999
-9999 -1
# enter list of area ID and max annual catch; terminate with area=-9999
-9999 -1
# enter list of fleet number and allocation group assignment, if any; terminate with fleet=-9999
-9999 -1
2 # basis for input Fcast catch: -1=read basis with each obs; 2=dead catch; 3=retained catch; 99=input apical_F; NOTE: bio vs num based on fleet's catchunits
 #_year seas fleet catch_or_F
   2025    1     1          63.35
   2025    1     2          2.11
   2025    1     3          1204.50
   2025    1     4          27.95
   2025    1     5          0.001
   2025    1     6          150.19
   2025    1     7          36.0
   2025    1     8          114.62
   2026    1     1          63.35
   2026    1     2          2.11
   2026    1     3          1133.95
   2026    1     4          27.95
   2026    1     5          0.001
   2026    1     6          150.19
   2026    1     7          36.0
   2026    1     8          108.06
-9999 0 0 0
#
999 # verify end of input 
