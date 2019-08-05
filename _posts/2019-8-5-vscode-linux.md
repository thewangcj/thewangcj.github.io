---
layout:     article

title:      "VS Code 配合 WSL 搭建 C/C++ 开发环境"

subtitle:   ""

date:       2019-8-5

author:     "thewangcj"

header-img: ""

catalog: true

tags:
    - 开发环境
---

> “WSL 真香”

---
最近在看 《TCP/IP网络编程》，韩国人写的，讲解了 Windows 和 Linux 平台下的网络编程，才看了四章，感觉通俗易懂，值得一读。出版社网站上提供了源码，平时主要使用 Windows，为了看本书切换到 Linux 感觉有些麻烦，刚好微软推出了`WSL`，试一试能不能用它来编译运行代码。

`WSL`全程`Windows Subsystem for Linux`，是一个 windows 下的 Linux 子系统，相比于虚拟机，它启动非常迅速，占用空间小，可以方便的访问 Windows 下的文件资源，相对的功能上没有虚拟机那么强大，不过平时用来编译代码足够了。
`WSL`的安装过程网上一大把，大概描述一下：在 win10 小娜搜索界面输入`启用或关闭Windows功能`，然后勾选`勾选适用于Linux的Windows子系统`，接下来会让你重启，重启过后打开应用商店，搜索 Linux，win10 提供了多个 Linux 发行版本，挑一个自己喜欢的就可以了，我选的是`Ubuntu18.04 LTS`，点击安装过后设置完用户名和密码以及 root  密码，安装就结束了。如果是`Ubuntu`用户的话，建议吧软件源换成阿里云，这里就不在赘述，自行百度。

`WSL`安装完后可以通过`apt`自行安装需要的开发软件，如`Python`、`GCC`，没什么特别的。Windows 下的磁盘挂载在 `/mnt`目录下，也可以打开 Windows 资源管理器，在任意文件夹下按住`Shift + 右键`，选择`在此处打开Linux Shell`。

到了这一步就可以在 VS Code 中看代码，在`WSL`里编译运行了，注意`C/C++` 开发者要安装微软官方提供的`C/C++`插件，Python 也一样，方便提供代码格式化等功能。不过 VS Code 中许多 Linux 下的头文件找不到，看着红红的下划线就很烦躁，刚好最近微软推出了一款VS Code插件`Remote - WSL`，它能够让你在使用 VS Code 的同时，把`WSL`作为开发环境，使用 Linux 下的工具链，使用起来很简单，首先确保安装了`1.35`或者以上版本的 VS Code，然后在`拓展`界面搜索`Remote - WSL`安装即可。接下来打开你的项目所在文件夹，然后使用我上面说的方法在这个文件夹下打开`WSL`，然后输入 `code .`，这时会自动的打开一个 VS Code，之前安装的 VS Code 插件此时需要在`WSL`下重新安装一遍，在拓展页面会显示`安装 on WSL`，点击即可，`ctrl + \` 可以在调出`WSL`。如果你是 Python 开发者，`windows + shift + p`然后输入`Python: Select Interpreter`可以选择`WSL`下的 python 解释器。

现在 VS Code 中 Linux 相关的函数查看定义等功能都可以正常使用了，讨厌的下滑线消失了，现在就可以用 VS Code 在`WSL`环境下编辑运行C/C++代码了，省的开虚拟机或者切换系统了，舒服。




