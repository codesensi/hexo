---
title: postgresql替换字段内容
description: postgresql替换字段内容
categories:
  - SQL语言
tags:
  - postgresql
abbrlink: postgresql-replace
date: 2021-11-06 20:33:24
updated: 2021-11-06 20:33:24
---

## 前言

前两天在工作中遇到一个需求：

数据库中用一个字段保存了前端页面多选框的值，每个选项之间用英文逗号（,）分割

现在需要跟第三方对接，整理一批数据发送给第三方

但是第三方的数据库多选框存值与我们的不一致

例：我们多选框存值是`0,1,2,3,99`，第三方存值是`1,2,3,4,5`

彼此的映射是不同的

所以就需要我们在提供数据的将我们的映射关系转换成第三方需要的

一开始我的解决思路是先将多选框的值按照英文逗号（,）拆分出来，然后挨个按照新的映射转换

研究了许久，直到最后我看到了下边这两条`sql`语句

```Sql
--中间转换
UPDATE test set column = replace(replace(replace(replace(replace(column,'1','一'),'2','二'),'3','三'),'4','四'),'5','五');
UPDATE test set column = replace(replace(replace(replace(replace(column,'一','0'),'二','1'),'三','2'),'四','3'),'五','999');
```

## 后语

看完我不禁感慨道：我是真的菜啊！！！

单纯的记录一下菜，就酱