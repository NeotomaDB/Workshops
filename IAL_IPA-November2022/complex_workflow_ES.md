---
title: "Un flujo de trabajo no tan simple"
author: "Simon Goring, Socorro Dominguez Vidaña"
date: "2022-11-16"
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

## Construyendo nuevas cronologías

En este documento de RMarkdown, vamos a analizar el proceso de:

1. Descargar un único registro
2. Examinar las cronologías para ese registro y sus controles cronológicos asociados
3. Crear una nueva cronología para ese registro
4. Agregar la cronología al registro
5. Alternar entre cronologías predeterminadas

Este enfoque es utilizado para un único registro, pero mucho de lo que se hace en este documento puede ser extendido a múltiples registros si creamos funciones.

## Cargando las librerías

Para este documento vamos a necesitar cuatro paquetes, `neotoma2`, `dplyr`, `ggplot2` y `Bchron`. Vamos a cargar un registro de la base de datos Neotoma, crear una cronología nueva para el registro y luego agregar dicha cronología al registro.

Usaremos el paquete `pacman` (asi que en realidad, necesitamos cinco paquetes), para cargar e instalar automáticamente las librerías necesarias.


```r
pacman::p_load(neotoma2, dplyr, ggplot2, Bchron)
```

## Cargando los conjuntos de datos

