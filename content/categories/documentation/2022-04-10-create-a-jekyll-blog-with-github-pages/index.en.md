---
title: Create a Jekyll blog with Github Pages
author: Ming
date: '2022-04-10'
slug: []
categories:
  - documentation
tags: []
subtitle: ''
lastmod: '2023-05-26T13:38:12-07:00'
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


Set up your personal academic website with [academicpages Jekyll Theme](https://github.com/academicpages/academicpages.github.io)+Github.io.

# Local jekyll

## 1. download [academic Theme](https://github.com/academicpages/academicpages.github.io) and install required software

Jekyll is a static site generator with built-in support for [GitHub Pages](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll). 

Assume you already have github account.

```
git clone https://github.com/academicpages/academicpages.github.io
```

upzip and you may want to change the name, for example, from `academicpages.github.io` to `myblog.github.io`.

change your working directory via:
```cd myblog.github.io````

Most of the time, Mac has `ruby` and `nodejs` installed already.
```
# brew install ruby // in case ruby was not installed
# brew install node // in case nodejs was not installed
gem install bundler // gem is the package manager for ruby
```

## 2. run a quick local test

```
bundle clean //organize downloaded project
bundle install //install dependences, if error message pop up, delete `Gemfile.lock`, try again
bundle exec jekyll liveserve
```

If the installation was successful, `bundle exec jekyll liveserve` would generate the HTML and you could visit it via `localhost:4000` or `http://127.0.0.1:4000/`. This local server will automatically rebuild and refresh the pages on change. Quit via `ctrl+c`.

An example page:
![](jekyll-template.png)

# Sync to Github

- create an new repo with the name `[username].github.io` with your github account online.
- in your local folder `myblog.github.io`, init git and commit changes
You may need to modify the `_config.yml` file to make it compatible with Github

In my case (pay attention to `url` and `repository`)
```
# Site Settings
locale                   : "en-US"
title                    : "xxx"
title_separator          : "-"
name                     : &name "xxx"
description              :
url                      : https://[username].github.io/ # the base hostname & protocol for your site e.g. "https://mmistakes.github.io"
#url                      : http://localhost:4000/ #for local test
baseurl                  : "" # the subpath of your site, e.g. "/blog"
repository               : "https://github.com/[username]/[username].github.io"
#repository               : "./[username].github.io-master" #for local test
teaser                   :  # filename of teaser fallback teaser image placed in /images/, .e.g. "500x300.png"
breadcrumbs              : false # true, false (default)
words_per_minute         : 160
future                   : true #if a blog with time in the future would be shown
```

```
git init
git add -A
git commit -m 'blog first setup'
git remote add origin https://github.com/[username]/[username].github.io.git
git branch -M main
git push https://[your.github.token]@github.com/[username]/[username].github.io.git main
```
- visit your github pages via `https://[username].github.io/` 

# Customization
## Locations of key files/directories

* Basic config options: _config.yml
* Top navigation bar config: _data/navigation.yml
* Single pages: _pages/
* Collections of pages are .md or .html files in:
  * _publications/
  * _portfolio/
  * _posts/
  * _teaching/
  * _talks/
* Static files (like PDFs): /files/
* Profile image (can set in _config.yml): images/profile.png

In my case, I modified `_config.yml` and `navigation.yml`, and several `xx.html` files in `_pages/`.

# publish Rmarkdowns to Jekyll website

Generate a `xx.html` file with Rmarkdown as usuall.
Edit the `xx.html` by adding contents as below to the very begining of this file:
```
---
layout: post
title: R color scheme
---

This Rmarkdown-generated html file show my frequently-used Rcolor schemes in scientific publication plots. 

```

An Rmarkdown example file can be found [here](https://github.com/mingwhy/mingwhy.github.io/blob/main/_talks/2022-08-28-ming_color_scheme.html),
with visual effect as: [R color scheme](https://mingwhy.github.io//talks/2022-08-28-ming_color_scheme/)

# check local server before sync

If you wrote a new blog and would like to have a look locally (on your own laptop) before sync to github.

1. modify `_config.yml`
```
#url                      : https://mingwhy.github.io/ # the base hostname & protocol for your site e.g. "https://mmistakes.github.io"
#repository               : "https://github.com/mingwhy/mingwhy.github.io"
url                      : http://localhost:4000/ #for local test
repository               : "./mingwhy.github.io-master" #for local test
```

2. run `bundle exec jekyll liveserve`

3. modify back `_config.yml` and sync.

# Resources
1. [Rob Williams's website](https://jayrobwilliams.com/) and his github [repo](https://github.com/jayrobwilliams/jayrobwilliams.github.io)
1. [中文：Jekyll 搭建个人网站](https://zhenggao.io/blog/2019/12/10/Jekyll-%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E7%BD%91%E7%AB%99/)
1. [Posting Rmarkdowns to your Jekyll website](https://jchellmuth.com/news/jekyll/website/code/2020/01/04/Rmarkdown-posts-to-Jekyll.html)




