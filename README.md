## thewangcj.github.io
personal blog

## 环境要求：
Ruby >= 2.7（推荐使用项目的 `.ruby-version` 所指定版本）

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
