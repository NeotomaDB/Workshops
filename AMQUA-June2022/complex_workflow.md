---
title: "A Not so Simple Workflow"
author: "Simon Goring, Socorro Dominguez Vidaña"
date: "2022-05-31"
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

We worked through the process for finding and downloading records using `neotoma2` in the [previous workshop](https://open.neotomadb.org/EPD_binder/simple_workflow.html). Assuming we found a record that we were interested in, we can go back and pull a single record using its `datasetid`. In this case, the dataset is for [Stará Boleslav](https://data.neotomadb.org/24238). Let's start by pulling in the record and using the `chronologies()` helper function to look at the chronologies associated with the record:


```r
stara <- get_downloads(24238)
```

```
## .
```

```r
stara_chron <- chronologies(stara)

stara_chron %>% as.data.frame() %>% 
  DT::datatable(data = ., 
                options = list(scrollX = "100%"))
```

```{=html}
<div id="htmlwidget-5c0c7f998e554236bca2" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-5c0c7f998e554236bca2">{"x":{"filter":"none","vertical":false,"data":[["1","2","3"],["14589","14590","14591"],["C14 BP age with Tilia (Grimm)","CAL BP age with CLKAM (Blaauw) sigma 2","linear interpolation between neighbouring dated levels"],["linear interpolation","linear interpolation","Clam"],[2050,2000,2000],[5,400,400],[1,0,1],["2013-01-01","2013-01-01","2007-06-20"],["Radiocarbon years BP","Calibrated radiocarbon years BP","Calibrated radiocarbon years BP"],["C14 BP","CAL BP","PALYCZ"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>chronologyid<\/th>\n      <th>notes<\/th>\n      <th>agemodel<\/th>\n      <th>ageboundolder<\/th>\n      <th>ageboundyounger<\/th>\n      <th>isdefault<\/th>\n      <th>dateprepared<\/th>\n      <th>modelagetype<\/th>\n      <th>chronologyname<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[4,5,6]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

There are three chronologies here, but for whatever reason we've decided not to use any of them.  We want to build a new one with the function `Bchronology()` from the [`Bchron` package](https://cran.r-project.org/web/packages/Bchron/vignettes/Bchron.html). First we want to see what chroncontrols we have for the prior chronologies. We're going to select the chronologies used for chronology `14591` as our template.  

### Extract `chroncontrols`


```r
controls <- chroncontrols(stara) %>% 
  dplyr::filter(chronologyid == 14591) %>% 
  arrange(depth)

controls %>% DT::datatable(data = ., 
                options = list(scrollX = "100%"))
```

```{=html}
<div id="htmlwidget-086aba428feff353477f" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-086aba428feff353477f">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5"],[15771,15771,15771,15771,15771],[14591,14591,14591,14591,14591],[0,7.5,62.5,122.5,227.5],[null,5,5,5,5],[null,730,950,1320,1990],[53783,53779,53780,53781,53782],[null,610,810,1160,1850],[null,670,880,1240,1920],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

We can look at other tools to decided how we want to manage the chroncontrols, for example, saving them and editing them using Excel or another spreadsheet program.  We could add a new date by adding a new row. In this example we're just going to modify the existing ages to provide better constraints at the core top. We are setting the core top to *0 calibrated years BP*, and assuming an uncertainty of 2 years, and a thickness of 1cm.

To do these assignments we're just directly modifying cells within the `controls` `data.frame`:


```r
controls$chroncontrolage[1] <- 0
controls$agelimityounger[1] <- -2
controls$agelimitolder[1] <- 2
controls$thickness[1] <- 1

controls %>% DT::datatable(data = ., 
                options = list(scrollX = "100%"))
```

