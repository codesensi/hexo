---
title: ubuntu20.04.3使用docker安装mysql8
description: ubuntu20.04.3使用docker安装mysql8
categories:
  - Docker容器
tags:
  - ubuntu
  - docker
  - mysql
abbrlink: ubuntu20.04.3-docker-mysql8
date: 2022-02-26 20:44:25
updated: 2022-02-26 20:44:25
---

## 拉取镜像

```Shell
docker pull mysql
```

## 配置文件
```Shell
mkdir -p /home/docker/mysql/{conf,data}
```

## 临时容器

```Shell
docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
```

## 复制配置文件

```Shell
docker cp mysql:/etc/mysql/my.cnf /home/docker/mysql/conf/my.cnf
```

## 删除临时容器

```Shell
docker rm -f mysql
```

## 修改配置文件

```Shell
vim /home/docker/mysql/conf/my.cnf
```

将以下内容复制到my.cnf

```Text
[client]
default-character-set=utf8mb4

[mysqld]
default-authentication-plugin=mysql_native_password
```

## 运行容器

```Shell
docker run --name mysql -p 3306:3306 \
  -v /home/docker/conf:/etc/mysql/conf.d \
  -v /home/docker/data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  --restart=always -d mysql:latest
```