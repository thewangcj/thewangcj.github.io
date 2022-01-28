---
layout:     article

title:      "Centos7 打造 C/C++ 开发环境"

subtitle:   ""

date:       2022-1-27

author:     "thewangcj"

header-img: ""

catalog: false

tags:
    - C Linux VSCode


typora-root-url: ..
---

> “llvm 大法好”

------

<!--more-->

工作后公司的开发环境都是 Centos7，自带的一些软件都非常老，摸索了很久，总算是搭建了一个相对较为舒适的开发环境，下面介绍一下搭建过程。

1. GCC 版本问题
   Centos7 使用 yum 安装的 GCC 版本是 4.8.5，蛮老的版本了，现在稍微新一点的库都要求 GCC5 以上，但是重新编译安装最新的GCC又特别麻烦，而且不能在各个版本的 GCC 之间来回切换，不够灵活，刚好
2. Git 代理
3. LLVM 编译安装
4. Bear 编译安装
   
5. 使用 VSCode 阅读调试代码
   微软官方提供的 C/C++ 插件调试还是可以的，但是在代码跳转上就有点拉了胯了，我工作中 dpdk 用的多一点，dpdk 里的一些结构体用微软的插件就没办法直接鼠标放上去进行预览，单用 clangd 就没这个问题，因此接下来使用 clangd 来提供代码的提示导航等功能，使用微软的插件调试代码。

首先请参考之前的文章 "VS Code 配合 WSL 搭建 C/C++ 开发环境" 装好 VSCode ，然后装好 `Remote SSh` 插件方便远程开发，