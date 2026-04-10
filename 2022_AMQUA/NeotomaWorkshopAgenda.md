# AMQUA Neotoma 2.0 R Workshop - University of Wisconsin-Madison

## Socorro Dominguez Vidaña, Simon Goring

# Overview

This workshop is designed to provide users of the Neotoma Database with an overview of the new neotoma2 R package, and its use in obtaining data from the Neotoma Paleoecology Database.

At the end of this workshop, users will understand the following concepts:

1. How data is structured within Neotoma and in the R package
2. How to search for data in space and time
3. How to extract summary objects from individual sites and collections of sites
4. How to manipulate data to add new chronologies

Online resources for users include links embedded within the agenda, as well as:

* An online version of RStudio built for this workshop: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/NeotomaDB/AMQUA_binder/main?urlpath=rstudio)
* The code repository for the workshop: [https://github.com/NeotomaDB/AMQUA_binder](https://github.com/NeotomaDB/AMQUA_binder)

Install the R package:

```
install.packages('devtools')
devtools::install_github('NeotomaDB/neotoma2')
```

Neotoma maintains an online community on Slack that includes a channel for help using R and Neotoma (#it_r).  Come join our community: [https://bit.ly/3PT8zuP](https://bit.ly/3PT8zuP)

This allows us to better help you during the workshop and in the future.

# Resources

* The Neotoma Database Manual: [https://open.neotomadb.org/manual/](https://open.neotomadb.org/manual/)
* The `neotoma2` GitHub Repository: [https://github.com/neotomadb/neotoma2](https://github.com/neotomadb/neotoma2)

# Agenda

4 Hours (1pm - 4:50pm)

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
   <td>1:00 - 1:15pm
   </td>
   <td>Introductions
   </td>
   <td>Run through each individual’s profile quickly, say hi & introduce ourselves.
   </td>
   <td><a href="https://bit.ly/EPDIntros">https://bit.ly/EPDIntros</a>
   </td>
  </tr>
  <tr>
   <td>1:15 - 1:20pm
   </td>
   <td>Why neotoma2
   </td>
   <td>Explaining why we’ve moved to a new package, rather than updating the `neotoma` R package.
   </td>
   <td>https://docs.google.com/presentation/d/1UhIJ3HJskE9ymmFZ109ktsKKuqzW21JZc8fiWQLkyZw/edit?usp=sharing
   </td>
  </tr>
  <tr>
   <td><strong>1:20 - 2:00pm</strong>
   </td>
   <td><strong>A simple workflow</strong>
   </td>
   <td colspan="2" ><a href="https://open.neotomadb.org/EPD_binder/simple_workflow.html">https://open.neotomadb.org/EPD_binder/simple_workflow.html</a>
   </td>
  </tr>
  <tr>
   <td>1:20 - 1:30
   </td>
   <td>Simple Site Search
   </td>
   <td>How to search for sites by space & name.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>1:30 - 1:35
   </td>
   <td>Independent Searching
   </td>
   <td>Individuals will use the geoJSON site to select an area, perform a search and plot the results. Paste the image on your personal slide.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>1:35 - 1:40
   </td>
   <td>Quick Debrief
   </td>
   <td>One or two people, what did you find?
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>1:40 - 1:50
   </td>
   <td>Searching for Datasets and Filtering
   </td>
   <td>How to extract datasets by dataset type & see summary information about records.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>1:50 - 2:00pm
   </td>
   <td>Independent filtering
   </td>
   <td>Users will filter by time, space &cetera.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>2:05 - 2:10pm
   </td>
   <td>Quick debrief
   </td>
   <td>What do you need from Neotoma?
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>2:10 - 2:30pm
   </td>
   <td>Samples & Stratigraphic plotting
   </td>
   <td>How to pull them from sites/datasets. Key features, filtering.
   </td>
   <td>Intro to taxonomic harmonization is in the simple_workflow.html
   </td>
  </tr>
  <tr>
   <td>2:30 - 3:00pm
   </td>
   <td>Break
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>3:00 - 3:20
   </td>
   <td>Spatial Analysis
   </td>
   <td>Using climate data from WorldClim rasters, examine taxon distributions in climate space
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>3:20 - 3:30
   </td>
   <td>Independent Breakout 1
   </td>
   <td>See instructions in the slide
   </td>
   <td>Link removed for online version.
   </td>
  </tr>
  <tr>
   <td><strong>3:30 - 4:50</strong>
   </td>
   <td><strong>Working with chronologies</strong>
   </td>
   <td colspan="2" ><a href="https://open.neotomadb.org/EPD_binder/complex_workflow.html">https://open.neotomadb.org/EPD_binder/complex_workflow.html</a>
   </td>
  </tr>
  <tr>
   <td>3:30 - 3:40
   </td>
   <td>Welcome back & looking at chronologies/chroncontrols
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>3:40 - 3:50
   </td>
   <td>Independent time
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>3:50 - 4:00
   </td>
   <td>Building the Chronology
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>4:00 - 4:10
   </td>
   <td>Adding the Chronology
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>4:10 - 4:30
   </td>
   <td>Independent Breakout 2
   </td>
   <td>Groups of 3 – Work through some stuff
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>4:30 - 4:50
   </td>
   <td>Debrief
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
</table>
