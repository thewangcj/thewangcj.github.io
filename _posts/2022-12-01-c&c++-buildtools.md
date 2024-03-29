---
layout:     article

title:      各种 C/C++ 编辑构建工具总结

subtitle:   ""

date:       2022-12-1

author:     "thewangcj"

header-img: ""

catalog: false

tags:
    - 工具
---

> “写 makefile 好难啊”

------

<!--more-->
我工作一般都是用C，总是会遇到各种各样的构建工具，有的看似简单有的看似复杂，虽然最后真的看下去都很复杂是了，工作一年多以来踩了好多的坑，总结了一篇各类构建工具的入门文章。
## makefile

## automake

## cmake

## meson
meson 是一个类似 CMake 的构建工具
### 优点：
1. 支持Linux/macOS/Windows
2. 支持多种编译器，如 GCC, Clang, Visual Studio 等
3. 支持多种编程语言, 包括 C, C++, D, Fortran, Java, Rust
4. 语法可读性好, 而且是对用户友好的非图灵完备(non-Turing complete) DSL
5. 支持多种操作系统及裸机(bare metal)的交叉编译
6. 完整编译或增量编译速度很快
7. 内置多平台依赖项解决支持

### 安装（Ubuntu）
```shell
sudo apt install python3
pip3 install ninja
pip3 install meson
```
### 一般套路
类似 CMake，meson 也将源码目录和编译目录分开，避免污染源码目录
```shell
# 在源码目录中准备meson.build文件
cd <sourcedir>
meson <builddir>
cd <builddir>
meson compile # 或执行ninja等
```
### Hello World
#### 源码：main.c
```C
#include <stdio.h>

int main(void)
{
    printf("Hello World\n");
    return 0;
}
```

#### meson.build
```Makefile
project('hello_world', 'c')
executable('hello', 'main.c')
```

#### 编译
```shell
meson ../build
cd ../build
meson compile
```
编译后会在 main.c 的上级目录 build 里生成可执行文件
