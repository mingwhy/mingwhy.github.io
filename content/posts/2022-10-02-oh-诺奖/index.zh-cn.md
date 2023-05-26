---
title: oh 诺奖
author: Ming
date: '2022-10-02'
slug: []
categories:
  - 随笔
tags:
  - 随笔
  - 学术生活
subtitle: ''
lastmod: '2023-05-26T13:32:46-07:00'
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

周一早上9点跟合作者开会，讨论文章revision，reviewer提出了蛮有趣的问题，在你们有multiple highly correlated trait的情况下，为什么不用PCA取出PC1，做一轮GWAS，而是选择了multi-trait GWAS的方法，有什么优势？
以及，既然这些trait是highly correlated，为什么identify出来的snp hit set，不同trait之间overlap并不大？

作为还在数量遗传学里面吭哧吭哧的小学鸡，翻了几篇做multi-trait GWAS on correlated traits的paper，也没看出个所以然。所幸合作者里面有一个人对GWAS很熟悉，在自己的研究系统某一种植物中，经常用multi-trait GWAS的方法来找候选基因。他提出两个有意思的点：

1，对于一个complext trait来说，底层的genetic architecture可能是被几个major loci dominant的，也可能是有许多minor effet loci所共同影响的。我们所看的trait看起来属于后一种情况，不然genetic basis早被研究透了（比如孟德尔当年的豌豆实验）。这些minor effect loci，由于effect size小，在做GWAS时候，很容易由于under power被miss掉。如果把correlated traits整合成为一个trait来做gwas，这些loci被发现的几率进一步降低了。保留每一个trait，有更大的几率发现suggestive loci，先把pool做大起来，再通过下游的方法来rank gene或者prioritize gene。

2，multi-trait GWAS的两一个好处跟error dilution或者error mitigation相关。做一个[思想实验](https://zhuanlan.zhihu.com/p/38303939)，目标是了解一个人群中身高的分布，但是由于‘不可知原因’，每个人的身高无法之间量取，但是可以量耻骨的长度、宽度，肋骨的长度、宽度等，这些trait跟身高都是高度相关的，理论上，整合起来，就能得到人群中身高的分布。但是，在量取每一个trait的时候，都会有measurement error，在整合过程中，这些error有机会被dilute掉。放在GWAS上，一群highly correlated trait，即使correlation达到0.8，在做GWAS时候，每个trait都会有自己独有的snp hit，以及和其他trait share的snp hit，是false positive还是true discover呢？从直觉上来讲，一个snp如果在多个trait的GWAS中都被发现了，那么它是true hit的几率会更大一些，类似整理这些snp hit的overlap关系时候，individual measure error被dilute掉了。

无独有偶，上午再看aging clock的paper的时候，看到 [A computational solution for bolstering reliability of epigenetic clocks: Implications for clinical trials and longitudinal tracking](https://www.nature.com/articles/s43587-022-00248-2) 这篇paper，里面提到了类似的‘diluting noise’的idea，解释为什么对 epigenetic marker先做PCA，再用PCA来构建clock是一种更reliable的方法，PC clock中的PC，整合了多个CpG位点的信息，effectively diluting noise from CpGs.

终于可以说到title了~ oh 诺奖！
今天最大的新闻，莫过于“2022年诺贝尔生理学或医学奖授予瑞典科学家斯万特·佩博”。
喜大普奔啊~~~ 作为一个evolution biology 和 population genetic 背景的人，感到自己的领域终于被诺奖委员会看到了！！
微信上的学术群里也是一片转发加兴奋表情包：感觉这是我离诺奖最近的一次！
看到各大微信公众号迅速跟进，纷纷发长文报道这件事情。被公众号的更新速度惊到了，我以前就不知道你们还关心古人类学的？

有两个公众号文章我个人很喜欢，一个是[果壳](https://mp.weixin.qq.com/s/UOrdNTQrDY7byN2RJOXf_A)的，一个是三联周刊专栏作家[土摩托](https://mp.weixin.qq.com/s/-1Sx58p1cPR43UwJNzlyWw)的。
果壳的文章贯彻了浓浓的八卦之魂，很好的勾勒了帕博随性自然的性格。土摩托的科普文干货就比较多了，不仅写了帕博的科学路径，也同时描写了帕博的科学团队和刻画了这段历史的科学环境，从个人兴趣，到职业选择，到冷泉港提出的人类基因组计划在帕博个人成就中起到的重要作用，以及波士顿broad institute在计算上面做出的巨大支持。DNA测序技术发明之后，测序这个热潮就没有退过，各种组学也是层出不穷。本人也算是见证了几次测序技术的‘升级’，生物数据的爆炸式增长，对于土摩托描写的技术进步和帕博科学发现之间的关系，很是能relate。

一个有趣的connection来了~ 土摩托的文中提到：
>在此后的两年多时间里，帕博和他的团队所经历的艰辛可想而知，这里只说一件小事：因为测序仪产出了海量的数据，即使马普调用了所有能找到的计算机供帕博使用，但运算能力还是不够，于是帕博只能请求位于波士顿的博德研究所（Broad Institute）提供支援。因为数据量大到无法通过网络传输，双方只能通过快递大容量硬盘的方式交换数据。就在截止日期到来的前6天，来自波士顿的18个大容量硬盘终于寄到了，发布会这才终于按期举行。

我一下子想起了当时第一张黑洞照片，似乎也是硬盘送到mit，mit的团队计算出来的。去翻了一下当时的[新闻](https://mp.weixin.qq.com/s/0JeQ-JYSyKKSjEWydsQG6A),果然如此！这篇当年的推送文
>而凯蒂提出的CHIRP算法，便是依靠干涉来重建黑洞的。
>具体来说，从银河中心传来的无线电信号，到达两台望远镜的时间是不一样的，干涉也是这样发生的。
>所以说，重建黑洞照片，最重要的就是时间差。
>可是，地球有厚重的大气层保护着，无线电波穿过大气层的时候，速度会变慢，时间的测定也就不够准确了。
>所以，小姐姐想出了一种机智的方法，来解决这个问题：
>如果每一个测量值，都是三台望远镜 (不是两台) 相乘的结果，**大气带来的误差就能相互抵消了**。
>这样一来，算法有了，团队便开始“冲洗”黑洞的照片了。

哈哈，又和 error dilution（误差抵消）碰上了！（I know I didn't give a clear definition of 'error dilution' throughout ... while, this is just a blog)

是不是应该说，科研里的刷子就是那么几把，一天碰上个几次，其实都很正常呢(P value>0.05). 类似之前在冷泉港开会，大家聊一聊，发现追溯academic tree 两到三个generation，大家都系出同门！

anyway，统计上的显著不显著，并不能determine我情绪上的起伏，转角遇到，开心还是开心；）
