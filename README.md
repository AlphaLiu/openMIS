###README

####介绍：
项目名称: 企业进销存管理系统

项目组成员: 刘晓生 黄进然 黄彩娟 罗庆年

程序: 刘晓生

#####开源协议：
本软件基于 GPLv2 协议开源，源代码存放在 [github](https://github.com/AlphaLiu/openMIS)，软件部署在 [heroku](http://openmis.herokuapp.com)。

#####安装：
1. 请先从 [rubyonrails 官方网站](http://rubyonrails.org/download)下载 ruby 和 rails 的安装包进行安装。
2. 本软件数据库需要用 sqlite，请从其[官方网站](http://www.sqlite.org/download.html)下载安装。
3. 进入软件目录，在命令行模式下运行 ```bundle install```。
4. 在命令行模式下运行```rake db:setup```
5. 在命令行模式下运行```rails s```
6. 在浏览器输入```http://127.0.0.1:3000``` 访问。