---
title: "A Not so Simple Workflow"
author: "Simon Goring, Socorro Dominguez Vidaña"
date: "2023-04-23"
output:
  html_document:
    code_folding: show
    fig_caption: yes
    keep_md: yes
    self_contained: yes
    theme: readable
    toc: yes
    toc_float: yes
    css: "text.css"
  pdf_document:
    pandoc_args: "-V geometry:vmargin=1in -V geometry:hmargin=1in"
dev: svg
highlight: tango
---

## Building New Chronologies

This RMarkdown document will walk you through the process of:

1. Downloading a single record
2. Examining the chronologies for that record and associated chronological controls
3. Creating a new chronology for the record
4. Adding the chronology to the record
5. Switching between default chronologies

This approach is focused on a single record, but much of what is done here can be extended to multiple records using functions.

## Load Libraries

For this workshop element we only need four packages, `neotoma2`, `dplyr`, `ggplot2` and `Bchron`. We'll be loading a record from Neotoma, building a new chronology for the record, and then adding the chronology back to the record.

We'll be using the R package `pacman` here (so really, we need five packages), to automatically load and install packages:


```r
pacman::p_load(neotoma2, dplyr, ggplot2, Bchron)
```

## Loading Datasets

We worked through the process for finding and downloading records using `neotoma2` in the [previous workshop](https://open.neotomadb.org/Current_Workshop/simple_workflow.html). Assuming we found a record that we were interested in, we can go back and pull a single record using its `datasetid`. In this case, the dataset is for [Lac Castor](https://data.neotomadb.org/346). Let's start by pulling in the record and using the `chronologies()` helper function to look at the chronologies associated with the record:


```r
# We could also search for Lac Castor:
# castor <- get_sites(sitename = "Lac Castor", datasettype = "pollen") %>%
#   get_downloads()
# But we know the datasetid so we can directly call get_downloads with the datasetid:
castor <- get_downloads(346)
castor_chron <- chronologies(castor)
castor_chron %>% as.data.frame()
```


```
## .
```

```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-b2b8b321f2ba7f05084d" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-b2b8b321f2ba7f05084d">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4"],["187","188","189","24863"],[null,"Gyttja alone begins at 795cm. Ragweed and grass rise by 5cm, above 25cm. Tsuga appears by 650cm. Tsuga declines 325 to 300cm. 6 C-14 dates. Age bounds for application of the model: top = 0; bottom = 10000.",null,"Wang, Y., Goring, S. &amp; McGuire, J.L.  Bayesian ages for pollen records since the last glaciation in North America\r\n\r\nBacon settings file:\r\n5 #d.min\r\n859 #d.max\r\n1 #d.by\r\n1 #depths.file\r\nNA #slump\r\n10 #acc.mean\r\n1.5 #acc.shape\r\n0.7 #mem.mean\r\n4 #mem.strength\r\nNA #hiatus.depths\r\n1000 #hiatus.mean\r\n1 #hiatus.shape\r\n0 #BCAD\r\n1 #cc\r\n0 #postbomb\r\nIntCal13 #cc1\r\nMarine13 #cc2\r\nSHCal13 #cc3\r\nConstCal #cc4\r\ncm #unit\r\n0 #normal\r\n3 #t.a\r\n4 #t.b\r\n0 #d.R\r\n0 #d.STD\r\n0.95 #prob\r\n\r\nNote that coretop age=0 follows convention of prior age models, but is probably inaccurate, given core collection in 1975AD (age=-25 relative to 1950AD).   q\r\n\r\nChronology prepared by Yue Wang and Simon Goring. Data entered and uploaded by Jack Williams."],["linear interpolation","linear interpolation","linear interpolation (+ extrapolation)","bacon"],[null,null,9540,11000],[null,null,130,-40],[0,0,0,1],["1983-07-14",null,"1993-12-03","2018-04-11"],["Radiocarbon years BP","Radiocarbon years BP","Radiocarbon years BP","Calendar years BP"],["BDPMQ 1","COHMAP chron 1","NAPD 1","Wang et al."]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>chronologyid<\/th>\n      <th>notes<\/th>\n      <th>agemodel<\/th>\n      <th>ageboundolder<\/th>\n      <th>ageboundyounger<\/th>\n      <th>isdefault<\/th>\n      <th>dateprepared<\/th>\n      <th>modelagetype<\/th>\n      <th>chronologyname<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[4,5,6]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

Lac Castor has four chronologies and we've decided not to use them because we want to standardize our methods. We want to build a new one with the function `Bchronology()` from the [`Bchron` package](https://cran.r-project.org/web/packages/Bchron/vignettes/Bchron.html).

It's worth pointing out the `isdefault` column here. Neotoma provides the opportunity to link multiple chronologies to a single record. This lets researchers add their chronologies when they publish new studies. For example, the **Wang *et al.*** chronology comes from a set of Bayesian chronologies published by Yue Wang ([Wang *et al*., 2019](https://doi.org/10.1038/s41597-019-0182-7)). For each age type (Radiocarbon years BP, Calendar years BP, &cetera) there is a default chronology that defines the model for the date interpolation. There is also a hierarchy for the default chonologies. By default Neotoma assigns the age model using _calendar years_ the highest priority, then _calibrated radiocarbon years_, then _radiocarbon years_. You can see the order in practice if we look at the content of `get_table("age types")`.

### Extract `chroncontrols`

We're going to select chronology `24863` as our template. This is the Bacon model that Yue Wang generated. To generate a new chronology for this record we want to see which chronological control points were used for the record. We will extract all the chroncontrols, filter by the chronologyid, and then arrange them by depth:


```r
# Extract the chronological controls used in the original chronology:
controls <- chroncontrols(castor) %>% 
  dplyr::filter(chronologyid == 24863) %>% 
  arrange(depth)
```


```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-36dcc68d694a9671b265" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-36dcc68d694a9671b265">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7"],["338","338","338","338","338","338","338"],[24863,24863,24863,24863,24863,24863,24863],[0,95,295,475,745,795,810],[1,10,10,50,10,10,20],[null,2720,4635,5910,8010,9380,9725],[79614,79608,79609,79610,79611,79612,79613],[null,2320,4035,5450,7750,9080,9355],[0,2520,4335,5680,7880,9230,9540],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

We can look at other tools to decided how we want to manage the chroncontrols, for example, saving them and editing them using Excel or another spreadsheet program.  We could add a new date by adding a new row. In this example we're just going to modify the existing ages to provide better constraints at the core top. We are setting the core top to *-55 calibrated years BP*, and assuming an uncertainty of 2 years, and a thickness of 2cm.

This generally won't change too much, and I have no real basis for doing this explicitly, but this is simply for illustration.

To do these assignments we're just directly modifying cells within the `controls` `data.frame`:


```r
# Directly assign the values
controls$chroncontrolage[1] <- -55
controls$agelimityounger[1] <- -53
controls$agelimitolder[1] <- -57
controls$thickness[1] <- 2
```


```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-ab2caf575d5f8fcf6b1a" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-ab2caf575d5f8fcf6b1a">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7"],["338","338","338","338","338","338","338"],[24863,24863,24863,24863,24863,24863,24863],[0,95,295,475,745,795,810],[2,10,10,50,10,10,20],[-57,2720,4635,5910,8010,9380,9725],[79614,79608,79609,79610,79611,79612,79613],[-53,2320,4035,5450,7750,9080,9355],[-55,2520,4335,5680,7880,9230,9540],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

### Extract Depth & Analysis Unit IDs

Once our `chroncontrols` table is updated, we extract the `depth`s and `analysisunitid`s from the dataset `samples()`. Pulling in both `depth`s and `analysisunitid`s is important because a single collection unit may have multiple datasets, which may have non-overlapping depth sequences. So, when adding sample ages back to a record we use the `analysisunitid` to make sure we are providing the correct assignment since depth may be specific to a single dataset.


```r
# Get a two column data.frame with columns depth and analysisunitid.
# Sort the table by depth from top to bottom for "Bchronology"
predictDepths <- samples(castor) %>%
  select(depth, analysisunitid) %>% 
  unique() %>% 
  arrange(depth)

# Pass the values from `controls`. We're assuming the difference between
# chroncontrolage and the agelimityounger is 1 SD.
# Note that for the parameter 'calCurves' we are using a "normal" 
# distribution for the modern sample (core top) and choosing the
# IntCal20 curve for the other two radiocarbon dates.

newChron <- Bchron::Bchronology(ages = controls$chroncontrolage,
                                ageSds = abs(controls$agelimityounger - 
                                               controls$chroncontrolage),
                                calCurves = c("normal", rep("intcal20", 6)),
                                positionThicknesses = controls$thickness,
                                positions = controls$depth,
                                predictPositions = predictDepths$depth,
                                allowOutside = TRUE,
                                ids = controls$chroncontrolid)

# Predict ages at each depth for which we have samples.  Returns a matrix.
newpredictions <- predict(newChron, predictDepths$depth)
```


```r
plot(newChron) +
  ggplot2::labs(
    xlab = "Age (cal years BP)",
    ylab = "Depth (cm)"
  )
```

![Age-depth model for Stará Boleslav, with probability distributions superimposed on the figure at each chronology control depth.](complex_workflow_files/figure-html/chronologyPlot-1.png)

### Creating the New `chronology` and `contact` objects

Given the new chronology, we want to add it to the `sites` object so that it becomes the default for any calls to `samples()`. To create the metadata for the new chronology, we use `set_chronology()` using the properties from the [`chronology` table in Neotoma](https://open.neotomadb.org/dbschema/tables/chronologies.html):


```r
# Add information about the people who generated the new chronology:
creators <- c(set_contact(givennames = "Simon James",
                          familyname = "Goring",
                          ORCID = "0000-0002-2700-4605"),
              set_contact(givennames = "Socorro",
                          familyname = "Dominguez Vidaña",
                          ORCID = "0000-0002-7926-4935"))

# Add information about the chronology:
newChroncastor <- set_chronology(agemodel = "Bchron model",
                                contact = creators,
                                isdefault = 1,
                                ageboundolder = max(newpredictions),
                                ageboundyounger = min(newpredictions),
                                dateprepared = lubridate::today(),
                                modelagetype = "Calendar years BP",
                                chronologyname = "Simon's example chronology",
                                chroncontrols = controls)


newChroncastor$notes <- 'newChron <- Bchron::Bchronology(ages = controls$chroncontrolage,
                                ageSds = abs(controls$agelimityounger - 
                                               controls$chroncontrolage),
                                calCurves = c("normal", rep("intcal20", 2)),
                                positionThicknesses = controls$thickness,
                                positions = controls$depth,
                                allowOutside = TRUE,
                                ids = controls$chroncontrolid,
                                predictPositions = predictDepths)'