```{=html}
<div id="htmlwidget-7999ecf122933dc516b6" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-7999ecf122933dc516b6">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5"],[15771,15771,15771,15771,15771],[14591,14591,14591,14591,14591],[0,7.5,62.5,122.5,227.5],[1,5,5,5,5],[2,730,950,1320,1990],[53783,53779,53780,53781,53782],[-2,610,810,1160,1850],[0,670,880,1240,1920],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

### Extract Depth & Analysis Unit IDs

Once our `chroncontrols` table is updated, we extract the `depth`s and `analysisunitid`s from the dataset `samples()`. Pulling in both `depth`s and `analysisunitid`s is important because a single collection unit may have multiple datasets, which may have non-overlapping depth sequences. So, when adding sample ages back to a record we use the `analysisunitid` to make sure we are providing the correct assignment since depth may be specific to a single dataset.


```r
# Get a two column data.frame with columns depth and analysisunitid.
# Sort the table by depth from top to bottom for "Bchronology"
predictDepths <- samples(stara) %>%
  select(depth, analysisunitid) %>% 
  unique() %>% 
  arrange(depth)

# Pass the values from `controls`. We're assuming the difference between
# chroncontrolage and the agelimityounger is 1 SD.

newChron <- Bchron::Bchronology(ages = controls$chroncontrolage,
                                ageSds = abs(controls$agelimityounger - 
                                               controls$chroncontrolage),
                                calCurves = c("normal", rep("intcal20", 4)),
                                positionThicknesses = controls$thickness,
                                positions = controls$depth,
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
creators <- c(set_contact(givennames = "Simon James",
                          familyname = "Goring",
                          ORCID = "0000-0002-2700-4605"),
              set_contact(givennames = "Socorro",
                          familyname = "Dominguez Vidaña",
                          ORCID = "0000-0002-7926-4935"))

newChronStara <- set_chronology(agemodel = "Bchron model",
                                contact = creators,
                                isdefault = 1,
                                ageboundolder = max(newpredictions),
                                ageboundyounger = min(newpredictions),
                                dateprepared = lubridate::today(),
                                modelagetype = "Calibrated radiocarbon years BP",
                                chronologyname = "Simon's example chronology",
                                chroncontrols = controls)

newChronStara$notes <- 'newChron <- Bchron::Bchronology(ages = controls$chroncontrolage,
                                ageSds = abs(controls$agelimityounger - 
                                               controls$chroncontrolage),
                                calCurves = c("normal", rep("intcal20", 4)),
                                positionThicknesses = controls$thickness,
                                positions = controls$depth,
                                allowOutside = TRUE,
                                ids = controls$chroncontrolid,
                                predictPositions = predictDepths)'
```

### Adding the `chronology` to the `collectionunit`

Once we've created the chronology we need to apply it back to the collectionunit. We also need to add the predicted dates into the samples for each dataset associated with the collectionunit.

So: 

1. we have a collectionunit in `stara` that is accessible at `stara[[1]]$collunits`.
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
                            agetype = "Calibrated radiocarbon years")

stara[[1]]$collunits[[1]] <- add_chronology(stara[[1]]$collunits[[1]], 
                                            newChronStara, 
                                            newSampleAges)
```

With this, we now have the updated collectionunit. Lets take a look at how this affects the age model overal. To pull the ages from the prior chronologies, we use the `set_default()` function to change the default chronology, and then extract ages, depths & analysisunits:


```r
# The new chronology is currently the default chronology.
newages <- samples(stara) %>%
  select(depth, analysisunitid, age) %>% 
  unique() %>% 
  arrange(depth) %>% 
  mutate(agecat = "new")

stara[[1]]$collunits[[1]]$chronologies <- set_default(stara[[1]]$collunits[[1]]$chronologies,
                                                      14591)
plotforages <- samples(stara) %>%
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

1. Download a single record (the Stara record using `get_downloads()`)
2. Examining the chronologies for the record (using `chronologies()` and associated chronological controls (using `chroncontrols()`)
3. Creating a new chronology for the record (using `set_chronology()`)
4. Adding the chronology to the record (using `add_chronology()`)
5. Switching between default chronologies (using `set_default()`)

This approach is focused on a single record, but much of what is done here can be extended to multiple records using functions. We hope it's been helpful!
