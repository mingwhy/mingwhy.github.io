---
title: 我听错了吗 ? <看不见的女性> 读后感
author: Ming
date: '2022-10-14'
slug: []
categories:
  - 读书
tags:
  - 读后感
subtitle: ''
lastmod: '2023-06-02T11:30:40-07:00'
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


## 我听错了吗？

周一组会，round table，实验室成员轮流说最近自己在做什么。

phd candidate 小Y讲到他最近在处理的data，“这个实验规模很大，所以我们分成了三批来做。每批screen 50个genotype，每个genotype连续收了三天的数据，上机测序的时候，又pool成了不同的sample，...”
有批次，有实验日期，有测序channel，几个technical factor混杂在一起，在处理data的时候，哪些需要考虑哪些可以忽略呢？或者说，如何control batch effect呢？

因为之前自己处理过类似的data，我提出了一个想法，基于replicates variance来evaluate 不同technical factor的重要程度，以及设计batch effect removal pipeline。实验室另一位postdoc X，在我提出的想法基础上，提了几个常用的R包。
几番讨论过后，PI说：I think X’s idea is a a great one, worth trying.

我听错了吗？？！！

第一次发生，我只是感觉，也许自己的表达不够清晰，作为non-native speaker，我应该学习如何提炼自己的观点。

第二次发生，我怀疑，难道是我发音不好，大家其实根本就没有听清楚我在说什么？那为什么没有让我repeat自己的观点呢？

第三次发生，我只觉得愤怒：我被彻底的忽视了。

在一次和闺蜜的聚餐闲聊中，我忍不住吐槽了这件事，没想到，闺蜜一阵猛点头，然后说：我也有过这样的经历！
我意识到，不是我的错觉，也不是我太敏感，而是在一些公开场合，我的存在就是被有意无意忽略的。

## 看不见的女性 

在读[看不见的女性](https://book.douban.com/subject/35942057/) 这本书的时候，心中的许多疙瘩，被解开了。上一次看到这么生动鲜明的女权相关大众作品，还是 [美国夫人](https://movie.douban.com/subject/30366454/)。

原来这个系统，真的有很多对女性不友好的地方，而这些不友好，首先来自于对女性存在本身的忽略和漠视，其次是所伴随的女性数据缺口。

原来这个社会，就是存在很多对女性的偏见和规训，‘应该’有礼貌，‘不应该’强势，‘应该’谦虚，‘不应该’有野心，‘应该’以家庭为重，‘不应该’抛头露面。

我没有系统化的看过女权方面的书籍，可以说在女权方面没有什么完整的知识体系。很多时候，看相关的文章、听相关讨论，会一头雾水：还没搞清楚问题是什么，一堆名词已经把我砸晕了。总有一种感觉：我需要做很多的功课，才有谈论这个问题的资格。即使，我本身就是女性。

而这本书用扎实的数据告诉了我，生活的日常体验、方方面面，存在许多对女性的不友好；我的困惑和不满，不是错觉，而是系统设计的缺陷。理解到这一点，不需要任何高深的理论，因为，我作为一个女性，就真真切切的工作和生活在这个社会中，时刻与这个系统的缺失产生各种碰撞。比如，实验室里冻人的空调，洗手间怎么都排到不到尽头的队，总是衣服上的口袋放手机，etc。


## 系统的偏见和个人的声音

在生物领域，这样的性别数据缺口，近些年得到越来越多的关注。
比如，在基础科研中，以往的动物学实验，往往只是在一个性别中进行，而结果却可以’毫无责任‘的generalize到整个群体中。比如，测试一个药物是否可以有效延长寿命、是否可以调节节律周期、是否对肠道脏器健康you帮助。而当大家注意到性别差异，尤其是实验中雌性数据的缺失时，会发现，同一种药物，在雌性、雄性中的效果会如此的[不同](https://elifesciences.org/articles/63170)。

在那些容易量化的层面，意识到问题、关注到问题、开始做出改变，就是很好的信号，比如一个journal editorial board中女性的比例，学术会议中discussion panel，女性视角的重视，做项目时给女性参加者的credibility。

在个人层面，感受到不舒服、不满、愤怒，是自然的、个人真实的感受，在系统性的偏见面前，在这些感受之外，也有很多可以做的事情。比如，find your voice。

组会上让我不舒服的这些事情，有下文。后来，我给PI发了信息，说出了这些让我感觉invisible的时刻，用了婉转的问句：为什么我提出的想法常常被忽略，是我的表达方式问题吗？

PI回复我：不是你的问题，是大家潜意识里面的偏见，谢谢你告诉我这些。作为一个女性科研工作者，现在、将来，这样的情况可能会以各种形式一再发生。我会尽力提供一个supportive的环境。

我想，with minimal effort and more courage, 我随时可以做的是：在感觉被忽视的时候，向外界表达我的诉求，而不是无差别自我反省和自我归咎。

最后分享，一个曾看到热泪盈眶的[视频:凯特·温斯莱特回忆当初《泰坦尼克号》热映时，媒体对她体重的挑剔和嘲讽](https://weibo.com/3973989639/MmAzGglZC?type=repost&sudaref=www.google.com)。

```“如果时光倒回，我会对媒体做出截然不同的回应：你们不可以这么对待我。这是对年轻女性的霸凌。”```

**Find your voise.**

**Use your voise.**

