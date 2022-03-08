#!/bin/sh
echo "部署hexo...Start"
hexo clean
hexo generate
gulp
hexo deploy
echo "部署hexo...Finish"
echo 按任意键继续
read -n 1