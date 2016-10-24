# SVP 2016
Jessica Blois, Edward Davis, Simon Goring, Jack Williams, Eric C. Grimm  

# Introduction

This workshop will provide 1) guidance on best practices in the archiving and analysis of paleovertebrate data and 2) training in the use of the Neotoma Paleoecology Database (www.neotomadb.org) to archive, access, and analyze paleoecological data. Neotoma is a multiproxy paleodatabase that stores multiple kinds of paleoecological & paleoenvironmental data, including vertebrate faunal data. One of the strengths of Neotoma is the ability to compare faunal data with other proxy data such as fossil pollen, diatoms, ostracodes, insects, charcoal, and geochemical data.  In addition, the database is structured to relate absolute dates to taxon occurrences and to allow the creation and storage of age models built on absolute dates from stratigraphic sections. Neotoma is a public-access, community-supported database that is emerging as the standard repository for Pliocene and Quaternary paleoecological data.

More teaching materials can be found [here](http://www.neotomadb.org/education/category/higher_ed/)

# Finding Data

## Explorer

### Getting Started
  1. Go to [http://www.neotomadb.org/](http://www.neotomadb.org/) and click on the 'Explorer' picture, or navigate directly to the [Explorer App](http://apps.neotomadb.org/Explorer/)
  2. Pan (by dragging), or change the zoom so that your window is centered on North America, including all of the lower 48 states and the southern half of Canada.

###	Tips and tricks
  1. Show/Hide Search Results
    a. You often accumulate many search layers - it may be getting a bit confusing.  Find the icon that lets you show/hide/combine search layers and use it to hide or delete some of your searches.
  2. Rename searches
    a. Searches from the "Basic" search window are automatically named, but not "Advanced" searches.  Add names for your searches as you go at the bottom of the Search dialog

### Search for Data

####	Finding sites
  1. **Find a known site**
    a. Using the Search dialog window (Advanced tab, Metadata subtab, Site Name field), find the classic Guilday site "New Paris #4". 
        i. *Note:* Search doesn't like the # symbol, so search for "New Paris", which should return two sites: New Paris #2, and New Paris #4
    b. Once you've performed the search, click on the point that appears.  A window will pop up with some information about this record.
    
    > QUESTION 1:  What is the latitude and longitude of New Paris #4?  What is the Site ID?
  
  2. **Explore sites by geography**
    a. Using the Search dialog window (Advanced tab), first choose "dataset type = vertebrate fauna" at the top
    b. Then, in the Space subtab, click "Search by extent"
    c. Click the "Extent" dropdown menu and search by shape, select the rectangle, then draw a rectangle on the map in your chosen region of North America
    
    > QUESTION 2:  How many total sites are found in that region?

  3. **Find all sites produced by a researcher**
    a. Search Window, Advanced Tab, Metadata subtab, Person Name field
    b. Find all sites produced by Ernie Lundelius
    
    > QUESTION 3:  In which states has Ernie worked?

####  Find a Taxon 
  1. **Search for a single taxon.**
    a. Search Window, Basic Tab, use Taxon field
    b. Find all sites with *Antilocapra* records
  
    > QUESTION 4:  How many sites have *Antilocapra* records?
  
  2. **Search for multiple taxa**
    a. The basic *Antilocapra* search indicates that we might need to build up the taxonomy.  Let's re-search for *Antilocapra*, but make sure we've included all relevant records.
    b. Search Window, Advanced tab, Taxa subtab
        i. *Note:* To do this, we will search for a "Taxa group".To the right of the "Taxon name" field, click on the gear symbol. Click on "Mammals" for the Taxa group, then search for *Antilocapra*. Then, click on all taxa you want to include here.  For example: Antilocapra americana, Antilocapra sp., Antilocapra, cf. Antilocapra americana, cf Antilocapra sp., Antilocapra cf A. americana, Antilocapridae ?Antilocapra sp., and ?Antilocapra sp. 
    
    > QUESTION 5:  What state has the easternmost location of *Antilocapra* in this search?  (For comparison, the eastern range limit of *Antilocapra* today is in western Iowa).
    
    c.  Add the modern species range onto the search: Click on the red polygon at the top, search for and select *Antilocapra americana*
  
  
####	Find all vertebrate records in North America 
  1. **Search window, Advanced Tab, Dataset type = "Vertebrate fauna"**
  
  > QUESTION 6:  The generation of fossil records is labor intensive and hence expensive - *e.g.* the costs of fieldwork, the money spent on radiocarbon dates, the time required for a trained analysis to identify specimens, etc. A rough time/cost estimate for a single vertebrate fossil record is on the order of two years and $30,000.  Given this, give an order-of-magnitude estimate of the number of person-years and dollars it took to generate these fossil vertebrate records now stored in Neotoma. (Order-of-magnitude = 10 person-years?  100 person-years? 1000? etc.)
  
    
####	Multi-Taxon Search
  1. **Find all sites with at least 20% *Picea* pollen between 15,000 and 12,000 years ago.**
    a. For *Picea*, first click on 'Dataset Type" = "pollen"
    b. Then use the 'Advanced Taxon Selection' which you can use by clicking on the gears icon to the right of the 'Taxon' field in the 'Search' window. 
        i. Enter 'Taxa group' = Vascular Plant, search for Picea,click the box next to Taxon to check all taxa, then uncheck taxa  like "Picea/Pinus" or "Picea/Abies".
    c. Then click the 'Abundance/density' box and select >20%.  
    d. Fill in the appropriate age range, and choose records that 'intersects result age range'. 
    e. Finally, click 'Search'
  2. **Find all sites with *Mammut* (mastodon) between 15,000 and 12,000 years ago.**
    a. For *Mammut*, use the 'Advanced Taxon Selection' which you can use by clicking on the gears icon to the right of the 'Taxon' field in the 'Search' window.
        i. In the 'Advanced Taxon Selection' window, choose 'Mammals' for Taxa Group and then enter *Mammut* into the 'Search for' window.Then click 'Go'
        ii. Note that the search returned taxon names for both *Mammut* (mastodon) and *Mammuthus* (mammoth).  Click all boxes for all variants of *Mammut* but do not click the *Mammuthus* boxes
        iii. Enter a search name (e.g. '*Mammut* - all') and click Save
        iv. In the general search window, click 'Search'
      
      > QUESTION 7:  Does mastodon tend to live in places with spruce, or without spruce?  Suggest two hypotheses that might explain the observed association (or lack of one).
      
####	Multi-Time Search
  1. Hide your previous searches.
  2. Find all sites with *Mammuthus* between 21,000 and 18,000 years ago.
  3. Find all sites with *Mammuthus* between 18,000 and 15,000 years ago.
  4. Find all sites with *Mammuthus*  between 15,000 and 13,000 years ago.
  5. Find all sites with *Mammuthus*  between 13,000 and 11,000 years ago.
  6.Find all sites with *Mammuthus*  between 11,000 and 8,000 years ago.
  
  > QUESTION 8:  Describe the history of *Mammuthus* distributions in North America over the last 21,000 years.   

### View Data
  1. Using the last *Mammuthus* search (between 11,000 - 8,000 years ago), click on the single site that appears (Fetterman Mammoth Locality).  
  2. In the popup window with metadata for Fetterman, note that the bottom includes a list of datasets available at the site.  (V = vertebrate; clock = geochronological data)
  3. Hold the mouse over the vertebrate dataset.  Note that an eyeball and '+' appear to the right.
  4. Click on the eyeball to view the Fetterman Mammoth Locality vertebrate dataset.  This opens up a new window with more detail about your dataset.
    a. Samples:  A data table.  Each row is a different variable, the first few columns show metadata associated with each specimen, and each subsequent column is a stratigraphic depth.  In this case, this is an assemblage so there is only one depth column. 
        i. Explore the specimens found at the site. 
    b. Site: General information about the site
    c. Chronology: There is no associated geochronological dataset, but the chronology tab indicates an age for the mammoth. 
    
    > QUESTION 9:  What other information would you want about this date to determine authenticity?
    > QUESTION 10:  What publications are listed for Fetterman?
    
  5. Now search for the site "Samwell Cave".  
    a. Notice that this site has multiple localities within it, and each locality has both a vertebrate dataset and a geochronological dataset.
    b. Explore the Samwell Cave Popcorn Dome datasets further.
    
    > QUESTION 11:  What is the difference between information in the "Chronology" tab of the Vertebrate dataset versus the information within the Geochronology dataset?


### Download Data
  1. In the popup window with metadata for Samwell Cave Popcorn Dome, hold the mouse over the vertebrate dataset.  Note that an eyeball and '+' appear to the right.  Click on the '+'.  This adds the dataset to a 'Datasets' tray.
  2. Find the icon for the 'Saved Datasets Tray' and click on it.
  3. Hover over the dataset then click on the Save icon to the right.  The dataset will be saved as a text file in CSV (comma separated value) format.
  4. Open the downloaded CSV file in Excel or a text editor (e.g. Notepad, Wordpad) to look at it.
  
  > QUESTION 12:  When was the last time *Aplodontia rufa* was seen at the site?

# Web API- Application Programming Interface

## What is a Web API?
  1. Set of protocols for building tools and applications that use a specific web service
  2. Often a structure for URL/URI formulation to make a query on a web database, such as Neotoma, iDigBio, or the Paleobiology Database. 
    + URL = Uniform Resource Locator, or web address. 
    + URI = Uniform Resource Identifier, or web address of a service, like an API.
  3. Calls are usually sent as URL “get” statements: values appended to a URL after a “?” that are processed as queries by a SQL or other web database.

For example, Google has APIs for most of its products. You could write an R (or Python, etc.) script that would connect to the Google Calendar API to allow you to automatically change events on your calendar or report agenda items back to you in your own custom environment. 

APIs exist for many important biological and paleobiological databases. We will work through examples from GeoLocate, the georeferencing service, iDigBio, the Paleobiology Database, and Neotoma. Different databases/services produce different kinds of API returns. The simplest kinds are comma delimited text files, but many APIs are now returning JSON documents. We will begin with text and move on to JSON.

## Example 1: Text returns from the Paleobiology database. 

The full documentation for the Paelobiology Database API is located at https://paleobiodb.org/data1.2/

The PaleoBioDB API uses calls to different URLs to return different kinds of data. We’ll try some calls to the occurrence APIs. In your web browser, try typing: https://paleobiodb.org/data1.2/occs/list.txt?base_name=Camelidae&interval=Pleistocene&show=loc,class

Note that this call is telling the API to search the base_name, “Camelidae”; the interval, “Pleistocene”; and to return the attributes “loc,class”. In this API, “base_name” searches for a taxonomic name at any level of the Linnaean hierarchy and returns any occurrences with that name, its synonyms, or its subtaxa. You should try changing to a name of interest to you and viewing the results. 

Similarly, *interval* returns occurrences that fall within the specific geologic interval. These intervals include North American Land Mammal Ages as well as the conventional Geologic Timescale. Try “Blancan” and “Burdigalian” to see what happens. Try an interval of interest to you.

You can search by taxonomy, age, environment, even by the specific locality or occurrence ID in the database. The list of potential calls is here: https://paleobiodb.org/data1.2/occs/list_doc.html 

You can narrow your results geographically by invoking “lngmin” and “lngmax” as well as “latmin” and “latmax”. Try for a few minutes to explore the data with different calls, using the call list.

## Example 2: JSON returns from iDigBio
iDigBio (Integrated Digitized Biocollections) is the central resource for searching digital specimen data liberated by the NSF’s Advancing the Digitization of Biological Collections (ADBC) program. This program funds networks of collections centered on research themes (Thematic Collection Networks, TCNs) to enter specimen data into databases, to georeference collection locations, and to photograph those specimens. Most importantly, these data have to be made available online and connected to the iDigBio portal. iDigBio cleans up the data and provides several ways to access them, including the API we will be investigating.

First, try running this query:
https://search.idigbio.org/v2/search/records/?rq=%7B%22scientificname%22%3A+%22camelus+bactrianus%22%2C+%22hasImage%22%3A+true%7D&limit=5

There are several URL encoding tags in this statement. The %7B means {, %22 means “, the %3A means :, the %2C is a comma, and the %7D is }. The + means a space. So this statement translates as ?rq={“scientificname”: “camelus bactrianus”, “hasImage”: true}&limit=5. Try changing some of the values and seeing what you get.

This encoding formats the URL into what is called JSON, or JavaScript Object Notation. The output from this call is also in JSON. It is an important way to transmit the sort of complicated, nested data saved in relational databases when you have to send a flat file over the web. 

The documentation for the iDigBio API is at https://www.idigbio.org/wiki/index.php/IDigBio_API

## More about JSON
At its most basic level, JSON transmits data objects in attribute-value pairs. It has come to replace XML, which was the previous standard for this sort of data transmission.

JSON is composed of objects, enclosed by curly brackets, which may have any number of attributes named in quotes, with values after a colon, separated by commas. You may also present an array, or an ordered collection of values, enclosed in square brackets.

As an example, you could present an occurrence like this example from the Neotoma API:

{

&nbsp;&nbsp;&nbsp;&nbsp;      "SiteLongitudeWest": -103.31666666666666,

&nbsp;&nbsp;&nbsp;&nbsp;      "SiteLatitudeSouth": 34.283333333333339,

&nbsp;&nbsp;&nbsp;&nbsp;      "TaxonName": "Smilodon fatalis",

&nbsp;&nbsp;&nbsp;&nbsp;      "VariableElement": "bone/tooth",

&nbsp;&nbsp;&nbsp;&nbsp;      "Value": 1.0,

&nbsp;&nbsp;&nbsp;&nbsp;      "VariableContext": null,

&nbsp;&nbsp;&nbsp;&nbsp;      "TaxaGroup": "MAM",

&nbsp;&nbsp;&nbsp;&nbsp;      "SampleAgeYounger": 15332.0,

&nbsp;&nbsp;&nbsp;&nbsp;      "SampleAgeOlder": 30041.0,

&nbsp;&nbsp;&nbsp;&nbsp;      "SiteLongitudeEast": -103.31666666666666,

&nbsp;&nbsp;&nbsp;&nbsp;      "SiteAltitude": 1280.0,

&nbsp;&nbsp;&nbsp;&nbsp;      "VariableUnits": "present/absent",

&nbsp;&nbsp;&nbsp;&nbsp;      "DatasetID": 4564,

&nbsp;&nbsp;&nbsp;&nbsp;      "SampleAge": null,

&nbsp;&nbsp;&nbsp;&nbsp;      "SiteLatitudeNorth": 34.283333333333339

}

Can you tell what kind of occurrence this JSON object is describing? How old is it? Where is it located? 

This record comes from searching the Neotoma DB API. Here is the example API call: <http://api.neotomadb.org/v1/data/sampledata?taxonname=Smilodon*>

Notice when you make this call that the JSON is computer-friendly but not human-friendly. Try it again with the ‘pretty’ format tag:
<http://api.neotomadb.org/v1/data/sampledata?taxonname=Smilodon*&format=pretty>

You should be able to see the nested set of JSON objects, including the occurrences returned as comma-separated objects within the array “data”.

Try experimenting with the search, substituting different names. We’ll do more with the Neotoma API in a bit.

JSON is becoming the standard for data transfer in web services. R has several packages for dealing with JSON-formatted data. We will use some examples from the package `RJSONIO`. We will also use the package `RCurl`, which has functions to let you query APIs from within the R environment.


```r
# Uncomment this line if you haven't already installed any of these packages:
# install.packages(c("RCurl", "RJSONIO"))

# Add the packages to your programming environment 
library(RCurl)
library(RJSONIO)
```

You will also want to make sure you have the latest version of R installed, or else the secure connection (https) won’t work in the following queries. 

Now create a query for the PaleoBioDB API using the example from above:

```r
q <- "https://paleobiodb.org/data1.2/occs/list.txt?base_name=Camelidae&interval=Pleistocene&show=loc,class"
```

Create an object to receive the results:

```r
a <- basicTextGatherer()
```

And execute that query:

```r
curlPerform(url = q, writefunction = a$update)
```

Finally, view the data:

```r
a$value()
```

You can see that the data have come in as a character vector; a long list of text strings with no clear structure. Luckily, the PaleoBioDB API also has a JSON interface. 

Change your query to refer to list.json:

```r
q <- "https://paleobiodb.org/data1.2/occs/list.json?base_name=Camelidae&interval=Pleistocene&show=loc,class"
```
Rerun your query and look at **a$value( )** again. How does it look now?

```r
a <- basicTextGatherer()
curlPerform(url = q, writefunction = a$update)
a$value()
```

You can convert it to a data frame:

```r
tmp <- fromJSON(a$value())
records <- tmp$records
results <- data.frame(records[1], stringsAsFactors = FALSE)
for(x in records[-1]){
  x<-data.frame(x, stringsAsFactors = FALSE)
  results <- merge(results, x, by = intersect(names(results),names(x)), all = TRUE)
}
dim(results)  # this shows the dimensions of the data frame
head(results)  # using head() here only prints the top 6 rows, out of 424
```

When you have gotten this code to work, go through and make comments to describe what each section is doing. Remember, you can make comments in your R code by placing a hashtag (#) at the beginning of a line, or after a line has run (as with the last few lines in the above chunk of code).

Try playing with your queries to see what you can pull from the PaleoBioDB, or even extending to the other two APIs we have explored.

## More on the Neotoma DB API
If you think back to the Neotoma API example, you can see that the example API call is reporting data from only part of the distributed database schema of Neotoma. In fact, the Neotoma API is designed around a set of different URLs, each of which allows a user to search a portion of the database. So, if you want the full Site information for locations with *Smilodon* present, you would have to search on *Smilodon* in the SampleData URI (as we did in the example), pull the DatasetID values from those returns, then search on the Dataset URI (api.neotomadb.org/v1/data/datasets) for those DatasetIDs, which would, in turn, produce the SiteIDs, which you would then search on the Sites URI (api.neotomadb.org/v1/data/sites). This sort of searching would be cumbersome if you were to do it by hand, but fortunately you can script a computer to do it for you. In fact, you don’t have to write the scripts to do it, because they have already been constructed and provided to the community as the R `neotoma` package. 

Using this package will the the subject of our next module, but bear in mind that the other APIs also have wrapper packages to simplify data calls in R. The PaleoBioDB has a package, `paleobioDB`, and iDigBio has a package, `ridigbio`. Currently, a large group of collaborators is working on a single API and wrapping R package to access both PaleoBioDB and Neotoma at the same time, as well as linking to many online museum databases and iDigBio. We wanted to introduce you to the underlying architecture here so you would understand what these packages are doing, and would know that you can crack them open and hack your own solutions if you cannot get them to give you the data or format of data that you need for your work.

# The `neotoma` Package

Install the `neotoma` package, then add it to your programming environment 

```r
# Uncomment this line if you haven't already installed any of these packages:
# install.packages(c("neotoma"))

library(neotoma)
```

```
## Warning: package 'neotoma' was built under R version 3.2.5
```

`neotoma` has three fundamental commands: `get_site`, `get_dataset`, `get_download`. The first two return metadata for sites and datasets; the latter returns data. See Goring et al. [@neotoma_goring] for a full description of the package and example code.  This exercise is partially based on those examples.

### Finding sites

We'll start with `get_site`.  `get_site` returns a `data.frame` with metadata about sites. You can use this to find the spatial coverage of data in a region (using `get_site` with a bounding box), or to get explicit site information easily from more complex data objects.  Use the command `?get_site` to see all the options available.

You can easily search by site name, for example, finding "Samwell Cave".  

```r
samwell_site <- get_site(sitename = 'Samwell%')
```
Examine the results

```r
print(samwell_site)
```

```
##     site.name      long      lat elev
##  Samwell Cave -122.2379 40.91691  465
## A site object containing 1 sites and 8 parameters.
```
While `samwell_site` is a `data.frame` it also has class `site`, that's why the print output looks a little different than a standard `data.frame`.  That also allows you to use some of the other `neotoma` functions more easily.  

By default the search string is explicit, but because older sites, especially pollen sites entered as part of COHMAP, often had appended textual information (for example `(CA:British Columbia)`), it's often good practice to first search using a wildcard character.  For example, searching for "Marion" returns three sites:

```r
marion_site <- get_site(sitename = 'Marion%')
```

```r
print(marion_site)
```

```
##                          site.name       long      lat elev
##  Marion Lake (CA:British Columbia) -122.54722 49.30833  305
##  Marion Landfill                    -83.18611 40.59167   NA
##  Marion Lake                       -121.86241 44.55770   NA
## A site object containing 3 sites and 8 parameters.
```

You can also search by lat/lon bounding box.  This one roughly corresponds to Florida.

```r
FL_sites <- get_site(loc = c(-88, -79, 25, 30)) 
```

You can also search by geopolitical name or geopolitical IDs (`gpid`) stored in Neotoma. For a list of names and gpids, go to [http://api.neotomadb.org/apdx/geopol.htm](), or use the `get_table(table.name = "GeoPoliticalUnits")` command.  This command works either with an explicit numeric ID, or with a text string:

```r
# get all sites in New Mexico (gpid=7956)
NM_sites <- get_site(gpid = 7956)

# get all sites in Wisconsin
WI_sites <- get_site(gpid = "Wisconsin")
```

`data.frame` stores vectors of equal length.  The nice thing about a `data.frame` is that each vector can be of a different type (character, numeric values, *etc*.). In RStudio, you can use the Environment panel in upper right to explore variables. 

We pointed out before that the object returned from `get_site` is both a `data.frame` and a `site` object.  Because it has a special `print` method some of the information from the full object is obscured when printed.  You can see all the data in the `data.frame` using `str` (short for *structure*):


```r
str(samwell_site)
```

Let's look at the `description` field:


```r
samwell_site$description

marion_site$description
```


### Getting Datasets

The structure of the Neotoma data model, as expressed through the API is roughly: "`counts` within `download`, `download` within `dataset`, `dataset` within `site`".  So a `dataset` contains more information than a site, about a particular dataset from that site.  A site may have a single associated dataset, or multiple.  For example:


```r
samwell_datasets <- get_dataset(samwell_site)

print(samwell_datasets)
```

`get_dataset` returns a list of datasets containing the metadata for each dataset

We can pass output from `get_site` to `get_dataset`, even if `get_site` returns multiple sites

```r
marion.meta.dataset  <- get_dataset(marion_site)
```

Let's look at the metadata returned for Marion%.  

```r
marion.meta.dataset
```
Both Marion Lake (CA: British Columbia) and Marion Landfill have a geochronology dataset, while Marion Lake (CA: British Columbia) has a pollen dataset and Marion Landfill a vertebrate fauna dataset. The third site, Marion Lake, has a diatom dataset and a water chemistry dataset.

> Question: Are Marion Lake (CA: British Columbia) and Marion Lake the same site?

Further searches (ie, to examine the lat/longs) or consulting the literature would be required. This illustrates the caution needed when using this, or any other, database. Human judgement still needs to be exercised when examining results from databases.

### Get_Download

`get_download` returns a list which stores a list of download objects - one for each retrieved dataset.  Note that this returns the actual data associated with each dataset, rather than a list of the available datasets, as in `get_dataset` above. Each download object contains a suite of data for the samples in that dataset.  

Get data for all datasets at Samwell Cave. `get_download` will accept an object of class dataset (ie, `samwell_dataset`), but also of class site, since it will automatically query for the datasets associated in each site.  Compare the returned messages for the following two commands:

```r
samwell_all <- get_download(samwell_site)
```

```
## Warning in get_download.default(datasetid, verbose = verbose): Some datasetids returned empty downloads, be aware that length(datasetid) is longer than the download_list.
```

```r
samwell_all <- get_download(samwell_datasets)
```

```
## Warning in get_download.default(datasetid, verbose = verbose): Some datasetids returned empty downloads, be aware that length(datasetid) is longer than the download_list.
```

```r
print(samwell_all)
```

There are a number of messages that appear.  These should be suppressed with the flag `verbose = FALSE` in the function call.  One thing you'll note is that not all of the datasets can be downloaded directly to a `download` objct.  This is because `geochronologic` datasets have a different data structure than other data, requiring different fields, and as such, they can be obtained using the `get_geochron` function:


```r
samwell_geochron <- get_geochron(samwell_site)

print(samwell_geochron)
```

The result is effectively the inverse of the first.

Get the vertebrate datasets for just Samwell Cave Popcorn Dome (dataset 14262):

```r
samwell_pd <- get_download(14262)
```

```
## API call was successful. Returned record for Samwell Cave
```

Let's examine the available data in this download

```r
str(samwell_pd[[1]])
```

There are 6 associated fields:

1. dataset
    + site.data
    + dataset.meta
    + pi.data
    + submission
    + access.date
    + site
2. sample.meta
3. taxon.list
4. counts
5. lab.data
6. chronologies

Within the download object, `sample.meta` stores the core depth and age information for that dataset. We just want to look at the first few lines, so are using the `head` function.  Let's explore different facets of the dataset


```r
head(samwell_pd[[1]]$sample.meta)

#taxon.list stores a list of taxa found  in the  dataset
head(samwell_pd[[1]]$taxon.list)

#counts stores the the counts, presence/absence data, or percentage data for each taxon for each sample
head(samwell_pd[[1]]$counts)
```

# Multi-Site Analysis
If we have time, we can work through the example given in a recent paper on the Neotoma package: http://www.openquaternary.com/articles/10.5334/oq.ab/

Jump to the section "Examples", then scroll down to "Mammal Distributions in the Pleistocene".  The R code is reproduced below.


```r
# install.packages('ggplot2','reshape2')
library("ggplot2")
```

```
## Warning: package 'ggplot2' was built under R version 3.2.3
```

```r
library("reshape2") 
```


```r
#  Bounding box is effectively the continental USA, excluding Alaska 
mam.set <- get_dataset(datasettype= 'vertebrate fauna', loc = c(-125, 24, -66, 49.5)) 

#  Retrieving this many sites can be very time consuming 
mam.dl <- get_download(mam.set)                       

compiled.mam <- compile_downloads(mam.dl) 

time.bins <- c(500, 4000, 10000, 15000, 20000) 

mean.age <- rowMeans(compiled.mam[,c('age.old','age.young', 'age')], na.rm = TRUE) 

interval <- findInterval(mean.age, time.bins) 

periods <- c('Modern',
             'Late Holocene',
             'Early-Mid Holocene',
             'Late Glacial',
             'Full Glacial',
             'Late Pleistocene') 

compiled.mam$ageInterval <- periods[interval + 1]

mam.melt <- melt(compiled.mam, measure.vars = 10:(ncol(compiled.mam)-1), na.rm = TRUE, factorsAsStrings = TRUE) 

mam.melt <- transform(mam.melt, ageInterval =factor(ageInterval, levels = periods)) 

mam.lat <- dcast(data = mam.melt, variable ~ageInterval, value.var = 'lat', 
                 fun.aggregate = mean, drop = TRUE)[,c(1, 3, 5,16)] 

# We only want taxa that appear at all time periods: 
mam.lat <- mam.lat[rowSums(is.na(mam.lat)) == 0, ] 

# Group the samples based on the range &direction (N vs S) of migration. 
# A shift of only 1 degree is considered stationary. 
mam.lat$grouping <- factor(findInterval (mam.lat[,2] - mam.lat[, 4], c(-11, -1, 1, 20)), 
                           labels = c('Southward','Stationary','Northward')) 
mam.lat.melt <- melt(mam.lat) 
colnames(mam.lat.melt)[2:3] <- c('cluster','Era')

ggplot(mam.lat.melt, aes(x = Era, y = value)) +
  geom_path(aes(group = variable, color =cluster)) +
  facet_wrap(~ cluster) + 
  scale_x_discrete(expand = c(.1,0)) + 
  ylab(‘Mean Latitude of Occurrance’) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
```

# Conclusions

We want to emphasize a few things:

* All of these tools are evolving, at times daily, and so make sure to update packages frequently
* The resources will get better with your input! There are github repositories for:
    * The Neotoma Paleoecology Database itself: https://github.com/NeotomaDB
    * The `neotoma` R package: https://github.com/ropensci/neotoma (also accessible via the NeotomaDB github)
    * The Paleobiology Database: https://github.com/paleobiodb
    * The PaleobioDB R Package: https://github.com/ropensci/paleobioDB
    * iDigBio: https://github.com/iDigBio
    * The ridigbio R package: https://github.com/iDigBio/ridigbio
* All of these resources to access the data go only so far- we will need human eyes on our data and analyses to detect and correct errors.
* All of these resources can only access the data that is stored, with all of their errors and omissions.  Making sure data are high-quality is an enormous amount of work, but can have huge payoffs for you and everyone else in the community.
  
# References
