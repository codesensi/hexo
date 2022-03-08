---
title: centos7.6安装docker
description: centos7.6安装docker
categories:
  - Docker容器
tags:
  - centos
  - docker
  - yum
abbrlink: centos7.6-docker
date: 2021-10-19 20:44:25
updated: 2021-10-19 20:44:25
---

[Docker官方安装文档](https://docs.docker.com/engine/install/centos/)

## 卸载旧版本

```Shell
sudo yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine
```

## 更新数据源

```Shell
sudo yum update -y
```

## 安装必备依赖

```Shell
sudo yum install -y yum-utils
```

## 添加稳定数据源

```Shell
sudo yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

## 安装最新版本

```Shell
sudo yum install -y docker-ce docker-ce-cli containerd.io
```

## 设置开机自启

```Shell
sudo systemctl enable docker
```

## 启动服务

```Shell
sudo systemctl start docker
```

## 配置镜像加速

### 创建配置文件目录

```Shell
sudo mkdir -p /etc/docker
```

### 配置加速

阿里云加速需要登陆阿里云账户，点击 [阿里云加速](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors) 获取加速镜像源。

<!--我的id：***** rft0kn6w -->

```Shell
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
      "https://阿里云id.mirror.aliyuncs.com",
      "https://registry.docker-cn.com",
      "https://dockerhub.azk8s.cn",
      "https://docker.mirrors.ustc.edu.cn",
      "https://reg-mirror.qiniu.com",
      "https://hub-mirror.c.163.com"
  ]
}
EOF
```

## 加载配置

```Shell
sudo systemctl daemon-reload
```

## 重启

```Shell
sudo systemctl restart docker
```

## 验证安装

```Shell
sudo docker --version
```

## 查看信息

```Shell
sudo docker info
```
