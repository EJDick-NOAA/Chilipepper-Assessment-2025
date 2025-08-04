##
##  SS3 Version 3.20
##

# for all year entries except rebuilder; enter either: actual year, -999 for styr, 0 for endyr, neg number for rel. endyr
1 		# Benchmarks: 0=skip; 1=F(SPR); 2=F(MSY);3=F(Btarget); 4=F(endyr); 5=Ave recent F (not implemented); 6= read Fmult (not implemented)
2		# MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt); 4=set to F(endyr)
0.5 	# SPR target (e.g. 0.40), 0.5 for west coast groundfish
0.4 	# Biomass target (e.g. 0.40)

#_Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF (enter actual year, or values of 0 or -integer to be rel. endyr)
0 0 0 0 0 0
2 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below

1	# Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt); 4=F(endyr); 5=Ave F (enter yrs); 6=read Fmult
12	# N foreast year
1	# F scaler (only used for Do_Forecast==5)

#_Fcast_years:  beg_selex, end_selex, beg_relF, end_relF  (enter actual year, or values of 0 or -integer to be rel. endyr)
0 0 -10 0

1		# Control rule method (1=catch=f(SSB) west coast; 2=F=f(SSB) )
0.4	# Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40)
0.1 	# Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10)
0.956	# Control rule target as fraction of Flimit (e.g. 0.75)

3		#_N forecast loops (1-3) (fixed at 3 for now)
3		#_First forecast loop with stochastic recruitment
0		#_Forecast loop control #3 (reserved for future bells&whistles)
0		#_Forecast loop control #4 (reserved for future bells&whistles)
0		#_Forecast loop control #5 (reserved for future bells&whistles)


2029	#FirstYear for caps and allocations (should be after years with fixed inputs)
0.0		# stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error) (if=0, there will be N_forecase_years less parameters estimated)
0		# Do West Coast gfish rebuilder output (0/1)
-1		# Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
-1		# Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
1		# fleet relative F:  1=use first-last alloc year; 2=read seas(row) x fleet(col) below
# Note that fleet allocation is used directly as average F if Do_Forecast=4
2		# basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum)
# Conditional input if relative F choice = 2
# Fleet relative F:  rows are seasons, columns are fleets
# max totalcatch by fleet (-1 to have no max) must enter value for each fleet
-1 -1 -1 -1
# max totalcatch by area (-1 to have no max); must enter value for each fleet
-1
# fleet assignment to allocation group (enter group ID# for each fleet, 0 for not included in an alloc group)
0 0 0 0
#_Conditional on >1 allocation group
# allocation fraction for each of: 0 allocation groups
# no allocation groups
48		# Number of forecast catch levels to input (else calc catch from forecast F)
2		# basis for input Fcast catch:  2=dead catch; 3=retained catch; 99=input Hrate(F) (units are from fleetunits; note new codes in SSV3.20)
# Input fixed catch values
#year	season	fishery	ACL
#year	season	fishery	ACL
2017	1	1	2975.611271
2017	1	2	6.768961154
2017	1	3	0
2017	1	4	50.62976782
2018	1	1	2819.080703
2018	1	2	6.41288328
2018	1	3	0
2018	1	4	47.96641377
2019	1	1	2696.505152
2019	1	2	6.134046742
2019	1	3	0
2019	1	4	45.8808014
2020	1	1	2572.428556
2020	1	2	5.851795607
2020	1	3	0
2020	1	4	43.76964887
2021	1	1	2456.190751
2021	1	2	5.587376262
2021	1	3	0
2021	1	4	41.7918727
2022	1	1	2361.75244
2022	1	2	5.372546703
2022	1	3	0
2022	1	4	40.18501303
2023	1	1	2288.68195
2023	1	2	5.206324954
2023	1	3	0
2023	1	4	38.94172497
2024	1	1	2231.063396
2024	1	2	5.075253481
2024	1	3	0
2024	1	4	37.96135027
2025	1	1	2183.726512
2025	1	2	4.96757089
2025	1	3	0
2025	1	4	37.15591729
2026	1	1	2143.335641
2026	1	2	4.875689184
2026	1	3	0
2026	1	4	36.46867012
2027	1	1	2107.909011
2027	1	2	4.795100203
2027	1	3	0
2027	1	4	35.86588908
2028	1	1	2076.338007
2028	1	2	4.723282052
2028	1	3	0
2028	1	4	35.32871118
999	# verify end of input
