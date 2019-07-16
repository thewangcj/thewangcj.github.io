---
layout:     article

title:      "Unix/Linux 编程实践教程第三章习题"

subtitle:   ""

date:       2019-7-16

author:     "thewangcj"

header-img: ""

catalog: false

tags:
    - Linux C
---

> “仅供参考”

------

#### 3.1
在我的 deepin 上，`d_name` 的长度是 256，有的系统定义成 1 是为了节省空间，使用时可以通过 `malloc()` 动态的分配空间，比如：
<pre><code class="C">struct dirent
{
   int len;
   char a[0];
};

struct dirent *fun(char *str, int len)
{
   struct dirent* n = (struct dirent*)malloc(len +1 + sizeof(struct dirent));
   if (!n)
      return NULL;
   n->len = len;
   memcpy(n->a, str, len);
   return n;
}</code></pre>
扩展了 `dirent` 后，多出来的空间在 `struct` 的尾部，可以通过 `char a[0]` 直接访问。这里使用的 `char a[0]` 相比于 `char a[1]` 更值得推荐，不会增加结构的 size，如果不需要可以不占用内存，此外 C99 之前 `a` 的长度必须是 1。定义成 `char *` 也可以，不过指针占用 `sizeof(char *)` 个字节，而且指针在申请空间之后需要初始化。

#### 3.2
经过实验，root 用户可以读

#### 3.3

#### 3.4
为目录设置`set-group-ID`位目的是方便团队合作。举个例子，user_one 的主组为 group_one,附加组为 group_two，有一个目录 directory 的所属组是 group_two，user_one 在 directory 中创建了一个新文件 file_one，如果不为 directory 目录设置 `set_group_ID` 位，file_one 的所属组将为 group_one，为了把它的所属组改为 group_two，需要执行 `chgrp` 命令，这样无疑是繁琐的。在为 directory 设置了 `set_group_ID` 位后，user_one 新创建的文件的所属组将直接是 group_two。

#### 3.5
实验后的结论：一个纯文本文件具有可执行权限也不可以执行，可执行文件没有可执行权限也不可以执行。`file` 命令可以显示文件的类型，如 `text`、`executable`、`data`。

#### 3.6 
让用户在使用的时候记住自己的用户 id 显然是不合理的，可以类比域名和 IP 地址的关系，相比于 IP 地址，域名明显更好记，用户名和用户 id 也一样。如果使用名户名来标识文件所有者，用户可一旦想要更改自己的用户名，那么就要把所有文件的信息都更新一遍，显然是不合理的，而且用户名可能会重复，这样也就起不到标识的作用，对于计算机而言，使用用户 id 节省空间，对于用户而言，使用用户名简单好记，缺一不可。

#### 3.7
`getdents`用于批量的读取目录项，有三个参数，第一个参数是目录的文件描述符，第二个参数是一个 buffer，用于存放读取的数据，第三个参数是 buffer 的大小。阅读 `getdents` 的源代码发现其调用了 `vfs_readdir` 函数，该函数又调用了 `readdir` 函数。

#### 3.8
通过命令
<pre><code class="Bash">chmod u=rw ./test
</code></pre> 更改权限后发现 `test` 文件夹下的所有文件和目录无法访问，Linux 下，目录也是一种文件，目录的可执行权限不是是否可以执行，而是是否能够进入目录。一个只读权限的目录不运行 `CD`进入目录，一个只有执行权限的目录可以进入但是不能看到目录下的内容。

#### 3.9
要获取 `login` 的源代码，首先通过
<pre><code>which loign</code></pre>
获取 `login` 命令的位置，然后通过
<pre><code>dpkg -S /usr/bin/login </code></pre>
获取其源代码所在的包，最后通过
<pre><code>apt-get login</code></pre>
下载 `login` 的源代码，其中改变终端文件所有者的函数大概可能也许是 `setup_tty`。

