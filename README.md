## thewangcj.github.io
personal blog

## 环境要求：
ruby >= 2.4

## 本地启动方法
更换 gem 源：
```
gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```
安装 jekyll bundler:
```
gem install jekyll bundler
```
使用 bundler 安装需要的 gem 包:
```
bundle install
```
运行：
```
bundle exec jekyll serve
```