---
layout:     article

title:      南大 PA 记录

subtitle:   ""

date:       2022-

author:     "thewangcj"

header-img: ""

catalog: false

tags:
    - C
---

> “”

------

<!--more-->

### 实现过程中遇到的坑：
1. 生成测试用表达式数据时可以通过 gcc 的编译输出判断表达式是否合法（除0时会报错）
2. tokens 每次求值之前记得清理或者数字字符串赋值时最后不要忘了加上 '\0'
3. check_parentheses 的作用是检查表达式有没有被一对括号包裹住而不是整个表达式的括号是否匹配，测试用的表达式都是合法的所以括号都是匹配的
4. TODO：P 调试命令没有检查表达式是否合法