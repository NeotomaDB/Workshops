[![language-EN](https://img.shields.io/badge/language-EN-red)](README.md) [![language](https://img.shields.io/badge/language-ES-red)](README.es.md) [![language-RU](https://img.shields.io/badge/language-RU-red)](README.ru.md)
[![language-JP](https://img.shields.io/badge/language-JP-red)](README.jp.md)

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![NSF-1948926](https://img.shields.io/badge/NSF-1948926-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1948926)

# Neotoma Current R Workshop

Es un repositorio que albergar talleres interactivos de R. Este repositorio siempre estará configurado para el Neotoma Workshop más reciente/actual. Todos los talleras anteriores estarán almacenados en el repositorio[Neotoma Workshops](https://github.com/NeotomaDB/Workshops).

Este repositorio está construido de tal forma que permite que se trabaje en línea a través de la estructura necesaria para mostrar el contenido a través de RStudio usando Binder (y Docker). Cuando se haga click en el enlace Binder, RStudio se abrirá en el navegador del usuario.

**Actualmente, este repositorio contiene un taller que se llevará acabo en línea: UQAM GEOTOP.**

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/NeotomaDB/Current_Workshop/main?urlpath=rstudio)

## Colaboradores

Es un proyecto abierto y, la o las contribuciones de cualquier persona son bienvenidas. Todos los colaboradores en este proyecto están sujetos a un código de conducta (CODE_OF_CONDUCT.md). Por favor, revise y siga este código de conducta como parte de su contribución.

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--7926--4935-brightgreen.svg)](https://orcid.org/0000-0002-7926-4935) [Socorro Dominguez Vidana](https://sedv8808.github.io/)

* [![orcid](https://img.shields.io/badge/orcid-0000--0002--2700--4605-brightgreen.svg)](https://orcid.org/0000-0002-2700-4605) [Simon Goring](http://goring.org)

### Traducciones

* Ruso: [Arsenii Galimov](https://ipae.uran.ru/Galimov_AT)
* Español: [Deborah V. Espinosa-Martínez](https://orcid.org/0000-0002-3848-8094)
* Japonés: [Socorro Dominguez Vidana](https://ht-data.com/about.html)

## Como usar este repositorio

El repositorio contiene dos tipos diferentes de flujos de trabajo en R, un flujo de trabajo complejo que muestra cómo gestionar y modificar cronologías con el paquete en R, y un flujo de trabajo simple que muestra como acceder a los datos y realizar análisis relativamente simple. Estos flujos de trabajo pueden ser modificados para adaptar su contenido (por ejemplo, centrándose en los diferentes conjuntos de datos o contextos geoespaciales).

Los usuarios pueden clonar este taller y modificar el contenido, aunque se debe tener en cuenta que los enlaces Binder son específicos para este repositorio, por lo que tienen que ser modificados desde la configuración Binder de cada usuario.

* `runtime.txt` se utiliza para definir el ambiente R que se utilizará por Docker/Binder
* `apt.txt` define un conjunto de paquetes que son requeridos por Binder/Docker para habilitar las herramientas espaciales del paquete 'neotoma2' en R.
