---
title: linux安装docker-compose
description: linux安装docker-compose
categories:
  - Docker容器
tags:
  - linux
  - docker-compose
abbrlink: linux-docker-compose
date: 2021-11-03 20:44:25
updated: 2021-11-03 20:44:25
---

# 前言

- `docker-compose`从`2.0.0版本`开始，安装方式与旧版本不同。
- 本文分两部分记录两个版本的安装，如无特别说明，文章中`2.0.0版本`以下称为`V1`，`2.0.0版本`及以上称为`V2`。
- 安装`docker-compose`之前必须已经成功安装`docker`。
- centos系统可查看此文章安装`docker`：[centos7.6安装docker](https://codesensi.cn/docker/centos7.6-docker/)
- ubuntu系统可查看此文章安装`docker`：[ubuntu20.04.3安装docker](https://codesensi.cn/docker/ubuntu20.04.3-docker/)

图不重要~

![2021-11-03-19-59-48](https://image.codesensi.cn/hexo/post/2021-11-03-19-59-48.png)

# V1版本安装

[Docker Compose官方安装文档（旧版本）](https://docs.docker.com/compose/install/)

## 安装

下载`docker-compose`至`/usr/local/bin/`路径下

```Shell
sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

截至文章发布日，`1.29.2版本`为`V1`最新版本，如需安装更低版本，查看版本号更改即可：[Docker Compose版本发布](https://github.com/docker/compose/releases)

## 授权

将可执行权限应用于二进制文件

```Shell
sudo chmod +x /usr/local/bin/docker-compose
```

## 验证

验证是否安装成功
```Shell
docker-compose --version
```

显示`docker-compose version 1.29.2, build 1110ad01`字样即表示已安装成功。

# V2版本安装

[Docker Compose官方安装文档（新版本）](https://docs.docker.com/compose/cli-command/)

## 安装

依次执行以下命令下载`docker-compose`至当前用户目录的`/.docker/cli-plugins/`路径下

```Shell
mkdir -p ~/.docker/cli-plugins/

curl -SL https://get.daocloud.io/docker/compose/releases/download/v2.1.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
```

截至文章发布日，`v2.1.0版本`为`V2`最新版本，如需安装其他版本，查看版本号更改即可：[Docker Compose版本发布](https://github.com/docker/compose/releases)

## 授权

将可执行权限应用于二进制文件

```Shell
chmod +x ~/.docker/cli-plugins/docker-compose
```

<span style="color: red">以上`安装`和`授权`步骤仅为当前用户安装`docker-compose`，全局安装请将上述命令中的`~/.docker/cli-plugins`全部替换为`/usr/local/lib/docker/cli-plugins`，然后依次执行所有命令。</span>

## 验证

```Shell
docker compose version
```

显示` Docker Compose version 2.1.0`字样即表示已安装成功。