---
layout:     article

title:      ".gitignore配置学习"

subtitle:   ""

date:       2017-03-13

author:     "thewangcj"

header-img: "http://omt7czj31.bkt.clouddn.com/image/gitignore-poster.jpg"

catalog: false

tags:
    - Git
---

> “Github”

---
在使用 git 上传本地代码的时候，我们希望有些部分能够不上传，比如通过 npm 安装的一些包或者数据库之类的资源，毕竟天朝网络感人。
这时候一个叫 .gitignore 的文件就起作用了。

在 Windows 上创建 . 开头的文件有一些困难，可以在要创建文件所在文件夹内按住<code>Shift</code>同时右键在此处打开命令窗口，然后输入<code>echo test> .gitignore</code>

其实 .gitignore 的语法非常简单，就下面几条：
* 以斜杠“/”开头表示目录；
* 以星号“*”通配多个字符；
* 以问号“?”通配单个字符
* 以方括号“[]”包含单个字符的匹配列表；
* 以叹号“!”表示不忽略(跟踪)匹配到的文件或目录

下面以我的博客为例介绍常用的方法：
<pre><code>/test.html               #忽略当前目录下的test.html
/less                    #忽略当前目录下的less目录
test.html                #忽略所有的test.html,无论是不是当前目录下的
less/                    #忽略所有less目录中所有的内容
*.conf                   #忽略所有conf后缀文件
！/html/test.html        #不忽略html目录下的test.html
</code></pre>