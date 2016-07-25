#Build a new age model for Marion Lake, using bacon
#Set working directory to location of bacon software
setwd('C:/Jack/Datasets/AA_Software/Bacon/winBacon_2.2')
source('Bacon.R')

#Basic Bacon run, using Maarten's sample core 'MSB2k'
Bacon(core='MSB2k', thick=5)

#Now adding a prescribed hiatus at 50cm, with no specified length of hiatus.
#Bacon will use a default hiatus length of 1000 yrs
#setting ssize to 100 reduces the number of iterations and speeds up the run
Bacon(core='MSB2k',ssize=100, hiatus.depths=50) 

#Now setting the hiatus to be very short and setting prior of different accumulation
#rates above and below the hiatus.  This is how you set differential accumulation rates
#within a core
Bacon(core='MSB2k',ssize=100, hiatus.depths=50, hiatus.mean = 10, acc.mean=c(5,20)) 

#Now adding a prescribed hiatus at 20cm that's 10 years long.
#Also setting different priors for accumulation rates for above and below
#(this is way to set different sedimentation rates for different sections
#of core)
Bacon(core='MSB2k', thick=5, hiatus.depths = 20, hiatus.mean = 10, acc.mean = c(5,20))
