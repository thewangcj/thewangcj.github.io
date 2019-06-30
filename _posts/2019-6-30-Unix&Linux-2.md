---
layout:     article

title:      "Unix/Linux 编程实践教程第二章习题"

subtitle:   ""

date:       2019-6-30

author:     "thewangcj"

header-img: ""

catalog: false

tags:
    - Linux C
---

> “仅供参考”

------
tips: 如果使用 man 查询是出现问题可能是你的 Linux 发行版没有完整的 man pages,可以通过
<pre><code class="Bash">sudo apt install manpages
sudo apt install manpages-dev
</code></pre> 安装

2.1
相比于 who 命令， w 还提供了当前时间、系统运行时间、有多少登录用户以及过去1,5和15分钟的系统负载平均值。
接下来的每一行还提供了 idle time、JCPU、PCPU 以及当前进程的位置。其中 JCPU 是由连接到 TTY 所有进程使用的时间。它不包括过去的后台任务，但包括当前正在运行的后台任务。PCPU 是 what 字段表示的进程使用的时间。这些信息来自与 `var/run/utmp` 和 `proc`。

2.2
查阅了一下 man,描述如下：Furthermore, the terminal name ~ with username  shutdown or reboot indicates a system shutdown or reboot and the pair of terminal names |/} logs the old/new system time when date(1) changes it.  wtmp is maintained  by  login(1),  init(1), and some versions of getty(8) (e.g., mingetty(8) or agetty(8)).  None of these programs creates the file,  so if it is removed, record-keeping is turned off.

2.3
执行

<pre><code class="Bash">cp who0.c /dev/tty</code></pre>
此时屏幕上会显示 who0.c 的内容，然后执行
<pre><code class="Bash">cp /dev/tty test</code></pre>
在终端输入字符，按下 `Ctrl+D` 结束输入，输入的内容全部都在 test 文件中。

2.4
在我的 deepin 上，`FILE` 在 `stdio.h` 中定义为 
<pre><code class="C++">typedef struct _IO_FILE FILE; </code></pre> 
`_IO_FILE` 在 `libio.h` 中定义为

<pre><code class="C++">struct _IO_FILE {
  int _flags
  char* _IO_read_ptr;	/* Current read pointer */
  char* _IO_read_end;	/* End of get area. */
  char* _IO_read_base;	/* Start of putback+get area. */
  char* _IO_write_base;	/* Start of put area. */
  char* _IO_write_ptr;	/* Current put pointer. */
  char* _IO_write_end;	/* End of put area. */
  char* _IO_buf_base;	/* Start of reserve area. */
  char* _IO_buf_end;	/* End of reserve area. */
  /* The following fields are used to support backing up and undo. */
  char *_IO_save_base; /* Pointer to start of non-current get area. */
  char *_IO_backup_base;  /* Pointer to first valid character of backup area */
  char *_IO_save_end; /* Pointer to end of non-current get area. */

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
#if 0
  int _blksize;
#else
  int _flags2;
#endif
  _IO_off_t _old_offset; /* This used to be _offset but it's too small.  */

#define __HAVE_COLUMN /* temporary */
  /* 1+column number of pbase(); 0 is unknown. */
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  /*  char* _save_gptr;  char* _save_egptr; */

  _IO_lock_t *_lock;
#ifdef _IO_USE_OLD_IO_FILE
};</code></pre>
其中 `_IO_buf_base` 和 `_IO_buf_end` 类似于 `utmplib.c` 中的 `utmpbuf`，`_IO_read_ptr` 类似于 `cur_rec` ，`_IO_read_ptr` 减去 `_IO_read_base` 就类似与 `num_recs`。

2.5
通过调用 `fsync` 函数可以缓冲区的内容写到文件中。

2.6
代码如下：

<pre><code class="C++">int main(int argc, char const *argv[])
{
  int fd0, fd1, fd2, n_chars;
  if ((fd0 = open(argv[1], O_RDONLY)) == -1)
    {
      perror("Cannot open file");
      return -1;
    }
    if ((fd1 = open(argv[1], O_WRONLY)) == -1)
    {
      perror("Cannot open file");
      return -1;
    }
    if ((fd2 = open(argv[1], O_RDONLY)) == -1)
    {
      perror("Cannot open file");
      return -1;
    }

    char buf[20];
    n_chars = read(fd0, buf, 20);
    printf("%s\n", buf);

    char str[] = "testing 123......";
    n_chars = write(fd1, str, strlen(str));

    n_chars = read(fd2, buf, 20);
    printf("%s\n", buf);

  return 0;
}</code></pre>
运行后fd0 正常显示，fd2 显示的内容显示 fd1 写入的内容。

2.7
`man man` 命令可以查看 man 的各种用法，一共九个章节，每个页面包含NAME,概述(SYNOPSIS),配置(CONFIGURATION),描述(DESCRIPTION),选项(OPTIONS),退出状态(EXIT STATUS),返回值(RETURN VALUE),错误(ERRORS),环境(ENVIRONMENT),文件(FILES),  版本(VERSIONS),符合标准(CONFORMING TO),注(NOTES),缺陷(BUGS),示例(EXAMPLE),作者(AUTHORS)和见(SEE ALSO).

2.8
`ut_addr_v6` 保存远程主机的网络地址，`__glibc_reserved` 是保留空间，以待未来使用。`ut_session` 是Session ID, used for windowing. 

2.9 
代码如下：
<pre><code class="C++">int main(int argc, char const *argv[])
{
  int rw_fd, n_chars;
    if ((rw_fd = open(argv[1], O_RDWR)) == -1)
    {
      perror("Cannot open file");
      return -1;
    }

    char buf[20];
    lseek(rw_fd, 100, SEEK_END);
    n_chars = read(rw_fd, buf, 20);
    printf("%s\n", buf);

    char str[] = "hello";
    lseek(rw_fd, 2000, SEEK_END);
    n_chars = write(rw_fd, str, strlen(str));

    n_chars = read(rw_fd, buf, 20);
    printf("%s\n", buf);

  return 0;
}</code></pre>
从文件末尾以后100个字节的地方开始读会显示一些乱码，但是文件大小不会变化，从100字节增加到2000字节，再写入“hello”后文件会被撑大，文件大小从 0 变成了 2005，最后的5个字节是 `hello` 的空间，前面的 2000 个字节里全部用 0 填充。