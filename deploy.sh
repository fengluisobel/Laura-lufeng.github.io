#!/usr/bin/env sh

# 当发生错误时中止脚本
set -e

# 构建
# cd C:\Users\Felicia\Documents\GitHub\Laura-lufeng.github.io\
npm run build

# cd 到构建输出的目录下 
# cd dist
cd docs


git init
git add -A
git commit -m 'deploy'



# 部署到 https://<USERNAME>.github.io
# git push -f git@github.com:<laura-lufeng>/laura-lufeng>.github.io.git master
git push -f git@github.com:laura-lufeng/laura-lufeng.github.io.git master

# 部署到 https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<laura-lufeng>/<REPO>.git master:gh-pages

cd -

