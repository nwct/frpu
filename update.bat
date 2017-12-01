@echo off
cd %~dp0
set /p m=请输入标记：
set /p http=请输入项目网址：
git init
git add .
git commit -m "%m%"
git remote add origin %http%
git push -u origin master
pause
