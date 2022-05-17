#!/bin/sh
echo "本地启动hexo...Start"
hexo clean
hexo server -p 8080
echo "本地启动hexo...Finish"
echo 按任意键继续
read -n 1