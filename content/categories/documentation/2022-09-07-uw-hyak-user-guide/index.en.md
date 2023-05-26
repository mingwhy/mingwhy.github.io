---
title: UW Hyak User Guide
author: Ming
date: '2022-09-07'
slug: []
categories:
  - documentation
tags: []
subtitle: ''
lastmod: '2023-05-26T13:40:17-07:00'
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



UW hyak wike page: https://wiki.cac.washington.edu/display/hyakusers/WIKI+for+Hyak+users

# login and logout
```
# log in
$ ssh <uwnetid>@mox.hyak.uw.edu

# when you are done, end the interactive session via:
$ exit
```

# Three nodes:
- **login nodes**: check folder or files, submit job, check job running status
- **compute nodes**: doing real computation work
- **build nodes**: interactive environment, install packages, use R
slurm

We share a so-called 'csde' account with some other labs, in total, we have access to 3~4 nodes.
Each node contain 24~36 cores, which means we can 'occupy' one node and run 24 programs in parallel.

You may need to contact with hyak people to add you to your research group on the hyak.

```
# check you group membership in hyak:
$ groups username

# how to check if there are available computing resources?
$ squeue -p csde
$ squeue -u username
$ sacct 
```


# First time login
login via: ssh \<uwnetid\>@mox.hyak.uw.edu

- **home path**: limited storage space (~5G per user)

- **lab purchased space path**: (2T in total)

