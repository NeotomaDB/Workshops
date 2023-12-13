# neotoma2 PNW Virtual Workshop Workshop

March 1st, 2023

8:30am - 11:20am Pacific Standard Time [Time Zone Converter](https://dateful.com/convert/pst-pdt-pacific-time?t=0830&d=2023-03-01)

## Socorro Dominguez Vidaña, Simon Goring

# Overview

This workshop is designed to provide users of the Neotoma Database with an overview of the new [`neotoma2` R package](https://github.com/NeotomaDB/neotoma2), and its use in obtaining data from the Neotoma Paleoecology Database.

At the end of this workshop, users will understand the following concepts:

1. How data is structured within Neotoma and in the R package
2. How to search for data in space and time
3. How to extract summary objects from individual sites and collections of sites
4. How to manipulate data to add new chronologies

Online resources for users include links embedded within the agenda, as well as:

* Participant slides: [Google Slides](https://docs.google.com/presentation/d/1lDZAam5zPBf0aK0zrcOgqb9f8-OPCCZk7bOiCw9QFLc/edit?usp=sharing)
* Online slides: [Google Slides](https://docs.google.com/presentation/d/1SN308n1-3q94lV_oF7NMI04Rs-X4kutiI29eJp2B-Vg/edit?usp=sharing)
* An online version of RStudio built for this workshop: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/NeotomaDB/Current_Workshop/main?urlpath=rstudio)
* The code repository for the workshop: [https://github.com/NeotomaDB/Current_Workshop](https://github.com/NeotomaDB/Current_Workshop)

## Getting Started

The course is designed to be run using RStudio in your browser. You will not need to install any files or packages, however, if you do want to install the R package on your computer, you can simply open your R session and type:

```
install.packages('devtools')
devtools::install_github('NeotomaDB/neotoma2')
```

# Resources

Neotoma maintains an online community on Slack that includes a channel for help using R and Neotoma (#it_r).  Come join our community: [https://bit.ly/3PT8zuP](https://bit.ly/3PT8zuP)

This allows us to better help you during the workshop and in the future.

* The Neotoma Database Manual: [https://open.neotomadb.org/manual/](https://open.neotomadb.org/manual/)
* The `neotoma2` GitHub Repository: [https://github.com/neotomadb/neotoma2](https://github.com/neotomadb/neotoma2)

# Agenda

3 Hours (8:30am - 11:20pm)

<table>
  <tr>
   <td>Time
   </td>
   <td>Topic
   </td>
   <td>Overview
   </td>
   <td>Link
   </td>
  </tr>
  <tr>
   <td>8:30 - 8:45am
   </td>
   <td>Introductions
   </td>
   <td>Run through each individual’s profile quickly, say hi & introduce ourselves.
   </td>
   <td><a href="https://docs.google.com/presentation/d/1lDZAam5zPBf0aK0zrcOgqb9f8-OPCCZk7bOiCw9QFLc/edit?usp=sharing">Participant Slides</a>
   </td>
  </tr>
  <tr>
   <td>8:45 - 8:50am
   </td>
   <td>Why `neotoma2`?
   </td>
   <td>Explaining why we’ve moved to a new package, rather than updating the `neotoma` R package.
   </td>
   <td><a href="https://docs.google.com/presentation/d/1UhIJ3HJskE9ymmFZ109ktsKKuqzW21JZc8fiWQLkyZw/edit?usp=sharing">Why neotoma2?</a>
   </td>
  </tr>
  <tr>
   <td><strong>8:50 - 9:00am</strong>
   </td>
   <td><strong>A simple workflow</strong>
   </td>
   <td colspan="2" ><a href="https://open.neotomadb.org/Current_Worksop/simple_workflow.html">https://open.neotomadb.org/EPD_binder/simple_workflow.html</a>
   </td>
  </tr>
  <tr>
   <td>9:20 - 9:30
   </td>
   <td>Simple Site Search
   </td>
   <td>How to search for sites by space & name.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>9:30 - 9:35
   </td>
   <td>Independent Searching
   </td>
   <td>Individuals will use the geoJSON site to select an area, perform a search and plot the results. Paste the image on your personal slide.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>9:35 - 9:40
   </td>
   <td>Quick Debrief
   </td>
   <td>One or two people, what did you find?
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>9:40 - 9:50am
   </td>
   <td>Searching for Datasets and Filtering
   </td>
   <td>How to extract datasets by dataset type & see summary information about records.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>9:50 - 10:00am
   </td>
   <td>Independent filtering
   </td>
   <td>Users will filter by time, space &cetera.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>10:05 - 10:10am
   </td>
   <td>Quick debrief
   </td>
   <td>What do you need from Neotoma?
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>10:10 - 10:30am
   </td>
   <td>Samples & Stratigraphic plotting
   </td>
   <td>How to pull them from sites/datasets. Key features, filtering.
   </td>
   <td>Intro to taxonomic harmonization is in the simple_workflow.html
   </td>
  </tr>
  <tr>
   <td>10:30 - 11:00am
   </td>
   <td>Break
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>11:00 - 11:20am
   </td>
   <td>Spatial Analysis
   </td>
   <td>Using climate data from WorldClim rasters, examine taxon distributions in climate space
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>11:20am - end
   </td>
   <td>Independent Breakout 1
   </td>
   <td>See instructions in the slide
   </td>
   <td>Link removed for online version.
   </td>
  </tr>
</table>
