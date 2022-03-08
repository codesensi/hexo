#!/bin/sh
echo "本地启动hexo...Start"
hexo clean
hexo server
echo "本地启动hexo...Finish"
echo 按任意键继续
read -n 1