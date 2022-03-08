---
title: vscode配置篇②-gitbash
description: vscode配置gitbash
categories:
  - 教程工具
tags:
  - vscode
  - gitbash
abbrlink: vscode-gitbash
date: 2021-10-25 20:44:25
updated: 2021-10-25 20:44:25
---

## 前言

> 使用hexo+GitHub搭建好了静态博客之后，剩下的事就是专心写文章了
> 工欲善其事，必先利其器
> 我个人最推荐的工具是`Visual Studio Code`，即`vscode`，[官网下载地址](https://code.visualstudio.com/Download)
> 推荐理由：只在一个软件内就可以完成从写文章到部署的全部工作，并且`vscode`插件丰富
> 新版本的`vscode`配置`gitbash`作为默认终端的方式与旧版本不一致，此文章以`vscode1.61.2`版本作为演示

## 安装git

下载`git`并安装，[官网](https://git-scm.com/downloads)

## 配置

- 在设置中搜索`setting.json`并打开配置文件

![2021-10-25-20-29-34](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-25-20-29-34.png)

- 将配置内容复制粘贴到文件内

`注意更改gitbash的路径为自己的git安装路径`
```JSON
{
    "terminal.integrated.profiles.windows": {
        "GitBash": {
            "path": "D:\\Exploitation\\Git\\bin\\bash.exe",//这里是gitbash的安装路径
            "icon": "terminal-bash"
        }
    },
    "terminal.integrated.defaultProfile.windows": "GitBash",//使用gitbash作为默认终端
}
```
![2021-10-25-20-34-54](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-25-20-34-54.png)

- 配置完成之后重启`vscode`，打开新终端即为`gitbash`

![2021-10-25-20-43-45](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-25-20-43-45.png)