```

### Adding the `chronology` to the `collectionunit`

Once we've created the chronology we need to apply it back to the collectionunit. We also need to add the predicted dates into the samples for each dataset associated with the collectionunit.

So:

1. we have a collectionunit in `castor` that is accessible at `castor[[1]]$collunits`.
2. We can use the function `add_chronology()`, which takes the chronology object and a `data.frame()` of sample ages.
3. The predicted dates associated with the new chronology need to be transferred to each `samples` object within the `collectionunit`.

This is all bound up in the `add_chronology()` function, which takes the `collectionunit`, modifys it, and returns the newly updated `collectionunit`.


```r
newSampleAges <- data.frame(predictDepths,
                            age = colMeans(newpredictions),
                            ageolder = colMeans(newpredictions) + 
                              apply(newpredictions, 2, sd),
                            ageyounger = colMeans(newpredictions) - 
                              apply(newpredictions, 2, sd),
                            agetype = "Calendar years")

castor[[1]]$collunits[[1]] <- add_chronology(castor[[1]]$collunits[[1]], 
                                            newChroncastor, 
                                            newSampleAges)
```

With this, we now have the updated collectionunit. Lets take a look at how this affects the age model overal. To pull the ages from the prior chronologies, we use the `set_default()` function to change the default chronology, and then extract ages, depths & analysisunits:


```r
# The new chronology is currently the default chronology.
newages <- samples(castor) %>%
  select(depth, analysisunitid, age) %>% 
  unique() %>% 
  arrange(depth) %>% 
  mutate(agecat = "new")