En el [taller anterior](https://open.neotomadb.org/EPD_binder/simple_workflow.html) trabajamos el proceso de búsqueda y descarga de registros utilizando `neotoma2`. Asumiendo que encontramos un registro que fuera de nuestro interés, podemos extraer toda su información utilizando su identificador `datasetid`. En este caso, el conjunto de datos es para el sitio [Stará Boleslav](https://data.neotomadb.org/24238). Comencemos extrayendo el registro y utilizando la función auxiliar `chronologies()` para ver qeu cronologías están asociadas a este registro:


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
<div id="htmlwidget-147e34a068e0c3e7fb1e" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-147e34a068e0c3e7fb1e">{"x":{"filter":"none","vertical":false,"data":[["1","2","3"],["14589","14590","14591"],["C14 BP age with Tilia (Grimm)","CAL BP age with CLKAM (Blaauw) sigma 2","linear interpolation between neighbouring dated levels"],["linear interpolation","linear interpolation","Clam"],[2050,2000,2000],[5,400,400],[1,0,1],["2013-01-01","2013-01-01","2007-06-20"],["Radiocarbon years BP","Calibrated radiocarbon years BP","Calibrated radiocarbon years BP"],["C14 BP","CAL BP","PALYCZ"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>chronologyid<\/th>\n      <th>notes<\/th>\n      <th>agemodel<\/th>\n      <th>ageboundolder<\/th>\n      <th>ageboundyounger<\/th>\n      <th>isdefault<\/th>\n      <th>dateprepared<\/th>\n      <th>modelagetype<\/th>\n      <th>chronologyname<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[4,5,6]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

Podemos ver que hay tres cronologías asociadas aquí. Supongamos que por alguna razón decidimos que no queremos utilizar estas cronologías y queremos crear una nueva cronología con la función `Bchronology()` del [paquete `Bchron`](https://cran.r-project.org/web/packages/Bchron/vignettes/Bchron.html). Primero queremos ver que controles cronológicos tenemos para nuestras cronologías anteriores. Vamos a utilizar las cronologías en la cronología `14591` como nuestra plantilla.

### Extrayendo los controles `chroncontrols`


```r
controls <- chroncontrols(stara) %>% 
  dplyr::filter(chronologyid == 14591) %>% 
  arrange(depth)

controls %>% DT::datatable(data = ., 
                options = list(scrollX = "100%"))
```

```{=html}
<div id="htmlwidget-3374eb2094c37b96ba86" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-3374eb2094c37b96ba86">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5"],[15771,15771,15771,15771,15771],[14591,14591,14591,14591,14591],[0,7.5,62.5,122.5,227.5],[null,5,5,5,5],[null,730,950,1320,1990],[53783,53779,53780,53781,53782],[null,610,810,1160,1850],[null,670,880,1240,1920],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

Podemos observar otras herramientas para decidir cómo queremos administrar el control cronológico, por ejemplo, guardarlo y editarlo usando Excel u otro programa de hoja de cálculo. Podríamos agregar una nueva fecha agregando un nuevo renglón En este ejemplo, solo vamos a modificar las edades existentes para proporcionar mejores restricciones en la parte superior del núcleo. Estamos configurando la parte superior del núcleo a *0 años BP calibrados*, y asumiendo una incertidumbre de 2 años y un grosor de 1 cm.

Para realizar estos cambios, modificaremos directamente las celdas del marco de datos (`data.frame`) `controls`:


```r
controls$chroncontrolage[1] <- 0
controls$agelimityounger[1] <- -2
controls$agelimitolder[1] <- 2
controls$thickness[1] <- 1

controls %>% DT::datatable(data = ., 
                options = list(scrollX = "100%"))
```

```{=html}
<div id="htmlwidget-9027888589f5f93d830a" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-9027888589f5f93d830a">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5"],[15771,15771,15771,15771,15771],[14591,14591,14591,14591,14591],[0,7.5,62.5,122.5,227.5],[1,5,5,5,5],[2,730,950,1320,1990],[53783,53779,53780,53781,53782],[-2,610,810,1160,1850],[0,670,880,1240,1920],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

### Extrayendo la profundidad y los identificadores de unidad de análisis

Una vez que nuestra tabla de `chroncontrols` ha sido actualizada, extraemos las profundidades `depth` y las unidades de análisis `analysisunitid` del marco de datos `samples()`. Es importante Extraer ambos campos `depth` y `analysisunitid` porque cada unidad de colecta puede tener varios conjuntos de datos que pueden tener secuencias de profundidad que no se superponen. Es por esto que, cuando volvemos a agregar edades de muestra a un registro, utilizamos `analysisunitid` para asegurarnos de que estamos proporcionando la asignación correcta - ya que la profundidad puede ser específica de un único conjunto de datos. 


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

![Age-depth model for Stará Boleslav, with probability distributions superimposed on the figure at each chronology control depth.](complex_workflow_ES_files/figure-html/chronologyPlot-1.png)

### Creando la nueva cronología `chronology` y objetos de contacto `contact`

Dada la nueva cronología, queremos agregarla de regreso al objeto `sites` para que esta sea considerada la cronología predeterminada para las muestras obtenidas cuando usemos `samples()`. Para crear metadatos con la nueva cronología, utilizamos `set_chronology()` con las propiedades de [la tabla `chronology` en Neotoma](https://open.neotomadb.org/dbschema/tables/chronologies.html):


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

### Agregando la cronología `chronology` a la unidad de colecta `collectionunit`

Una vez que hemos creado la cronología, tenemos que regresarla a la unidad de colecta. También tenemos que agregar las fechas previstas en las muestras para cada conjunto de datos asociadas con la unidad de colecta.

Entonces: 

1. tenemos una unidad de colecta en `stara` a la que podemos acceder usando `stara[[1]]$collunits`.
2. Tenemos la función `add_chronology()`, que recibe un objeto de tipo cronología y un marco de datos `data.frame()` con muestras de edades.
3. Las fechas previstas asociadas a la nueva cronología tienen que ser transferidas a cada objeto`samples` existentes en la unidad de colecta `collectionunit`.

Todo esto está incluido en la función `add_chronology()`, que recibe la unidad de colecta `collectionunit`, la modifica y regresa el objeto `collectionunit` actualizado.


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

Ahora tenemos la unidad de colecta actualizada. Observemos como afecta este cambio al modelo de edades en general. Para extraer las cronologías previas, usamos la función `set_default()` par cambiar la cronología predeterminada y así poder extraer las edades, profundidades y unidades de colecta:


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

También podemos observar las diferencias visualmente:


```r
ggplot(plotforages, aes(x = depth, y = age)) +
  geom_path(aes(color = agecat)) +
  theme_bw() +
  xlab("Depth (cm)") +
  ylab("Calibrated Years BP")
```

![Differences in age representation between chronologies between existing chronologies and the new Bchron chronology.](complex_workflow_ES_files/figure-html/plotAgeDifferences-1.png)

Podemos ver entonces, el impacto de la nueva cronología en el modelo de tiempo para el registro, y tambièn podemos hacer selecciones para saber que modelo queremos usar para el futuro. Podemos utilizar este enfoque para crear varias nuevas cronologías para un único registro modificando los parámetros dentro de `Bchronology()`, o usando Bacon y diferentes parámetros. Dado que la cronología `chronology` es un objeto de R, podemos guardar el objeto para usarlo en el futuro y asociarlo con registros existentes o podemos volver a generar los modelos una vez mas.

## Resumen

En este cuaderno hemos aprendido a:

1. Descargar un único registro (el registro Stara con la función `get_downloads()`)
2. Examinar las cronologías del registro (usando `chronologies()` y los controles cronológicos asociados (usando `chroncontrols()`)
3. Crear una nueva cronología para el registro (usando `set_chronology()`)
4. Agregar la cronología al registro (usando `add_chronology()`)
5. Alternar entre cronologías predeterminadas (usando `set_default()`)

Este análisis está enfocado a un único registro, sin embargo se puede extender a mútiples registros usando funciones. Esperemos sea de utilidad para sus investigaciones!
