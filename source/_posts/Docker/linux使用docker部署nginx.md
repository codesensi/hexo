---
title: linux使用docker部署nginx
description: linux使用docker部署nginx
categories:
  - Docker容器
tags:
  - linux
  - docker
  - nginx
abbrlink: linux-docker-nginx
date: 2021-10-19 21:03:46
updated: 2021-10-19 21:03:46
---

## 安装docker

centos系统：[centos7.6安装docker](https://codesensi.cn/docker/centos7.6-docker/)
ubuntu系统：[ubuntu20.04.3安装docker](https://codesensi.cn/docker/ubuntu20.04.3-docker/)

## 拉取镜像

```Shell
sudo docker pull nginx
```

## 创建相关路径

```Shell
sudo mkdir -p /home/docker/nginx/{html,conf.d,logs,cert}
```

参数说明：
> `html：存放静态项目`
> `conf.d：存放配置文件`
> `logs：存放日志文件`
> `cert：存放ssl证书`

## 授予访问权限

```Shell
sudo chmod -R 777 /home/docker/nginx
```

## 运行临时nginx

```Shell
sudo docker run -p 80:80 --name nginx -d nginx
```

## 复制配置文件到宿主机

```Shell
sudo docker cp nginx:/etc/nginx/conf.d /home/docker/nginx
sudo docker cp nginx:/etc/nginx/nginx.conf /home/docker/nginx
```

## 删除临时nginx

```Shell
sudo docker rm -f nginx
```

## 运行nginx

```Shell
sudo docker run --name nginx \
    -p 80:80 -p 443:443 \
    -v /home/docker/nginx/html:/usr/share/nginx/html \
    -v /home/docker/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v /home/docker/nginx/conf.d:/etc/nginx/conf.d \
    -v /home/docker/nginx/logs:/var/log/nginx \
    -v /home/docker/nginx/cert:/home/cert \
    -d --net=host --restart always nginx
```

注意事项：

- 若无需nginx代理静态项目则删除：`-v /home/docker/nginx/html:/usr/share/nginx/html \`
- 若无需nginx配置https访问则删除：`-v /home/docker/nginx/cert:/home/cert \`

参数说明：

> `-p: 指定端口映射，格式为：宿主机端口:容器端口`  
> `-v：挂载宿主机目录到容器，格式为：宿主机目录:容器目录`  
> `--net-host：指定容器的网络连接类型，支持bridge/host/none/container`

## 查看正在运行的docker容器

```Shell
sudo docker ps
```

## 查看页面

宿主机在浏览器地址栏使用服务器ip访问

![image.png](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/202110192100140.png)
