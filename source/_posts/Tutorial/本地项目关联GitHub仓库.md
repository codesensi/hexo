---
title: 本地项目关联GitHub仓库
description: 本地项目关联GitHub仓库
categories:
  - 教程工具
tags:
  - git
  - github
abbrlink: git-github
date: 2022-03-08 20:44:25
updated: 2022-03-08 20:44:25
---

## 前言

本地项目与GitHub仓库关联分为两种情况：

- 本地已有git仓库

- 本地无git仓库

`文章只针对本地无git仓库的情况做记录`

## 创建GitHub仓库

在GitHub创建一个`与本地项目文件夹同名`的项目

![20220308215924](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/20220308215924.png)

`Add a README file`、`Add .gitignore`、`Choose a license`按照项目实际需求自行选择

## 初始化仓库

```Shell
git init
```

## 添加所有文件

```Shell
git add .
```

## 提交记录

```Shell
git commit -m 'first commit'
```

## 关联仓库

```Shell
# github_name：GitHub用户名
# repository_name：新建的仓库名，一般情况与本地项目文件夹同名
git remote add origin git@github.com:github_name/repository_name.git
```

## 拉取

```Shell
git pull origin master --allow-unrelated-histories
```

## 推送

```Shell
git push --set-upstream origin master
```