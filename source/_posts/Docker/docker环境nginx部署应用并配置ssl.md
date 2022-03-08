---
title: docker环境nginx部署应用并配置ssl
description: docker环境nginx部署应用并配置ssl
categories:
  - Docker容器
tags:
  - docker
  - nginx
  - ssl
abbrlink: docker-nginx-ssl
date: 2021-10-19 21:18:56
updated: 2021-10-19 21:18:56
---

## docker部署nginx

[linux使用docker部署nginx](https://codesensi.cn/docker/linux-docker-nginx/)

## 部署静态项目

将项目上传至`/usr/share/nginx/html`挂载在宿主机的资源目录下，此处为：`/home/docker/nginx/html`

`注：index.html处于根目录`

![image.png](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/202110192126964.png)

## 重启nginx

```Shell
sudo docker restart nginx
```

## 配置ssl

## 修改配置文件

```Shell
cd /home/docker/nginx/conf.d
vim demo.conf
```

按需复制以下内容粘贴到`demo.conf`  

- 静态项目使用

```Shell
server {
    listen 80; # 监听80端口
    server_name demo.com www.demo.com;  # 绑定证书的域名
    #把http的域名请求转成https
    return 301 https://$host$request_uri; 
}

# 强制重定向
server {
    listen 443 ssl;
    server_name demo.com www.demo.com;  # 自己的域名
    ssl_certificate /home/cert/4312001_demo.top.pem;
    ssl_certificate_key /home/cert/4312001_demo.top.key;
    ssl_session_timeout 5m;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE;
    ssl_prefer_server_ciphers on;

    location / {
        root /usr/share/nginx/html;
        index index.html;
        proxy_set_header HOST $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

- 非静态项目使用

```Shell
upstream demo {
  server 127.0.0.1:8080;
}

server {
     listen 80; # 监听80端口
     server_name demo.com www.demo.com;  # 绑定证书的域名
     #把http的域名请求转成https
     return 301 https://$host$request_uri; 
}

# 强制重定向
server {
    listen 443 ssl;
    server_name demo.com www.demo.com;  # 自己的域名
    ssl_certificate /home/cert/demo.com.pem;
    ssl_certificate_key /home/cert/demo.com.key;
    ssl_session_timeout 5m;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE;
    ssl_prefer_server_ciphers on;

    location / {
        proxy_pass http://demo;
        proxy_set_header HOST $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

`注：upstream demo {server 127.0.0.1:8080;} 中，demo是部署在服务器中的非静态项目名称，8080是端口号`

## 上传ssl证书

此处上传路径为：`/home/docker/nginx/cert`

![image.png](https://cdn.jsdelivr.net/gh/codesensi/picture@main/stage/blog/202110192133381.png)

## 重启nginx

```Shell
sudo docker restart nginx
```

浏览器使用域名访问即可