- **hyak shared path**: `/gscratch` 
   You can use as much as space as you like in this shared path(eg,big intermediate files while running plink), every file or folder would be deleted after 30 days since creatation (https://wiki.cac.washington.edu/display/hyakusers/Managing+your+Files).

# After login, basic bash commands

Just some examples as below:

```
$ ls
$ cd
$ pwd
$ mkdir
$ mv
$ cp
$ rm
$ ctrl+c #force quit
```

# Transferring files

```
$ sftp username@mox.hyak.uw.edu
upload: put xx
download: get xx

on server: cd, pwd, ...
in local: lcd, lpwd, ...

when you are done:
$ bye
```

# What you can do in an interactive env

## Enter the interactive env

**Time format days-hours:minutes:seconds**

```
$ srun -p build --time=1:00:00 --mem=20G --pty /bin/bash
$ srun -p csde -A csde --nodes=1 --ntasks-per-node=20 --time=4:00:00 --mem=100G --pty /bin/bash

# if run successful, notice the changes in `[xxx]$`

# when you are done, end the interactive session via:
$ exit
```

## Loading software: the modules system

```
$ module avail
$ module avail | grep 'plink'
$ module load xxxx
$ module unload xxxx
```

## Enter R in this env


# Submit jobs using sbatch with a slurm file

Jobs submission via slurm file can keep the program running on the hyak server even if you logout.

```
# always check node availability before submitting jobs
$ sacct
$ squeue -p csde

$ sbatch -p csde -A csde ym.slurm
$ sbatch --account=csde-ckpt --partition=ckpt ym.slurm 

# if you want to stop the submitted job before it ends
$ squeue -u username #get your job ID
$ scancel xxxx 
```

## What's a slurm file 

Below is the simpliest slurm file which is `runnable`

```
#!/bin/bash
## Walltime (2 hours)
#SBATCH --time=10-24:00:00
## Memory per node
#SBATCH --mem=100G

Rscript server_rank_aggregation_per_edge_01.R

```
Some more exmples: https://github.com/seanb80/seanb80.github.io/wiki/Hyak:-Executing-job-via-sbatch

## Submit via sbatch

```
[username@mox1 ~]$ sbatch -p csde -A csde test.sh 
Submitted batch job 258878

$ squeue -p csde
$ squeue -u username
$ scontrol show job xxxx
$ scancel xxxx
```

# A used case: run plink

A used script can be assessed from: https://github.com/mingwhy/AD_fly_eye_2021/blob/main/02_gene.level.gwas/02_gene.level.gwas.Rmd

or read the html file directly : https://htmlpreview.github.io/?https://github.com/mingwhy/AD_fly_eye_2021/blob/main/02_gene.level.gwas/02_gene.level.gwas.html


```
## load plink module
$ module avail | grep 'plink'
$ module load contrib/plink/1.90
$ plink --version

if you install your own plink version
$ module unload contrib/plink/1.90
$ /gscratch/group_name/username/plink-ming-dgrp/plink_linux_x86_64_20200428/plink --version

## prepare required files (DGRP genotype, eye-score phenotype)
$ mkdir dgrp2_example;
# this folder contains `dgrp2.bed, dgrp2.bim, dgrp2.fam` files downloaded from dgrp2 database 
$ less eye-pheno-162.txt 

## filter DGRP lines and generate `dgrp2-162lines.bim, dgrp2-162lines.bed, dgrp2-162lines.fam` files.
$ cut -f1 eye-pheno-162.txt | sed '1d' >dgrp2_example/retain.DGRPlines
$ cd dgrp2_example;
$ plink --bfile ./dgrp2 --keep-fam retain.DGRPlines --make-bed --out dgrp2-162lines

## calculate allele freq and count missingness: 
# plink.lmiss, plink.imiss, plink.frq files are generated.
$ plink --bfile ./dgrp2-162lines --freq --missing

## generate some diagnostic plot

$ R # enter R
# below are code after entering R env
pdf('test.pdf')
par(mfrow=c(1,2))
call=read.table("plink.lmiss",header=T,as.is=T)
call$rate=1-call$F_MISS
x<-quantile(call$rate,probs=seq(0,1,0.0001))
plot(seq(0,1,0.0001),x,xlab='Quantile',ylab='Genotype call rate',
     main='Genotype call rate.\nThe red horizontal line represents the 0.8 SNP call rate');
abline(h=0.8,col='red',lwd=2)

maf=read.table("plink.frq",header=T,as.is=T)
hist(maf$MAF,xlab='MAF',main='Minor allele frequency (MAF).\nThe red verticalline represents MAF=0.05')
abline(v=0.05,col='red',lwd=2)
rm(maf);rm(call);
dev.off() 
quit() #quit R env


## filter SNPS vias allele frequency within [0.05,0.95] and missingness<20%

# select genetic variants with MAF>=0.05 && <=0.95
$ awk '{if($5>=0.05 && $5<=0.95){print $2}}' plink.frq >maf0.05-snps.txt 
$ wc -l maf0.05-snps.txt 
 1983182 maf0.05-snps.txt

# Genotype call rate: Select SNPs with a genotype call rate of 80%. 
$ awk '{if($5<0.2){print $2}}' plink.lmiss >nmiss0.8-snps.txt 
$ wc -l nmiss0.8-snps.txt 
  4307065 nmiss0.8-snps.txt

# get their intersect
$ comm -12 <(sort -i maf0.05-snps.txt ) <(sort -i nmiss0.8-snps.txt ) > snps.txt
$ wc -l snps.txt 
 1890968 snps.txt

$ plink --bfile ./dgrp2-162lines --extract snps.txt --make-bed --out dgrp2-162lines.maf0.05

## generate genotype-relateness matrix as covaraites in GWAS 
`eye-assoc.txt` copied from https://github.com/mingwhy/AD_fly_eye_2021/tree/main/02_gene.level.gwas/GWAS.analysis/input_files

## run plink
$ cd ..
$ pwd
$ plink --bfile ./dgrp2_example/dgrp2-162lines.maf0.05 --pheno ./eye-pheno-162.txt --covar ./eye-assoc.txt keep-pheno-on-missing-cov --linear hide-covar --out rene_test_plink

```

Or try use `sbatch` to submit a job on hyak running in the background while you've logged out of hyak.

```
$ cat test.slurm
#!/bin/bash
## Walltime (2 hours)
#SBATCH --time=10-24:00:00
## Memory per node
#SBATCH --mem=100G

module load contrib/plink/1.90
plink --bfile ./dgrp2_example/dgrp2-162lines.maf0.05 --pheno ./eye-pheno-162.txt --covar ./eye-assoc.txt keep-pheno-on-missing-cov --linear hide-covar --out rene_test_plink

```

```
$ sbatch -p csde -A csde test.slurm
$ squeue -u username #get the job ID
```

