---
layout:     article

title:      "记录一次 Windows 下 python 编码问题"

subtitle:   ""

date:       2018-1-30

author:     "thewangcj"

header-img: "http://omt7czj31.bkt.clouddn.com/image/2018-1-30-bg.jpg"

catalog: false

tags:
    - python3
---

> “GBK 果然是万恶之源”

---
在 GitHub 上看到有人把 GitHub 当成收藏夹，放了许多轻音乐，看的我心痒难耐，fork 了一个，项目在
[maitian](https://github.com/thewangcj/maitian)，或者你可以通过[麦田](https://thewangcj.top/maitian)访问。
<!--more-->

这其实是个很简单的项目，只需要用到一些简单的 HTML CSS 技术，但是原作者是直接把音乐的文件名写在 js 文件里，
一个个复制有些麻烦，于是想用 python 完成这件事，说干就干，然后问题来了，用`os.listdir`遍历后再 Windows cmd 下测试，然后就报错了->->

---
```
UnicodeEncodeError: 'gbk' codec can't encode character '\u30fb' in position 593: illegal multibyte sequence
```

编码有问题，那好开始检查，文件 uft8 没问题，代码 utf8 没问题，那应该没问题啊，开始百度，研究了两个小时
python 编码问题，还是没有解决，然后突发奇想，把代码在 idle 上运行了一下，成功了！what！代码没问题，那是谁的问题？
难道是 cmd 的锅？ 打开 cmd 右键属性->选项一看果然，居然是`GBK`，万恶的 GBK 啊！百度了一下，在 cmd 下输入
`CHCP 65001`即可将编码转换为 utf8，在允许一下代码果然成功了，这种环境问题真的心累啊……
