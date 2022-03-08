---
title: ubuntu20.04.3安装docker
description: ubuntu20.04.3安装docker
categories:
  - Docker容器
tags:
  - ubuntu
  - docker
  - apt-get
abbrlink: ubuntu20.04.3-docker
date: 2021-11-06 19:44:25
updated: 2021-11-06 19:44:25
---

[Docker官方安装文档](https://docs.docker.com/engine/install/ubuntu/)

## 卸载旧版本

```Shell
sudo apt-get remove docker docker-engine docker.io containerd runc
```

## 更新数据源

```Shell
sudo apt-get update
```

## 安装必备依赖

```Shell
sudo apt-get install -y ca-certificates curl gnupg lsb-release
```

## 安装GPG证书

```Shell
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

## 添加稳定数据源

```Shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://mirrors.aliyun.com/docker-ce/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## 更新数据源

```Shell
sudo apt-get update
```

## 安装最新版本

```Shell
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```

## 验证安装

```Shell
sudo docker --version
```

## 查看信息

```Shell
sudo docker info
```