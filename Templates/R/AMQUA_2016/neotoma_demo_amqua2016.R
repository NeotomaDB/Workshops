#Neotoma Workshop
#AmQua, July 2, 2016
#Jack Williams, Simon Goring, and Eric Grimm
#
#This script is available at:  https://github.com/IceAgeEcologist/NeotomaWorkshops
#

++++++++++++++
#Install neotoma package from CRAN (this just needs to be done once)
install.packages("neotoma")
#Install analogue package from CRAN
install.packages("analogue")


#Add the neotoma package to your programming environment (we'll add analogue later)
library(neotoma)

#neotoma has three fundamental commands: get_site, get_dataset, get_download.
#The first two return metadata for sites and datasets; the latter returns data
#See Goring et al. 2015 Open Quaternary for a full description of the package
#and example code.  This exercise is partially based on those examples.
#We'll start with get_site

#Get Site Information
#get_site returns a data frame with metadata about sites
#Note use of % as wildcard operator
marion.meta.site <- get_site(sitename = 'Marion%')
#Let's take a look at what's stored in the data frame returned by get_dataset
#Turns out there's two sites in Neotoma with 'Marion.' 
marion.meta.site
 
#Other examples of searches with get_site
#Search by lat/lon bounding box.  This one roughly corresponds to Florida.
FL_sites<-get_site(loc=c(-88, -79, 25, 30)) 

#Search by Geopolitical name or Geopolitical ID (gpids) stored in Neotoma.  
#For list of names and gpids, go to http://api.neotomadb.org/apdx/geopol.htm
#get all sites in New Mexico (gpid=7956)
NM_sites<-get_site(gpid=7956)  
#get all sites in Wisconsin
WI_sites<-get_site(gpid="Wisconsin")

#Data frames store vectors of equal length.  The nice thing about data frames is
#that each vector can be of a different type (character, numeric values, etc.)
#In RStudio, you can use the Environment panel in upper right to explore variables
#Display the 'description' variable from the site metadata for Marion Lake (and the
#the Marion Landfill):
marion.meta.site$description 

#Get Dataset
#get_dataset returns a list of datasets containing the metadata for each dataset
#We can pass output from get_site to get_dataset
marion.meta.dataset  <- get_dataset(marion.meta.site)
#Let's look at the metadata returned for Marion Lake and Marion Landfill.  Both
#have a geochronology dataset, while one has a pollen dataset and the other a 
#vertebrate fauna dataset
marion.meta.dataset

#Get Download
#get_download returns a list which stores a list of download objects - one 
#for each retrieved dataset.  Each download object contains a suite of data for 
#the samples in that dataset
#Get all datasets for both Marion Site and Marion Landfill. get_download will accept
#an object of class dataset
marion.all.data <- get_download(marion.meta.site)
#Get all datasets for just Marion Lake:[this line needs debugging]
#marion.lake.data <- get_download(marion.meta.site$site.id[[1]])

#Within the download object, sample.meta stores the core depth and age information for that dataset
#We just want to look at the first few lines, so are  using the head function
#We're just looking at the first object (Marion Lake, not Marion Landfill)
head(marion.all.data[[1]]$sample.meta)

#taxon.list stores a list of taxa found  in the  dataset
head(marion.all.data[[1]]$taxon.list)

#counts stores the the counts, presence/absence data, or percentage data for each taxon for each sample
head(marion.all.data[[1]]$counts)

#lab.data stores any associated  laboratory measurements in the dataset
#For Marion Lake, this returns the Microsphere suspension used as a spike to calculate
#concentrations
head(marion.all.data[[1]]$lab.data)

#compile_taxa [fix code]
#The level of taxonomic resolution can vary among analysts.  Often for multi-site
#analyses it is helpful to aggregate to a common taxonomic resolution.
#the compile_taxa function in neotoma will do this, and neotoma includes a few pre-built taxonomic lists.
#marion.lake.aggreg<-compile_taxa(marion.lake.data, list.name="P.25")
#Make a quick plot of Alnus abundances at Marion Lake, using the analogue package 

#to calculate pollen percentages
#load analogue
library("analogue")

#Convert Marion Lake pollen data to percentages
marion.lake.pct <- tran(x = marion.all.data[[1]]$counts, method = 'percent')

#Build a quick plot of Alnus
#Build a new dataframe containing the pollen percentages and sample ages
alnus.df <- data.frame(alnus = marion.lake.pct[,"Alnus"],
                       ages  = marion.all.data[[1]]$sample.meta$age,
                       site = rep('Marion', length(marion.all.data[[1]]$sample.meta$age)))

#Plot the  data
plot(alnus ~ ages, data = alnus.df, col = alnus.df$site, pch = 19,
     xlab = 'Radiocarbon Years Before Present', ylab = 'Percent Alnus')

#Part III
#Build a new age model for Marion Lake, using bacon

#Set working directory to location of bacon software
setwd('C:/Jack/Datasets/AA_Software/Bacon/winBacon_2.2')
source('Bacon.R')

#Bacon uses text files as inputs.  We'll create these.
#Set working directory to where Bacon will look for input files
dir.create('C:/Jack/Datasets/AA_Software/Bacon/winBacon_2.2/Cores/Marion')
setwd('C:/Jack/Datasets/AA_Software/Bacon/winBacon_2.2/Cores/Marion')

#get the geochronological data for both Marion Lake and Marion Landfill
marion.geochron <- get_geochron(marion.meta.site, verbose = TRUE)

#RAN OUT OF TIME HERE - BELOW CODE NOT DONE YET

#Create dataframe to hold geochronology data for export
geochron.df <- data.frame(alnus = marion.lake.pct[,"Alnus "],
                       ages  = marion.lake.data[[1]]$sample.meta$age,
                       site = rep('Marion', length(marion.lake.data)))
write(x, file = "marion.csv",
      ncolumns = if(is.character(x)) 1 else 5,
      append = FALSE, sep = " ")