castor[[1]]$collunits[[1]]$chronologies <- set_default(castor[[1]]$collunits[[1]]$chronologies,
                                                      24863)
plotforages <- samples(castor) %>%
  select(depth, analysisunitid, age) %>% 
  unique() %>% 
  arrange(depth) %>% 

  mutate(agecat = "old") %>% 
  bind_rows(newages)
```

And we can look at the difference visually:


```r
ggplot(plotforages, aes(x = depth, y = age)) +
  geom_path(aes(color = agecat)) +
  theme_bw() +
  xlab("Depth (cm)") +
  ylab("Calibrated Years BP")
```

![Differences in age representation between chronologies between existing chronologies and the new Bchron chronology.](complex_workflow_files/figure-html/plotAgeDifferences-1.png)

So we can see the impact of the new chronology on the age model for the record, and we can make choices as to which model we want to use going forward. We can use this approach to create multiple new chronologies for a single record, tuning parameters within `Bchronology()`, or using Bacon and different parameters. Because the `chronology` is an R object we can save the objects for use in future sessions, and associate them with existin records, or we can re-run the models again.

## Summary

From this notebook we have learned how to:

1. Download a single record (the castor record using `get_downloads()`)
2. Examining the chronologies for the record (using `chronologies()` and associated chronological controls (using `chroncontrols()`)
3. Creating a new chronology for the record (using `set_chronology()`)
4. Adding the chronology to the record (using `add_chronology()`)
5. Switching between default chronologies (using `set_default()`)

This approach is focused on a single record, but much of what is done here can be extended to multiple records using functions. We hope it's been helpful!
