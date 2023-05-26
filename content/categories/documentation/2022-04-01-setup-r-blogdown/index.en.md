---
title: 'Setup R blogdown '
author: Ming
date: '2022-04-01'
slug: []
categories:
  - documentation
tags: []
subtitle: ''
lastmod: '2023-05-26T12:33:51-07:00'
authorLink: ''
description: ''
license: ''
images: []
featuredImage: ''
featuredImagePreview: ''
hiddenFromHomePage: no
hiddenFromSearch: no
twemoji: no
lightgallery: yes
ruby: yes
fraction: yes
fontawesome: yes
linkToMarkdown: yes
rssFullText: no
toc:
  enable: yes
  auto: yes
code:
  copy: yes
  maxShownLines: 50
math:
  enable: no
mapbox: ~
share:
  enable: yes
comment:
  enable: yes
library:
  css: ~
  js: ~
seo:
  images: []
---


# install hugo
If got error message with `remotes::install_github`, try [this](https://github.com/rstudio/blogdown/issues/727`): `remotes::install_github('rstudio/blogdown')`

# check package version,
`blogdown::hugo_version()`
`[1] ‘0.74.3’`

# pick a theme and install 
`blogdown::new_site(theme = "dillonzq/LoveIt")`

To start a local preview: use `blogdown::serve_site()`, or the RStudio add-in "Serve Site"

The web server can be stopped by `blogdown::stop_server()`, and it will always be stopped when the R session is ended, so you can restart your R session if `stop_server()` fails to stop the server for some reason.

# insert images when posting

Just save images in in the same folder as the post document, for example, `posts/2022-08-16-无他-但手熟尔/xxx.png`


Useful tutorial:

- https://www.kirenz.com/post/2019-07-20-up-and-running-with-blogdown/
- https://seanlee0622.medium.com/create-and-publish-a-website-with-r-and-hugo-2b7d1ff236f5
- https://toruniina.github.io/posts/building-a-website-powered-by-hugo-and-loveit/


<!--more-->
