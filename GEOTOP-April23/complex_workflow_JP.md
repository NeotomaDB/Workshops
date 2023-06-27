---
title: "それほど簡単ではないワークフロー"
author: "Simon Goring, Socorro Dominguez Vidaña"
date: "2023-06-23"
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

新しい年表の構築
 
この RMarkdown ドキュメントでは、次のプロセスについて説明します。
 
1. 単一記録のダウンロード
2. その記録の年表と関連する時系列管理を調査する
3. 記録用に新しい年表を作成する
4. 記録に年表を追加する
5. デフォルトの暦間の切り替え
 
このアプローチは単一の記録に焦点を当てていますが、ここで行われる処理の多くは関数を使用して複数の記録に拡張できます。

## パッケージの読み込み
 
このワークショップ要素に必要なのは `neotoma2`, `dplyr`, `ggplot2` および `Bchron`の4 つのパッケージだけです。 Neotomaから記録を読み込み、その記録の新しい年表を作成してから、その年表を記録に追加し直します。
 
ここではR パッケージ`pacman`を使用して(実際には 5 つのパッケージが必要です)、パッケージを自動的に読み込み、インストールします。


```r
pacman::p_load(neotoma2, dplyr, ggplot2, Bchron)
```

## データセットの読み込み

[前回のワークショップ](https://open.neotomadb.org/Current_Workshop/simple_workflow.html)では、`neotoma2`を使用して記録を検索してダウンロードするプロセスを実行しました。興味のある記録が見つかったと仮定すると、戻ってその`datasetid`を使用して1 つの記録を取得できます。この場合、データセットは[Lac Castor](https://data.neotomadb.org/346)のものです。 まずは記録を取得し、`chronologies()`ヘルパー関数を使用して記録に関連付けられた年表を確認しましょう。


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
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-ef5890f18af7c91f3e2d" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-ef5890f18af7c91f3e2d">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4"],["187","188","189","24863"],[null,"Gyttja alone begins at 795cm. Ragweed and grass rise by 5cm, above 25cm. Tsuga appears by 650cm. Tsuga declines 325 to 300cm. 6 C-14 dates. Age bounds for application of the model: top = 0; bottom = 10000.",null,"Wang, Y., Goring, S. &amp; McGuire, J.L.  Bayesian ages for pollen records since the last glaciation in North America\r\n\r\nBacon settings file:\r\n5 #d.min\r\n859 #d.max\r\n1 #d.by\r\n1 #depths.file\r\nNA #slump\r\n10 #acc.mean\r\n1.5 #acc.shape\r\n0.7 #mem.mean\r\n4 #mem.strength\r\nNA #hiatus.depths\r\n1000 #hiatus.mean\r\n1 #hiatus.shape\r\n0 #BCAD\r\n1 #cc\r\n0 #postbomb\r\nIntCal13 #cc1\r\nMarine13 #cc2\r\nSHCal13 #cc3\r\nConstCal #cc4\r\ncm #unit\r\n0 #normal\r\n3 #t.a\r\n4 #t.b\r\n0 #d.R\r\n0 #d.STD\r\n0.95 #prob\r\n\r\nNote that coretop age=0 follows convention of prior age models, but is probably inaccurate, given core collection in 1975AD (age=-25 relative to 1950AD).   q\r\n\r\nChronology prepared by Yue Wang and Simon Goring. Data entered and uploaded by Jack Williams."],["linear interpolation","linear interpolation","linear interpolation (+ extrapolation)","bacon"],[null,null,9540,11000],[null,null,130,-40],[0,0,0,1],["1983-07-14",null,"1993-12-03","2018-04-11"],["Radiocarbon years BP","Radiocarbon years BP","Radiocarbon years BP","Calendar years BP"],["BDPMQ 1","COHMAP chron 1","NAPD 1","Wang et al."]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>chronologyid<\/th>\n      <th>notes<\/th>\n      <th>agemodel<\/th>\n      <th>ageboundolder<\/th>\n      <th>ageboundyounger<\/th>\n      <th>isdefault<\/th>\n      <th>dateprepared<\/th>\n      <th>modelagetype<\/th>\n      <th>chronologyname<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[4,5,6]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

「Lac Castor」には 4 つの年表がありますが、方法を標準化したいため、それらを使用しないことにしました。[`Bchron`パッケージ](https://cran.r-project.org/web/packages/Bchron/vignettes/Bchron.html)の関数`Bchronology()`を使用して新しいものを構築したいと思います。

ここで`isdefault`列を指摘する必要があります。Neotomaは、複数の年表を1つの記録にリンクする機会を提供します。これにより、研究者は新しい研究を発表する時に年表を追加できるようになります。たとえば、**Wang *et al.** 年表は、Yue Wangによって出版された一連のベイズ（Bayesian）年表に由来しています([ Wang *et al*., 2019 ](https://doi.org/10.1038/s41597-) 019-0182-7)。各年齢タイプ (放射性炭素年 BP、暦年 BP など)に対して、 日付補間のモデルを定義するデフォルトの暦法があります。デフォルトの年表にも階層があります。デフォルトでは、Neotomaは暦年を使用した年齢モデルを最優先に割り当て、次に校正された放射性炭素年、次に放射性炭素年を割り当てます。
`get_table("age types")` の内容を見れば、実際の順序がわかります。

### `chroncontrols` を引き出す
 
テンプレートとして年表`24863`を選択します。これは Yue Wang が生成した Baconモデルです。 この記録の新しい年表を生成するには、どの時系列制御ポイントがその記録に使用されたかを確認する必要があります。すべての `chroncontrols` を引き出し、`chronologyid`でフィルターし、深さによって並べ替えます


```r
# Extract the chronological controls used in the original chronology:
controls <- chroncontrols(castor) %>% 
  dplyr::filter(chronologyid == 24863) %>% 
  arrange(depth)
```


```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-2ef76b500565dd9891a9" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-2ef76b500565dd9891a9">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7"],["338","338","338","338","338","338","338"],[24863,24863,24863,24863,24863,24863,24863],[0,95,295,475,745,795,810],[1,10,10,50,10,10,20],[null,2720,4635,5910,8010,9380,9725],[79614,79608,79609,79610,79611,79612,79613],[null,2320,4035,5450,7750,9080,9355],[0,2520,4335,5680,7880,9230,9540],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

他のツールを検討して、`chroncontrol` を管理する方法を決定することができます。たとえば、保存したり、*Excel* や別のスプレッドシート プログラムを使用して編集したりします。新しい行を追加することで、新しい日付を追加できます。この例では、コアの上部でより適切な制約を提供するために既存の年齢を変更するだけです。コアトップを*-55 校正年 BP*に設定し、不確実性を 2 年、厚さを 2cm と仮定します。
 
通常、これはあまり変わりません。これを明示的に行うための実際の根拠はありませんが、これは単に説明のためです。

これらの割り当てを行うには、 `controls`の`data.frame`内のセルを直接変更するだけです。


```r
# Directly assign the values
controls$chroncontrolage[1] <- -55
controls$agelimityounger[1] <- -53
controls$agelimitolder[1] <- -57
controls$thickness[1] <- 2
```


```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-f9113e8ff57221c5da84" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-f9113e8ff57221c5da84">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7"],["338","338","338","338","338","338","338"],[24863,24863,24863,24863,24863,24863,24863],[0,95,295,475,745,795,810],[2,10,10,50,10,10,20],[-57,2720,4635,5910,8010,9380,9725],[79614,79608,79609,79610,79611,79612,79613],[-53,2320,4035,5450,7750,9080,9355],[-55,2520,4335,5680,7880,9230,9540],["Core top","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon","Radiocarbon"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>siteid<\/th>\n      <th>chronologyid<\/th>\n      <th>depth<\/th>\n      <th>thickness<\/th>\n      <th>agelimitolder<\/th>\n      <th>chroncontrolid<\/th>\n      <th>agelimityounger<\/th>\n      <th>chroncontrolage<\/th>\n      <th>chroncontroltype<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":"100%","columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

### 深さと分析ユニットID`を抽出
 
`chroncontrols`テーブルが更新されたら、データセット`samples()`から深さ(`depth`)と分析単位ID(`analysisunitid`)を抽出します。単一の`analysisunit`に複数のデータセットが含まれる可能性があり、それらのデータセットには重複しない深さの順序が含まれる可能性があるため、深さと分析単位IDの両方を取得することが重要です。したがって、サンプル年齢を記録に追加し直す時は、深さが単一のデータセットに固有である可能性があるため、`analysisunitid`を使用して正しい割り当てが提供されていることを確認します。


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

![Age-depth model for Stará Boleslav, with probability distributions superimposed on the figure at each chronology control depth.](complex_workflow_JP_files/figure-html/chronologyPlot-1.png)

### 新しい年表`chronology`と`contact`オブジェクトの作成

新しい年表を考慮して、それを`sites`オブジェクトに追加して、`samples()`への呼び出しのデフォルトになるようにしたいと思います。新しい年表のメタデータを作成するには、[Neotoma の年表テーブル(chronology table)](https://open.neotomadb.org/dbschema/tables/chronologies.html)のプロパティを使用して、`set_chronology()`を使用します。


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

### `collectionunit`に年表`chronology` を追加する
 
年表を作成したら、それをコレクションユニットに適用し直す必要があります。また、コレクションユニットに関連付けられた各データセットのサンプルに予測された日付を追加する必要があります。
 
1. `Lac Castor`には、 `castor[[1]]$collunits`でアクセスできるコレクションユニットがあります。

2. `add_chronology()`関数を使用すると、年表オブジェクトとサンプル年齢の`data.frame()`を受け取ります。

3. 新しい年表に関連付けられた予測日付は、`collectionunit`の各`samples`オブジェクトに転送される必要があります。

これはすべて`add_chronology()`関数に関連付けられており、この関数は`collectionunit`を取得して変更し、そして新しく更新された`collectionunit`を返します。
 

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

これで、更新されたコレクションユニットが完成しました。これが年齢モデル全体にどのような影響を与えるかを見てみましょう。以前の年表から年齢を取得するには、「set_default()」関数を使用してデフォルトの年表を変更し、年齢、深さ、分析単位を抽出します。



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

そして、違いを視覚的に見ることができます。


```r
ggplot(plotforages, aes(x = depth, y = age)) +
  geom_path(aes(color = agecat)) +
  theme_bw() +
  xlab("Depth (cm)") +
  ylab("Calibrated Years BP")
```

![Differences in age representation between chronologies between existing chronologies and the new Bchron chronology.](complex_workflow_JP_files/figure-html/plotAgeDifferences-1.png)

したがって、新しい年表が記録の年齢モデルに与える影響を確認でき、今後どのモデルを使用するかを選択できます。このアプローチを使用すると、`Bchronology()`でパラメーターを調節したり、`Bacon`やさまざまなパラメーターを使用したりして、単一の記録に対して複数の新しい年表を作成できます。年表(`chronology`)は`R`オブジェクトであるため、将来のセッションで使用するためにオブジェクを保存し、既存の記録に関連付けたり、モデルを再度実行したりできます。

## まとめ
 
このノートブックから、次の方法を学びました。
 
1. 単一の記録(`get_downloads()`を使用したキャスター レコード)をダウンロードします。
2. 記録の年表を調べる（`chronologies()`を使用し、関連する時系列コントロールを使用する（`chroncontrols()`を使用）
3. 記録の新しい年表の作成（`set_chronology()`を使用）
4. 記録に年表を追加する（`add_chronology()`を使用）
5. デフォルトの暦間の切り替え（`set_default()`を使用）

このアプローチは単一の記録に焦点を当てていますが、ここで行われる処理の多くは関数を使用して複数の記録に拡張できます。

このノートブックがお役に立てば幸いです
