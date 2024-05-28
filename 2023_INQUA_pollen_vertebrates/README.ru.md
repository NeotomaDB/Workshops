[![language-EN](https://img.shields.io/badge/language-EN-red)](README.md) [![language](https://img.shields.io/badge/language-ES-red)](README.es.md) [![language-RU](https://img.shields.io/badge/language-RU-red)](README.ru.md)
[![language-JP](https://img.shields.io/badge/language-JP-red)](README.jp.md)

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![NSF-1948926](https://img.shields.io/badge/NSF-1948926-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1948926)

# Neotoma Current R Workshop

Репозиторий для проведения интерактивных семинаров по R. Этот репозиторий всегда будет содержать самую последнюю/текущую Neotoma Workshop. Все прошедшие семинары будут храниться в архивном репозитории  [Neotoma Workshops](https://github.com/NeotomaDB/Workshops). 

Этот репозиторий построен таким образом, что позволяет работать в онлайн режиме через RStudio с использованием Binder (и Docker). Щелкнув ссылку Binder, вы откроете RStudio в браузере пользователя.

**В данный момент, в этом репозитории хранится семинар, который будет проведен онлайн и называется: UQAM GEOTOP workshop**

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/NeotomaDB/Current_Workshop/main?urlpath=rstudio)

## Авторы

Это открытый проект и приветствуется вклад всех желающих. Участники проекта связаны [Правилами поведения](CODE_OF_CONDUCT.md). Пожалуйста, ознакомитесь с правилами и следуйте им, это является обязательным условием для участников проекта.

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--7926--4935-brightgreen.svg)](https://orcid.org/0000-0002-7926-4935) [Socorro Dominguez Vidana](https://sedv8808.github.io/)

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--2700--4605-brightgreen.svg)](https://orcid.org/0000-0002-2700-4605) [Simon Goring](http://goring.org)

* перевод: [Arsenii Galimov](https://ipae.uran.ru/Galimov_AT)
* испанский: [Deborah V. Espinosa-Martínez](https://orcid.org/0000-0002-3848-8094)
* Японский: [Socorro Dominguez Vidana](https://ht-data.com/about.html)

## Как использовать репозиторий

В репозитории содержится два разных R workflow (фиксированный пошаговый процесс обработки данных и отчетности): **сложный рабочий процесс** показывает как управлять хронологиями (*наборы данных Neotoma*) и изменять их с помощью пакета R, и **простой рабочий процесс**, который показывает как получить доступ к данным и выполнить относительно простой анализ. Эти рабочие процессы могут быть изменены под ваши задачи (например, сделать акцент на разные типы наборов данных или геопространственные данные).

Пользователи могут клонировать это рабочее пространство и модифицировать содержимое, но важно помнить, что ссылки Binder связаны именно с этим репозиторием и должны быть измененны посредством собственного Binder.

* `runtime.txt` Используется для определения среды R, которая будет использоваться Docker/Binder
* `apt.txt` Используется для определения набора пакетов необходимых для работы Binder/Docker с досутпом к пространственным данным из пакета R `neotoma2`.
