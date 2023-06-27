[![language-EN](https://img.shields.io/badge/language-EN-red)](README.md) [![language](https://img.shields.io/badge/language-ES-red)](README.es.md) [![language-RU](https://img.shields.io/badge/language-RU-red)](README.ru.md)
[![language-JP](https://img.shields.io/badge/language-JP-red)](README.jp.md)

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![NSF-1948926](https://img.shields.io/badge/NSF-1948926-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1948926)

# 二オトマのワークショップ

交流的なRワークショップをホストするためのリポジトリです。このリポジトリは最新のワークショップ用にセットアップされています。前のワークショップは[Neotoma Workshops](https://github.com/NeotomaDB/Workshops)のリポジトリにアーカイブされています。

このリポジトリは、BinderとDockerの技術を使って、ブラウザでRStudioを使うことができます。ワークショプのための必要なパッケージもすべて使えます。 [Binder]のリンクをクリックすると、ユーザーのブラウザでRStudioが開きます。

**今、このリポジトリはUQAM GEOTOPのワークショップのコンテンツを上げています。**

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/NeotomaDB/Current_Workshop/main?urlpath=rstudio)

## 貢献者

これはオープンなプロジェクトであり、どの人からの貢献も歓迎しています。 プロジェクトに参加するために、貢献者は[行動規範](CODE_OF_CONDUCT.md)を確認して従ってください。

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--7926--4935-brightgreen.svg)](https://orcid.org/0000-0002-7926-4935) [Socorro Dominguez Vidana](https://sedv8808.github.io/)

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--2700--4605-brightgreen.svg)](https://orcid.org/0000-0002-2700-4605) [Simon Goring](http://goring.org)

### 翻訳

* ロシア語　ー　[Arsenii Galimov](https://ipae.uran.ru/Galimov_AT)
* スペイン語　ー　[Deborah V. Espinosa-Martínez](https://orcid.org/0000-0002-3848-8094)
* 日本語　ー　[Socorro Dominguez Vidana](https://ht-data.com/about.html)

## リポジトリの使い方

このリポジトリには 2 つのR ワークフローをが含まれています。
Simple Workflowとはニオトマ２パッケージを使って、簡単な分析を行う方法を示すワークフローです。
Complex Workflowとはパッケージを使用して暦を管理および変更する方法を示すワークフローです。

ワークフローはコンテンツに合わせて変更ができます。　(例：さまざまなデータセット類や違う地理空間情報に焦点を当てる)

ユーザーはこのワークショップを複製してコンテンツを変更することができますが、Binderリンクはこのリポジトリに固有であり、ユーザーは自分の Binder セットアップをする必要があります。

* `runtime.txt` は、Docker/BinderのR環境を定義するために使っています。
* `apt.txt` は空間情報を使うためのパッケージをロードします。
