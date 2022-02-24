---
layout:     article

title:      "WSL2 设置 git 走 Windows 本地代理"

subtitle:   ""

date:       2022-2-8

author:     "thewangcj"

header-img: ""

catalog: false

tags:
    - Git 
    - WSL2 
    - Windows


---

> “WSL2 还是可以滴”

------

<!--more-->
最近升级了win11，WSL 也顺带着升级到了 WSL2，但是 WSL2 有一点非常蛋疼，IP地址不是固定的，就很难受，每次用 git 的时候设置 proxy 走 Windows 的代理都很麻烦，所以今天查了下资料，花了点时间写了个 Python 脚本来自动化的完成这个功能
注意：该脚本依赖 IPy 这个模块，需要使用下面的命令手动安装一下
```bash
sudo pip3 install IPy
```
下面是脚本的内容：
```python
# coding=utf-8

import socket
import fcntl
import struct
import os
from IPy import IP

# 本地代理端口，你的和我不一定一样，按照自己的设置改动一下
PORT = 7890


def get_ip_address(ifname):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    return socket.inet_ntoa(fcntl.ioctl(
        s.fileno(),
        0x8915,  # SIOCGIFADDR
        struct.pack(('256s').encode("utf-8"), (ifname[:15]).encode("utf-8"))
    )[20:24])


def get_windows_ip(wsl_ip):
    ip = IP(wsl_ip).make_net("20").strNormal()
    ip = ip.split('/')[0][:-1] + '1'
    return ip


def config_git_proxy(ip):
    config_str = (
        "git config --global https.proxy 'socks5://%s:%d'" % (ip, PORT))
    # print(config_str)
    ret = os.system(config_str)
    if ret:
        print("set git porxy fail")
        return
    else:
        config_str = (
            "git config --global http.proxy 'socks5://%s:%d'" % (ip, PORT))
        # print(config_str)
        ret = os.system(config_str)
    if ret:
        print("set git porxy fail")
        return
    else:
        print("set git porxy success")
        return


if __name__ == "__main__":
    wsl_ip = get_ip_address('eth0')
    windows_ip = get_windows_ip(wsl_ip)
    # print(windows_ip)
    config_git_proxy(windows_ip)

```
你可以保存为 `xxx.py` 文件，然后
```bash
 python3 xxx.py
 ```
执行完成后使用：
```bash
git config --list
```
可以查看 git 的代理是否设置成功。
要想取消代理也很简单，可以使用如下命令：
```bash
git config --global --unset http.proxy
git config --global --unset https.proxy
```
---
完。
