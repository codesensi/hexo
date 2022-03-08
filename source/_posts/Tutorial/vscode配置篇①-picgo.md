---
title: vscode配置篇①-picgo
description: vscode配置picgo
categories:
  - 教程工具
tags:
  - vscode
  - picgo
abbrlink: vscode-picgo
date: 2021-10-24 20:44:25
updated: 2021-10-24 20:44:25
---

## 前言

> 使用hexo+GitHub搭建好了静态博客之后，剩下的事就是专心写文章了
> 工欲善其事，必先利其器
> 我个人最推荐的工具是`Visual Studio Code`，即`vscode`，[官网下载地址](https://code.visualstudio.com/Download)
> 推荐理由：只在一个软件内就可以完成从写文章到部署的全部工作，并且`vscode`插件丰富
> 使用`vscode`配置`picgo`插件的方式可以实现插入图片的同时上传图片到指定图床，此文章以配置`picgo`上传`github图床`作为演示

## 配置

### 安装插件

在`vscode`的扩展中搜索`picgo`和`Chinese`安装两款插件

![2021-10-24-17-10-33](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-24-17-10-33.png)

### 更改默认配置

详细配置可以访问[插件官网](https://marketplace.visualstudio.com/items?itemName=Spades.vs-picgo)

- 点击左下角`管理`-`设置`

![2021-10-24-17-18-06](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-24-17-18-06.png)

- 依次在`用户`-`扩展`下找到`PicGo`

![2021-10-24-17-21-14](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-24-17-21-14.png)

- 按照如下图所示进行相关配置

![2021-10-24-17-27-53](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-24-17-27-53.png)

`配置说明`

> Pic Bed:Current表示：picgo上传图片的默认图床
> Github:Branch表示：在GitHub创建的图床分支
> Github:Custom Url表示：图片上传成功后返回的图床地址
> `此项配置为选填项，不配置默认是GitHub图床的仓库地址，我这里用了jsdelivr作为cdn加速，所以填写jsdelivr的加速地址`
> Github:Path表示：上传图片在GitHub图床中的具体地址
> Github:Repo表示：GitHub图床的仓库名，格式是 用户名/仓库名
> Github:Token表示：在GitHub账户中设置的Personal access tokens

- 扩展配置

配置上传成功后返回的图片名称格式

![2021-10-24-17-42-39](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-24-17-42-39.png)

### 快捷键

![2021-10-24-18-06-00](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-24-18-06-00.png)

> Windows系统
> Ctrl + Alt + U：从剪贴板上传
> Ctrl + Alt + E：从资源管理器上传

## 总结

配置完成，从`vscode`的`setting.json`文件中可以看到配置的内容

![2021-10-24-18-03-55](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/2021-10-24-18-03-55.png)