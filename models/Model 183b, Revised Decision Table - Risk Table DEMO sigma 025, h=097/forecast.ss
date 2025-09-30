# for all year entries except rebuilder; enter either: actual year, -999 for styr, 0 for endyr, neg number for rel. endyr
1 # Benchmarks: 0=skip; 1=calc F_spr,F_btgt,F_msy; 2=calc F_spr,F0.1,F_msy; 3=add F_Blimit; 
2 # Do_MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt) or F0.1; 4=set to F(endyr); 5=calc F(MEY) with MSY_unit options
# if Do_MSY=5, enter MSY_Units; then list fleet_ID, cost/F, price/mt, include_in_Fmey_scaling; # -fleet_ID to fill; -9999 to terminate
0.5 # SPR target (e.g. 0.40)
0.4 # Biomass target (e.g. 0.40)
#_Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF, beg_recr_dist, end_recr_dist, beg_SRparm, end_SRparm (enter actual year, or values of 0 or -integer to be rel. endyr)
 0 0 0 0 0 0 0 0 0 0
# value <0 convert to endyr-value; except -999 converts to start_yr; must be >=start_yr and <=endyr
2 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below
#
1 # Forecast: -1=none; 0=simple_1yr; 1=F(SPR); 2=F(MSY); 3=F(Btgt) or F0.1; 4=Ave F (uses first-last relF yrs); 5=input annual F scalar
# where none and simple require no input after this line; simple sets forecast F same as end year F
12 # N forecast years 
1 # Fmult (only used for Do_Forecast==5) such that apical_F(f)=Fmult*relF(f)
-12345 #  Invoke New Forecast Format
# biology and selectivity vectors are updated annually in the forecast according to timevary parameters, so check end year of blocks and dev vectors
# input in this section directs creation of averages over historical years to override any time_vary changes
#_Types implemented so far: 1=M, 4=recr_dist, 5=migration, 10=selectivity, 11=rel. F, recruitment
#_list: type, method (1, 2), start year, end year
#_Terminate with -9999 for type
#_ year input can be actual year, or values <=0 to be rel. styr or endyr
#_Method = 0 (or omitted) means continue using time_vary parms; 1 means to use average of derived factor
#_MG_type method st_year end_year
        10      1       0        0
        11      1      -3        0
        12      1    -999        0
-9999 0 0 0
3 # Control rule method (0: none; 1: ramp does catch=f(SSB), buffer on F; 2: ramp does F=f(SSB), buffer on F; 3: ramp does catch=f(SSB), buffer on catch; 4: ramp does F=f(SSB), buffer on catch) 
# values for top, bottom and buffer exist, but not used when Policy=0
0.40 # Control rule inflection for constant F (as frac of Bzero, e.g. 0.40); must be > control rule cutoff, or set to -1 to use Bmsy/SSB_unf 
0.10 # Control rule cutoff for no F (as frac of Bzero, e.g. 0.10) 
-1 #_Flimitfraction
# buffers from O. Hamel (see email dated 8/13/2025)
# time-varying buffers based upon a geometric mean M (across male and female M) of 0.21
# the resulting annual increase in sigma is 0.0546 rather than 0.0375 for a category 1 sigma
#year  buffer
 2025 1
 2026 1
 2027 1
 2028 1
 2029 1
 2030 1
 2031 1
 2032 1
 2033 1
 2034 1
 2035 1
 2036 1
-9999  0
3 #_N forecast loops (1=OFL only; 2=ABC; 3=get F from forecast ABC catch with allocations applied)
3 #_First forecast loop with stochastic recruitment
0 #_Forecast recruitment:  0= spawn_recr; 1=value*spawn_recr_fxn; 2=value*VirginRecr; 3=recent mean from yr range above (need to set phase to -1 in control to get constant recruitment in MCMC)
1 # value is ignored 
0 #_Forecast loop control #5 (reserved for future bells&whistles) 
2037  #FirstYear for caps and allocations (should be after years with fixed inputs) 
0 # stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error)
0 # Do West Coast gfish rebuilder output: 0=no; 1=yes 
2025 # Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
2025 # Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
1 # fleet relative F:  1=use first-last alloc year; 2=read seas, fleet, alloc list below
# Note that fleet allocation is used directly as average F if Do_Forecast=4 
2 # basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum); NOTE: same units for all fleets
# Conditional input if relative F choice = 2
# enter list of: fleet number, max annual catch for fleets with a max; terminate with fleet=-9999
-9999 -1
# enter list of area ID and max annual catch; terminate with area=-9999
-9999 -1
# enter list of fleet number and allocation group assignment, if any; terminate with fleet=-9999
-9999 -1
2 # basis for input Fcast catch: -1=read basis with each obs; 2=dead catch; 3=retained catch; 99=input apical_F; NOTE: bio vs num based on fleet's catchunits
#_year	seas	fleet	catch_or_F
2025	1	1	63.350
2025	1	2	2.110
2025	1	3	1204.500
2025	1	4	27.950
2025	1	5	0.001
2025	1	6	150.190
2025	1	7	36.000
2025	1	8	114.620
2026	1	1	63.350
2026	1	2	2.110
2026	1	3	1133.950
2026	1	4	27.950
2026	1	5	0.001
2026	1	6	150.190
2026	1	7	36.000
2026	1	8	108.060
2027	1	1	134.706
2027	1	2	4.487
2027	1	3	2486.220
2027	1	4	59.432
2027	1	5	0.002
2027	1	6	319.361
2027	1	7	76.550
2027	1	8	236.751
2028	1	1	129.384
2028	1	2	4.309
2028	1	3	2387.985
2028	1	4	57.084
2028	1	5	0.002
2028	1	6	306.743
2028	1	7	73.525
2028	1	8	227.397
2029	1	1	126.050
2029	1	2	4.198
2029	1	3	2326.450
2029	1	4	55.613
2029	1	5	0.002
2029	1	6	298.839
2029	1	7	71.631
2029	1	8	221.537
2030	1	1	123.827
2030	1	2	4.124
2030	1	3	2285.419
2030	1	4	54.632
2030	1	5	0.002
2030	1	6	293.568
2030	1	7	70.367
2030	1	8	217.630
2031	1	1	121.354
2031	1	2	4.042
2031	1	3	2239.779
2031	1	4	53.541
2031	1	5	0.002
2031	1	6	287.706
2031	1	7	68.962
2031	1	8	213.284
2032	1	1	117.941
2032	1	2	3.928
2032	1	3	2176.783
2032	1	4	52.035
2032	1	5	0.002
2032	1	6	279.613
2032	1	7	67.022
2032	1	8	207.285
2033	1	1	113.823
2033	1	2	3.791
2033	1	3	2100.784
2033	1	4	50.219
2033	1	5	0.002
2033	1	6	269.851
2033	1	7	64.682
2033	1	8	200.048
2034	1	1	109.529
2034	1	2	3.648
2034	1	3	2021.532
2034	1	4	48.324
2034	1	5	0.002
2034	1	6	259.671
2034	1	7	62.242
2034	1	8	192.501
2035	1	1	105.576
2035	1	2	3.516
2035	1	3	1948.568
2035	1	4	46.580
2035	1	5	0.002
2035	1	6	250.299
2035	1	7	59.996
2035	1	8	185.553
2036	1	1	101.940
2036	1	2	3.395
2036	1	3	1881.473
2036	1	4	44.976
2036	1	5	0.002
2036	1	6	241.680
2036	1	7	57.930
2036	1	8	179.164
-9999 0 0 0
#
999 # verify end of input 
#
999 # verify end of input 
